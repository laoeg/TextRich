import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

typedef TapCallBack = Function(String value);

class Node {
  final int start;
  final String element;
  final int end;
  final int styleIndex;

  Node(this.start, this.element, this.end, this.styleIndex);
}

class TextRich extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final List<String>? matchTexts;
  final List<TextStyle>? matchStyles;
  final TapCallBack? onTap;

  const TextRich(this.text, {this.style, this.matchTexts, this.matchStyles, this.onTap, Key? key})
      : assert(
  (matchTexts == null && matchStyles == null) ||
      (matchTexts != null &&
          matchTexts.length > 0 &&
          matchStyles != null &&
          matchTexts.length >= matchStyles.length),
  "match text length must greater than match style length and all length must greater than 1"),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TextSpan> textSpanChildren = [];
    int lastIndex = text.length;
    if (matchStyles != null && matchTexts != null) {
      ///1.获取所有的匹配字符串
      List<Node> allNodes = [];
      for (var i = 0; i < matchTexts!.length; i++) {
        var regExp = RegExp(matchTexts![i]);
        var matches = regExp.allMatches(text);
        var nodes = matches.map((e) {
          var element = e.group(0);
          return Node(e.start, element ?? "", e.end, i);
        }).toList();
        allNodes.addAll(nodes);
      }

      ///2.按在text中的下标从小到大排序
      var result = allNodes.sorted((c, n) {
        return c.start.compareTo(n.start);
      });


      for (int i1 = result.length - 1; i1 >= 0; i1--) {
        var node = result[i1];
        Node? lastNode = null;
        if(node.start>=lastIndex){

          // textSpanChildren.removeLast();
          // if(lastNode != null) {
          //   textSpanChildren.add(TextSpan(
          //       text: node.element.substring(0, node.start - lastIndex + 1), style: matchStyles![lastNode.styleIndex]));
          // }
          // var r = null;
          // if (this.onTap != null) {
          //   r = TapGestureRecognizer()
          //     ..onTap = () {
          //       this.onTap?.call(node.element);
          //     };
          // }
          // textSpanChildren.add(TextSpan(
          //     text: node.element.substring(node.start-lastIndex+1),
          //     style: matchStyles![node.styleIndex >= matchStyles!.length ? matchStyles!.length - 1 : node.styleIndex],
          //     recognizer: r));
          continue;
        }
        lastNode = node;
        var end = min(lastIndex, node.end);
        textSpanChildren.add(TextSpan(text: text.substring(end, lastIndex)));
        lastIndex = node.start;
        var r = null;
        if (this.onTap != null) {
          r = TapGestureRecognizer()
            ..onTap = () {
              this.onTap?.call(node.element);
            };
        }
        textSpanChildren.add(TextSpan(
            text: text.substring(node.start, end),
            style: matchStyles![node.styleIndex >= matchStyles!.length ? matchStyles!.length - 1 : node.styleIndex],
            recognizer: r));
      }

      ///3.合并相同元素，合并部分字符串重叠元素
      // List<Node> datas = [];
      // for (int j = 0; j < result.length; j++) {
      //   var node = result[j];
      //   if (datas.length == 0) {
      //     datas.add(node);
      //   } else {
      //     var current = datas.last;
      //     var next = node;
      //     if (next.start - current.end > 0) {
      //       datas.add(next);
      //     } else {
      //       if (current.element == next.element) {
      //         continue;
      //       } else {
      //         datas.removeLast();
      //         datas.add(Node(current.start, current.element + next.element.substring(current.end - next.start),
      //             next.end, next.styleIndex));
      //       }
      //     }
      //   }
      // }
      //
      // ///4.生成widget列表
      // for (var i = 0; i < datas.length; i++) {
      //   if (datas[i].element.isEmpty) {
      //     continue;
      //   }
      //   int index = text.indexOf(datas[i].element);
      //   textSpanChildren.add(TextSpan(text: text.substring(lastIndex, index)));
      //   lastIndex = index + datas[i].element.length;
      //   var r = null;
      //   if (this.onTap != null) {
      //     r = TapGestureRecognizer()
      //       ..onTap = () {
      //         this.onTap?.call(datas[i].element);
      //       };
      //   }
      //   textSpanChildren.add(TextSpan(
      //       text: datas[i].element,
      //       style: matchStyles![datas[i].styleIndex >= matchStyles!.length ? matchStyles!.length-1 : datas[i].styleIndex],
      //       recognizer: r));
      // }
    }
    if (lastIndex != 0) {
      textSpanChildren.add(TextSpan(text: text.substring(0, lastIndex)));
    }
    return Text.rich(
      TextSpan(children: textSpanChildren.reversed.toList()),
      style: style,
    );
  }
}
