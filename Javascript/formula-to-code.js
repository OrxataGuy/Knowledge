/*
###########################################################################################################
#                                                                                                         #
#   Author: OrxataGuy                                                                                     #
#   Tested on: Firefox 84.0.2                                                                             #
#                                                                                                         #
#   Description:                                                                                          #
#   This function will transform a generic formula expression to a ternary expression compatible with     #
#   javascript. For exemple:                                                                              #
#                                                                                                         #
#   var a = 2.4; var b = 4.2; var c = (a+b)*100+6;                                                        #
#   var formula = `if(${a}>${b}, if(${a}>2*${b}, 'A is too large', 'A is larger'),if(${c}==666,           #
#    'Oh no! A demon!', 'B is larger'))`;                                                                 #
#                                                                                                         #
#   parseExpr(formula) ->                                                                                 #
#   (2.4>4.2)?((2.4>2*4.2)?'A is too large':'A is larger'):((666==666)?'Oh no! A demon!':'B is larger')   #
#                                                                                                         #
#                                                                                                         #
#   Advice: If you're going to use it with strings, please prevent using comma `,` or strings containing  #
#   an `if` substring, because that would cause a malfunction of the code. It's a known bug.              #
#                                                                                                         #
###########################################################################################################
*/

let parseExpr = exp => {
  var aux = '';
  exp.split(',').forEach(o => aux += (o.match(/<=|<|>=|>|=/g) != null) ? "(" + o.replaceAll("if","") + ") ? " : o + " : ");
  return (exp.trim()[0]=="i") ? aux.substring(1, aux.lastIndexOf(':')-2) : aux.substring(0, aux.lastIndexOf(':'));
}
