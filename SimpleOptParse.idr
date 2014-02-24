module SimpleOptParse

import System

record Argument : Type where
  MkArgument : (short : String) ->
               (long : String) ->
               (summary : String) ->
               Argument

instance Show Argument where
  show a = long a ++ ", " ++ short a ++ "\t\t" ++ summary a

parseArgs : List String -> Vect m Argument -> Vect m (Argument, Maybe String)
parseArgs _ Nil = Nil

-- Testing stuff
argument : Argument
argument = MkArgument "-n" "--name" "Your name"

main : IO ()
main = do
  args <- getArgs
  if "--help" `List.elem` args
    then putStrLn $ show argument
    else putStrLn "hi"
