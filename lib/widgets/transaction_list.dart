import '../models/transaction.dart';
import 'package:flutter/material.dart';
import './transaction_item.dart';
// import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  TransactionList(this.transactions, this.deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  Text(
                    'NO Transaction added yet',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset('assets/images/waiting.png'),
                  ),
                ],
              );
            },
          )
        // : ListView.builder(
        //     itemBuilder: (ctx, index) {
        // return Card(
        //   child: Row(
        //     children: [
        //       Container(
        //         margin: EdgeInsets.symmetric(
        //           vertical: 10,
        //           horizontal: 15,
        //         ),
        //         decoration: BoxDecoration(
        //           border: Border.all(
        //             color: Theme.of(context).primaryColor,
        //             width: 2,
        //           ),
        //         ),
        //         padding: EdgeInsets.all(10),
        //         child: Text(
        //           '\$${transactions[index].amount.toStringAsFixed(2)}', //shorter and better way then + concatination
        //           // '\$' + e.amount.toString(), // longer way
        //           style: TextStyle(
        //             fontWeight: FontWeight.bold,
        //             fontSize: 20,
        //             color: Theme.of(context).primaryColorDark,
        //           ),
        //         ),
        //       ),
        //       Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         // mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Text(
        //             transactions[index].title,
        //             // style: TextStyle(
        //             //   fontSize: 16,
        //             //   fontWeight: FontWeight.bold,
        //             // ),
        //             style: Theme.of(context).textTheme.headline6,
        //           ),
        //           Text(
        //             // e.date.toString(),
        //             DateFormat.yMMMd().format(transactions[index].date),
        //             style: TextStyle(
        //               color: Colors.grey,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // );
        //TransactionItem return last is itemCOunt length....
        //   return TransactionItem(
        //       transactions: transactions[index],
        //       deleteTransaction: deleteTransaction);
        // },
        // itemCount: transactions.length,
        //listview children with map.........
        : ListView(
            children: transactions.map((e) {
              return TransactionItem(
                key: ValueKey(e.id),
                transactions: e,
                deleteTransaction: deleteTransaction,
              );
            }).toList(),
          );
  }
}
