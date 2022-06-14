module Goo = Imgoo

let esc () = print_char '\x1b'

let csi () =
  esc ();
  print_char '['

let erase_in_display code =
  let n =
    match code with
    | `EndOfDisplay -> 0
    | `BeginOfDisplay -> 1
    | `AllDisplay -> 2
  in
  csi ();
  print_int n;
  print_char 'J'

let cursor_position x y =
  csi ();
  print_int (x + 1);
  print_char ';';
  print_int (y + 1);
  print_char 'H'

let () =
  erase_in_display `AllDisplay;
  cursor_position 10 10;
  print_endline "Hello"
