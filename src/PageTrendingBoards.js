// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Api from "./common/Api.js";
import * as React from "react";
import * as $$Promise from "@ryyppy/rescript-promise/src/Promise.js";
import * as Js_option from "bs-platform/lib/es6/js_option.js";
import * as Belt_Result from "bs-platform/lib/es6/belt_Result.js";
import * as TrendingBoards from "./components/TrendingBoards.js";

function $$default(props) {
  return React.createElement(TrendingBoards.make, {
              data: props.hotBoards
            });
}

function getServerSideProps(_ctx) {
  return $$Promise.$$catch(Api.getHotBoards(undefined).then(function (res) {
                      return res.json();
                    }).then(function (json) {
                    var __x = ((json) => json["list"])(json);
                    return Promise.resolve({
                                TAG: 0,
                                _0: Js_option.getWithDefault([], __x),
                                [Symbol.for("name")]: "Ok"
                              });
                  }), (function (e) {
                  return {
                          TAG: 1,
                          _0: e.RE_EXN_ID === $$Promise.JsError ? Js_option.getWithDefault("", e._1.message) : "Unexpected error occurred",
                          [Symbol.for("name")]: "Error"
                        };
                })).then(function (result) {
              return Promise.resolve({
                          props: {
                            hotBoards: Belt_Result.getWithDefault(result, [])
                          }
                        });
            });
}

export {
  $$default ,
  $$default as default,
  getServerSideProps ,
  
}
/* react Not a pure module */
