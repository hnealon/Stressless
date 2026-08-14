import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme.dart';

// ============================================================
// TODO(billing): Enable real payments before release.
// ============================================================
// This screen currently models the UI/UX flow only — no real
// purchase is made. `_submitContribution()` simulates success.
//
// UI (current): preset amounts $5–$100 PLUS optional custom
// amount entry (minimum $5, no $100 cap). Still UI-only until
// billing is wired. Note: store IAP usually needs fixed product
// tiers; custom amounts may require a different payment path.
//
// Steps required to go live: see prior checklist in git history /
// README (Apple/Google agreements, IAP products, in_app_purchase).
//
// BEFORE SUBMISSION
// - Re-check Adele's checklist: no "donate" language in UI copy,
//   no feature gating, single entry point, no contributor
//   distinction.
// ============================================================
class SupportAppScreen extends StatefulWidget {
  const SupportAppScreen({super.key});

  @override
  State<SupportAppScreen> createState() => _SupportAppScreenState();
}

class _SupportAppScreenState extends State<SupportAppScreen> {
  /// Preset Contribute amounts from $5 to $100 (UI only for now).
  static const List<int> _presetAmounts = [5, 10, 25, 50, 75, 100];
  static const double _minAmount = 5;

  final TextEditingController _customAmountController = TextEditingController();
  final FocusNode _customFocusNode = FocusNode();

  int? _selectedPreset;
  bool _isSubmitting = false;
  bool _showThankYou = false;

  @override
  void initState() {
    super.initState();
    _customFocusNode.addListener(() {
      if (_customFocusNode.hasFocus && _selectedPreset != null) {
        setState(() => _selectedPreset = null);
      }
    });
  }

  @override
  void dispose() {
    _customAmountController.dispose();
    _customFocusNode.dispose();
    super.dispose();
  }

  /// Resolved amount from preset chip or custom field.
  double? get _resolvedAmount {
    if (_selectedPreset != null) {
      return _selectedPreset!.toDouble();
    }
    final text = _customAmountController.text.trim();
    if (text.isEmpty) return null;
    final value = double.tryParse(text);
    if (value == null) return null;
    if (value < _minAmount) return null;
    return value;
  }

  bool get _canSubmit => _resolvedAmount != null;

  String get _amountLabel {
    final amount = _resolvedAmount;
    if (amount == null) return 'Contribute';
    if (amount == amount.roundToDouble()) {
      return 'Contribute \$${amount.toInt()}';
    }
    return 'Contribute \$${amount.toStringAsFixed(2)}';
  }

  String? get _customErrorText {
    final text = _customAmountController.text.trim();
    if (text.isEmpty) return null;
    final value = double.tryParse(text);
    if (value == null) return 'Enter a valid amount';
    if (value < _minAmount) {
      return 'Please enter at least \$${_minAmount.toInt()}';
    }
    return null;
  }

  void _selectPreset(int amount) {
    setState(() {
      _selectedPreset = amount;
      _customAmountController.clear();
    });
    _customFocusNode.unfocus();
  }

  Future<void> _submitContribution() async {
    if (!_canSubmit) return;

    setState(() => _isSubmitting = true);

    // TODO(billing): replace with real purchase / donation call.
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
    final customError = _customErrorText;

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
          'If this resource has been useful to you and your family, and you\'re able, '
          'we invite you to make a contribution. A portion of funds goes toward keeping '
          'these and other resources growing, and another portion goes toward helping '
          'families access therapeutic support they might not otherwise be able to afford. '
          'Thank you for your generosity.',
          style: GoogleFonts.nunito(
            fontSize: 15,
            color: AppColors.textSecondary,
            height: 1.65,
          ),
        ),
        const SizedBox(height: 32),
        Text(
          'Choose an amount',
          style: GoogleFonts.nunito(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Select a preset, or enter a custom amount (minimum \$${_minAmount.toInt()}; amounts over \$100 are welcome).',
          style: GoogleFonts.nunito(
            fontSize: 13,
            color: AppColors.textLight,
          ),
        ),
        const SizedBox(height: 14),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: _presetAmounts.map((amount) {
            final selected = _selectedPreset == amount;
            return ChoiceChip(
              label: Text('\$$amount'),
              selected: selected,
              onSelected: (_) => _selectPreset(amount),
              selectedColor: AppColors.primary.withValues(alpha: 0.18),
              backgroundColor: AppColors.surface,
              side: BorderSide(
                color: selected ? AppColors.primary : AppColors.cardBorder,
                width: selected ? 1.5 : 1,
              ),
              labelStyle: GoogleFonts.nunito(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: selected ? AppColors.primary : AppColors.textPrimary,
              ),
              showCheckmark: false,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
        Text(
          'Or enter a custom amount',
          style: GoogleFonts.nunito(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _customAmountController,
          focusNode: _customFocusNode,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
          ],
          onChanged: (_) {
            setState(() {
              if (_customAmountController.text.trim().isNotEmpty) {
                _selectedPreset = null;
              }
            });
          },
          style: GoogleFonts.nunito(fontSize: 16, color: AppColors.textPrimary),
          decoration: InputDecoration(
            prefixText: '\$ ',
            hintText: 'e.g. 15',
            hintStyle: GoogleFonts.nunito(color: AppColors.textLight),
            errorText: customError,
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
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.redAccent),
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
                    _amountLabel,
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
