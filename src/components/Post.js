// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Curry from "bs-platform/lib/es6/curry.js";
import * as React from "react";
import * as Twind from "twind";
import * as Printf from "bs-platform/lib/es6/printf.js";

function Post(Props) {
  var isFallback = Props.isFallback;
  var post = Props.post;
  var comments = Props.comments;
  var tmp;
  if (isFallback) {
    tmp = React.createElement("div", undefined, "Loading...");
  } else {
    var tmp$1;
    if (post.TAG === /* Ok */0) {
      var ok = post._0;
      tmp$1 = React.createElement(React.Fragment, undefined, React.createElement("div", undefined, ok.brdname), React.createElement("h1", undefined, ok.class, ok.title));
    } else {
      tmp$1 = React.createElement("div", undefined, post._0);
    }
    var tmp$2;
    tmp$2 = comments.TAG === /* Ok */0 ? React.createElement("ul", {
            className: Twind.tw("list-decimal")
          }, comments._0.map(function (comment) {
                return React.createElement("li", {
                            key: comment.cid
                          }, comment.content.map(function (content, i) {
                                return React.createElement("div", {
                                            key: Curry._2(Printf.sprintf({
                                                      _0: {
                                                        TAG: 2,
                                                        _0: /* No_padding */0,
                                                        _1: {
                                                          TAG: 12,
                                                          _0: /* '[' */91,
                                                          _1: {
                                                            TAG: 4,
                                                            _0: /* Int_d */0,
                                                            _1: /* No_padding */0,
                                                            _2: /* No_precision */0,
                                                            _3: {
                                                              TAG: 12,
                                                              _0: /* ']' */93,
                                                              _1: /* End_of_format */0,
                                                              [Symbol.for("name")]: "Char_literal"
                                                            },
                                                            [Symbol.for("name")]: "Int"
                                                          },
                                                          [Symbol.for("name")]: "Char_literal"
                                                        },
                                                        [Symbol.for("name")]: "String"
                                                      },
                                                      _1: "%s[%d]",
                                                      [Symbol.for("name")]: "Format"
                                                    }), comment.cid, i)
                                          }, content.map(function (content) {
                                                  return content.text;
                                                }).join(" "));
                              }));
              })) : React.createElement("div", undefined, comments._0);
    tmp = React.createElement(React.Fragment, undefined, tmp$1, tmp$2);
  }
  return React.createElement("div", undefined, tmp);
}

var make = Post;

export {
  make ,
  
}
/* react Not a pure module */
