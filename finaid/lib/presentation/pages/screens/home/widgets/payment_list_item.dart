
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../../domain/model/payment.model.dart';
import '../../../../../utils/theme/colors.dart';
import '../../../widgets/currency.dart';


class PaymentListItem extends StatelessWidget{
  final Payment payment;
  final VoidCallback onTap;
  const PaymentListItem({super.key, required this.payment, required this.onTap});

  @override
  Widget build(BuildContext context) {
    bool isCredit = payment.type == PaymentType.credit ;
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      onTap: onTap,
      leading: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: payment.category.color.withOpacity(0.1),
          ),
          child:  Icon( payment.category.icon, size: 22, color: payment.category.color,)
      ),
      title: Text(payment.category.name, style: Theme.of(context).textTheme.bodyMedium?.merge(const TextStyle(fontWeight: FontWeight.w500)),),
      subtitle: Text.rich(
        TextSpan(
            children: [
              TextSpan(text: (DateFormat("dd MMM yyyy, HH:mm").format(payment.datetime))),
            ],
            style: Theme.of(context).textTheme.bodySmall?.apply(color: Colors.grey, overflow: TextOverflow.ellipsis)
        ),
      ),
      trailing: CurrencyText(
          isCredit? payment.amount : -payment.amount,
          style: Theme.of(context).textTheme.bodyMedium?.apply(color: isCredit? ThemeColors.success:ThemeColors.error, fontFamily: GoogleFonts.manrope().fontFamily)
      ),
    ) ;
  }

}