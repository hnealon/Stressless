import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';

// TODO(billing): Wire to platform billing once packages are added:
//   - iOS: Apple In-App Purchase (StoreKit), single consumable product
//     with a user-entered quantity/amount, labeled "Contribute" in
//     App Store Connect.
//   - Android: Google Play Billing, same "Contribute" product label.
// This screen currently models the UI/UX flow only. The actual purchase
// call should replace `_submitContribution()`'s simulated success path.
// Per client spec: no donation language, no default/suggested amount,
// no feature gating, no visible contributor/non-contributor distinction.

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

    // TODO(billing): Replace with actual IAP / Play Billing purchase flow
    // for the "Contribute" consumable product, passing the entered amount
    // as the custom price where the platform allows it.
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
          'Support this app',
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
          'If it\'s been useful to you and your family, and you are able, '
          'we invite you to leave a contribution below. A portion goes '
          'toward keeping these and other resources growing, and a '
          'portion goes toward helping families access therapeutic '
          'support they might not otherwise be able to afford. Thank you '
          'for being here.',
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
              'Thank you for your contribution.',
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
