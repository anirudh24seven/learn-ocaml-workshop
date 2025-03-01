open! Base

(* We can easily write a function that adds 1 to any number.
   Recall that the infix operator (+) will add two integers.
*)

let add1 x = x + 1 

(* Let's write a function that squares its argument (multiplies it by itself) *)
let square x = x * x

(* Functions are first class in OCaml. This means that you can take
   a function and pass it around as an argument to other functions.

   Let's write a function named twice: it will take a function and apply
   that function to itself two times.

   For example, if we wanted to make an "add2" function, we could do it
   by writing:
   let add2 = twice add1

   It may be necessary to use parenthesis to specify which function is
   applied to which value. E.g.
   let add2 = add1 add1 x
   will not compile, however
   let add2 = add1 (add1 x)
   will compile.
*)

let twice f x = f (f x)

(* Now that we have twice, write add2 and raise_to_the_fourth *)

let add2 = twice add1
let raise_to_the_fourth = twice square

let%test "Testing add1..." =
  Int.(=) 5 (add1 4)

let%test "Testing square..." =
  Int.(=) 16 (square 4)

let%test "Testing square..." =
  Int.(=) 16 (square (-4))

let%test "Testing add1..." =
  Int.(=) 5 (twice add1 3)

let%test "Testing add2..." =
  Int.(=) 1337 (add2 1335)

let%test "Testing raise_to_the_fourth..." =
  Int.(=) 1 (raise_to_the_fourth 1)

let%test "Testing raise_to_the_fourth..." =
  Int.(=) 10000 (raise_to_the_fourth 10)
