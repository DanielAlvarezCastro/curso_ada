with Adivinador;  use Adivinador;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is

   --Encapsulo la partida en un procedimiento para
   --poder volver a llamarlo.
   procedure Partida is

      --Contador de intentos
      Tries : Integer := 5;

      Numero    : Rango_Numero := 0;
      Resultado : Pista;
   begin

      Iniciar_Juego;

      Put_Line ("Guess the number between 1 and 100");
      loop

         --Bucle de intento de input
         loop
            exit when Pide_Numero(Numero);
         end loop;


         begin

            Resultado := Adivinar (Numero);

            case Resultado is
               when Correcto =>
                  Put_Line ("Hit! You win!");
                  exit;
               when Mayor =>
                  Put_Line ("Miss! Higher");
               when Menor =>
                  Put_Line ("Miss! Lower");
            end case;
         end;
         Tries := Tries - 1;
         exit when Tries = 0;
      end loop;

      --Si hemos salido del bucle sin intentos, hemos perdido
      if Tries = 0 then
         Put_Line ("You ran out of tries. You lose!");
      end if;

   end Partida;

begin
   loop
      --Iniciamos una nueva partida
      Partida;
      --Preguntamos si el usuario quiere jugar de nuevo
      Put_Line("Do you want to play again? [yes/no]");

      declare
         Response : String := Get_Line;

      begin
         --controlamos la respuesta
         if Response /= "yes" and Response /= "Yes" then
            exit;
         end if;
      end;
      end loop;

end Main;
