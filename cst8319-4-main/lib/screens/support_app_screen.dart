import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import '../iap/contribute_products.dart';
import '../theme.dart';

/// Contribute uses five consumable App Store products.
/// Thank-you is shown only after [PurchaseStatus.purchased].
class SupportAppScreen extends StatefulWidget {
  const SupportAppScreen({super.key});

  @override
  State<SupportAppScreen> createState() => _SupportAppScreenState();
}

class _SupportAppScreenState extends State<SupportAppScreen> {
  final InAppPurchase _iap = InAppPurchase.instance;

  int? _selectedAmount;
  bool _loading = true;
  bool _purchasing = false;
  bool _purchaseSucceeded = false;
  bool _simulatorTestMode = false;
  bool _simulatorTestSucceeded = false;
  String? _error;
  Map<String, ProductDetails> _products = {};
  StreamSubscription<List<PurchaseDetails>>? _purchaseSub;

  bool get _allowDebugTestPurchase =>
      kDebugMode &&
      !kIsWeb &&
      defaultTargetPlatform == TargetPlatform.iOS;

  bool get _hasStoreProduct {
    final amount = _selectedAmount;
    if (amount == null) return false;
    return _products.containsKey(ContributeProducts.idFor(amount));
  }

  bool get _canSubmit =>
      _selectedAmount != null &&
      !_purchasing &&
      (_hasStoreProduct || _simulatorTestMode);

  @override
  void initState() {
    super.initState();
    _purchaseSub = _iap.purchaseStream.listen(
      _onPurchaseUpdates,
      onError: (Object error) {
        if (!mounted) return;
        setState(() {
          _purchasing = false;
          _error = 'The purchase could not be completed.';
        });
      },
    );
    _loadProducts();
  }

  @override
  void dispose() {
    _purchaseSub?.cancel();
    super.dispose();
  }

  Future<void> _loadProducts() async {
    setState(() {
      _loading = true;
      _error = null;
    });

    if (kIsWeb) {
      setState(() {
        _loading = false;
        _error =
            'Contributions are processed through the App Store on iPhone. This web preview cannot charge anyone.';
      });
      return;
    }

    final available = await _iap.isAvailable();
    if (!available) {
      final debugTest = _allowDebugTestPurchase;
      setState(() {
        _loading = false;
        _simulatorTestMode = debugTest;
        _error = debugTest
            ? 'Test mode: the App Store is not available in this debug session. You can still preview the flow — nothing will be charged.'
            : 'The App Store is not available on this device. Nothing will be charged.';
      });
      return;
    }

    final response = await _iap.queryProductDetails(ContributeProducts.ids);
    if (!mounted) return;

    final products = {for (final p in response.productDetails) p.id: p};
    final debugTest = _allowDebugTestPurchase && products.isEmpty;
    String? error;
    if (products.isEmpty && !debugTest) {
      error =
          'The App Store did not return contribution products. On a real iPhone, sign with Adele’s team and use a Sandbox Apple ID.';
    } else if (debugTest) {
      error =
          'Test mode: the App Store is not available in this debug session. You can still preview the flow — nothing will be charged.';
    }

    setState(() {
      _loading = false;
      _simulatorTestMode = debugTest;
      _products = products;
      _error = error;
    });
  }

  Future<void> _onPurchaseUpdates(List<PurchaseDetails> purchases) async {
    for (final purchase in purchases) {
      if (!ContributeProducts.ids.contains(purchase.productID)) {
        if (purchase.pendingCompletePurchase) {
          await _iap.completePurchase(purchase);
        }
        continue;
      }

      switch (purchase.status) {
        case PurchaseStatus.pending:
          if (mounted) setState(() => _purchasing = true);
        case PurchaseStatus.purchased:
        case PurchaseStatus.restored:
          if (purchase.pendingCompletePurchase) {
            await _iap.completePurchase(purchase);
          }
          if (mounted) {
            setState(() {
              _purchasing = false;
              _purchaseSucceeded = true;
              _error = null;
            });
          }
        case PurchaseStatus.error:
          if (purchase.pendingCompletePurchase) {
            await _iap.completePurchase(purchase);
          }
          if (mounted) {
            setState(() {
              _purchasing = false;
              _error = 'The purchase could not be completed. Nothing was charged.';
            });
          }
        case PurchaseStatus.canceled:
          if (purchase.pendingCompletePurchase) {
            await _iap.completePurchase(purchase);
          }
          if (mounted) {
            setState(() {
              _purchasing = false;
              _error = null;
            });
          }
      }
    }
  }

  Future<void> _submitContribution() async {
    if (!_canSubmit) return;

    if (_simulatorTestMode && !_hasStoreProduct) {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.surface,
            title: Text(
              'Simulator test',
              style: GoogleFonts.cormorantGaramond(
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
            content: Text(
              'This is not an App Store purchase. Nothing will be charged. Continue to see the thank-you screen?',
              style: GoogleFonts.nunito(
                color: AppColors.textSecondary,
                height: 1.5,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(
                  'Cancel',
                  style: GoogleFonts.nunito(color: AppColors.textSecondary),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: Text(
                  'Continue',
                  style: GoogleFonts.nunito(
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          );
        },
      );
      if (confirmed == true && mounted) {
        setState(() {
          _purchaseSucceeded = true;
          _simulatorTestSucceeded = true;
          _purchasing = false;
        });
      }
      return;
    }

    final product = _products[ContributeProducts.idFor(_selectedAmount!)];
    if (product == null) return;

    setState(() {
      _purchasing = true;
      _error = null;
    });

    try {
      final started = await _iap.buyConsumable(
        purchaseParam: PurchaseParam(productDetails: product),
      );
      if (!started && mounted) {
        setState(() {
          _purchasing = false;
          _error = 'The purchase could not be started. Nothing was charged.';
        });
      }
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _purchasing = false;
        _error = 'The purchase could not be started. Nothing was charged.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          'Contribute',
          style: GoogleFonts.cormorantGaramond(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: _purchaseSucceeded
            ? _buildThankYou()
            : SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: _buildContributionForm(),
              ),
      ),
    );
  }

  Widget _buildContributionForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'This app is free, and it always will be.',
          style: GoogleFonts.cormorantGaramond(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'If this resource has been useful to you and your family, and you\'re able, we invite you to make a contribution. '
          'A portion of funds goes toward keeping these and other resources growing, and another portion goes toward helping '
          'families access therapeutic support they might not otherwise be able to afford. Thank you for your generosity.',
          style: GoogleFonts.nunito(
            fontSize: 15,
            color: AppColors.textSecondary,
            height: 1.65,
          ),
        ),
        const SizedBox(height: 32),
        Text(
          'Contribution amount',
          style: GoogleFonts.nunito(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: ContributeProducts.amounts.map((amount) {
            final isSelected = _selectedAmount == amount;
            return ChoiceChip(
              label: Text('\$$amount'),
              selected: isSelected,
              showCheckmark: false,
              onSelected: _purchasing
                  ? null
                  : (_) {
                      setState(() {
                        _selectedAmount = isSelected ? null : amount;
                      });
                    },
              backgroundColor: AppColors.surface,
              selectedColor: AppColors.primary,
              labelStyle: GoogleFonts.nunito(
                color: isSelected ? Colors.white : AppColors.textPrimary,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: isSelected ? AppColors.primary : AppColors.cardBorder,
                ),
              ),
            );
          }).toList(),
        ),
        if (_loading) ...[
          const SizedBox(height: 24),
          const Center(
            child: CircularProgressIndicator(color: AppColors.primary),
          ),
        ],
        if (_error != null) ...[
          const SizedBox(height: 20),
          Text(
            _error!,
            style: GoogleFonts.nunito(
              fontSize: 14,
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
          TextButton(
            onPressed: _loading ? null : _loadProducts,
            child: Text(
              'Try again',
              style: GoogleFonts.nunito(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
        const SizedBox(height: 28),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _canSubmit ? _submitContribution : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: _purchasing
                ? const SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : Text(
                    _selectedAmount == null
                        ? 'Contribute'
                        : 'Contribute \$$_selectedAmount',
                    style: GoogleFonts.nunito(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  Widget _buildThankYou() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.check_circle_outline, color: AppColors.primary, size: 40),
            const SizedBox(height: 20),
            Text(
              'Thank you for your contribution.',
              style: GoogleFonts.cormorantGaramond(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              _simulatorTestSucceeded
                  ? 'Simulator test only. Nothing was charged.'
                  : 'Your payment was confirmed by the App Store.',
              style: GoogleFonts.nunito(
                fontSize: 15,
                color: AppColors.textSecondary,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 28),
            TextButton(
              onPressed: () {
                setState(() {
                  _purchaseSucceeded = false;
                  _simulatorTestSucceeded = false;
                  _selectedAmount = null;
                  _purchasing = false;
                });
              },
              child: Text(
                'Back to amount',
                style: GoogleFonts.nunito(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
