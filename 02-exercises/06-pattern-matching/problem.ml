open! Base

(* Pattern matching lets us compare inputs to known values.
   Patterns following "|" are tested in order.
   On the first match, we use the result following "->".
   The "_" pattern means "could be anything".
*)
let is_superman x =
  match x with
  | "Clark Kent" -> true
  | _ -> false
;;

(* We can also pattern match on multiple values at the same time. *)
let is_same_person x y = 
  match x, y with 
  | "Clark Kent", "Superman" 
  | "Peter Parker", "Spiderman" -> true
  | _ -> false
;;

(* Let's use our own pattern matching. Write a function that returns
   whether x is non zero by matching on x *)
let non_zero x = 
  match x with
  | 0 -> false
  | _ -> true 
;;

let%test "Testing non_zero..." = Bool.( = ) false (non_zero 0)
let%test "Testing non_zero..." = Bool.( = ) true (non_zero 500)
let%test "Testing non_zero..." = Bool.( = ) true (non_zero (-400))

(* Now, write a function that returns true if x and y are both
   non-zero by matching on both of them. *)
let both_non_zero x y = 
  match x, y with
  | 0, _ -> false
  | _, 0 -> false
  | _, _ -> true
;;

let%test "Testing both_non_zero..." = Bool.( = ) false (both_non_zero 0 0)
let%test "Testing both_non_zero..." = Bool.( = ) false (both_non_zero 0 1)
let%test "Testing both_non_zero..." = Bool.( = ) false (both_non_zero (-20) 0)
let%test "Testing both_non_zero..." = Bool.( = ) true (both_non_zero 400 (-5))
