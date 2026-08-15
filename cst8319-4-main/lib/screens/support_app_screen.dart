import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';

// ============================================================
// TODO(billing): Enable real payments before release.
// ============================================================
// This screen currently models the UI/UX flow only — no real
// purchase is made. `_submitContribution()` must NOT show a
// thank-you that implies money moved. Amounts are fixed tiers:
// $5, $10, $25, $50, $100 (issue #5). No amount is pre-selected.
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
  static const List<int> _amountOptions = [5, 10, 25, 50, 100];

  int? _selectedAmount;
  bool _showPreviewNotice = false;

  bool get _canSubmit => _selectedAmount != null;

  void _submitContribution() {
    if (!_canSubmit) return;
    // TODO(billing): replace with real IAP / Play Billing purchase call.
    // See file header for full integration checklist.
    // Do not show a paid thank-you until a purchase is confirmed.
    setState(() => _showPreviewNotice = true);
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
        child: _showPreviewNotice
            ? _buildPreviewNotice()
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
        const SizedBox(height: 16),
        Text(
          'Payment processing is not live in this version. You can preview the amount, but nothing will be charged.',
          style: GoogleFonts.nunito(
            fontSize: 14,
            color: AppColors.textSecondary,
            height: 1.5,
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
          children: _amountOptions.map((amount) {
            final isSelected = _selectedAmount == amount;
            return ChoiceChip(
              label: Text('\$$amount'),
              selected: isSelected,
              showCheckmark: false,
              onSelected: (_) {
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
            child: Text(
              'Preview contribution',
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

  Widget _buildPreviewNotice() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.info_outline, color: AppColors.primary, size: 40),
            const SizedBox(height: 20),
            Text(
              'Nothing was charged.',
              style: GoogleFonts.cormorantGaramond(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'Payment processing is not connected yet. This screen is a preview only.',
              style: GoogleFonts.nunito(
                fontSize: 15,
                color: AppColors.textSecondary,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 28),
            TextButton(
              onPressed: () => setState(() => _showPreviewNotice = false),
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
