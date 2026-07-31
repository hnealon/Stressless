import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';

// ============================================================
// TODO(billing): Enable real payments before release.
// ============================================================
// This screen currently models the UI/UX flow only — no real
// purchase is made. `_submitContribution()` simulates success.
//
// Steps required to go live:
//
// 1. PLATFORM ACCOUNTS (do first, takes days, not minutes)
//    - Apple: enroll in Apple Developer Program, complete the
//      Paid Applications Agreement in App Store Connect
//      (Agreements, Tax, and Banking), submit banking + tax info.
//    - Google: set up a Google Payments merchant account via
//      Play Console > Monetization, submit banking + tax info.
//    Both require account-level setup and verification lag time.
//
// 2. CREATE IAP PRODUCT LISTINGS
//    - iOS: App Store Connect > In-App Purchases > Consumable,
//      labeled "Contribute". NOTE: Apple IAP may not natively
//      support arbitrary user-entered amounts. Confirm whether
//      true custom-amount entry is possible, or whether this
//      needs fixed-price tiers instead.
//    - Android: Play Console > Monetize > In-app products,
//      same "Contribute" label.
//
// 3. FLUTTER INTEGRATION
//    - Add the `in_app_purchase` package.
//    - Implement product query (queryProductDetails), purchase
//      call (buyConsumable), and a purchase stream listener for
//      success/failure/cancellation.
//    - Android requires explicitly acknowledging/consuming the
//      purchase, or it auto-refunds after 3 days. iOS requires
//      finishing the transaction.
//    - Replace _submitContribution() below with the real call.
//    - Only show the thank you state on a CONFIRMED successful
//      purchase callback, not optimistically.
//
// 4. TESTING
//    - iOS: Sandbox Tester accounts (App Store Connect).
//    - Android: License Testing accounts (Play Console internal
//      testing track).
//    - Test cancellation/failure paths, not just the happy path.
//
// 5. BEFORE SUBMISSION
//    - Re-check against Adele's checklist: no "donate" language,
//      no default/suggested amount, no feature gating, single
//      non-repeated entry point, no contributor/non-contributor
//      visible distinction.
// ============================================================
class SupportAppScreen extends StatefulWidget {
  const SupportAppScreen({super.key});

  @override
  State<SupportAppScreen> createState() => _SupportAppScreenState();
}

class _SupportAppScreenState extends State<SupportAppScreen> {
  final TextEditingController _amountController = TextEditingController();
  bool _isSubmitting = false;
  bool _showThankYou = false;

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  bool get _canSubmit {
    final text = _amountController.text.trim();
    if (text.isEmpty) return false;
    final value = double.tryParse(text);
    return value != null && value > 0;
  }

  Future<void> _submitContribution() async {
    if (!_canSubmit) return;

    setState(() => _isSubmitting = true);

    // TODO(billing): replace with real IAP / Play Billing purchase call.
    // See file header for full integration checklist.
    await Future.delayed(const Duration(milliseconds: 800));

    if (!mounted) return;
    setState(() {
      _isSubmitting = false;
      _showThankYou = true;
    });
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
        child: _showThankYou
            ? _buildThankYouState()
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
          'If this resource has been useful to you and your family, and you\'re able, we invite you to make a contribution.'
          ' A portion of funds goes toward keeping these and other resources growing, and another portion goes toward helping '
          'families access therapeutic support they might not otherwise be able to afford. Thank you for your generosity ',
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
        const SizedBox(height: 10),
        TextField(
          controller: _amountController,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          onChanged: (_) => setState(() {}),
          style: GoogleFonts.nunito(fontSize: 16, color: AppColors.textPrimary),
          decoration: InputDecoration(
            prefixText: '\$ ',
            hintText: 'Enter an amount',
            hintStyle: GoogleFonts.nunito(color: AppColors.textLight),
            filled: true,
            fillColor: AppColors.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.cardBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.cardBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.primary, width: 1.5),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
          ),
        ),
        const SizedBox(height: 28),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _canSubmit && !_isSubmitting
                ? _submitContribution
                : null,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: _isSubmitting
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : Text(
                    'Contribute',
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

  Widget _buildThankYouState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.favorite, color: AppColors.primary, size: 40),
            const SizedBox(height: 20),
            Text(
              'Thank you very much for your contribution.',
              style: GoogleFonts.cormorantGaramond(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
