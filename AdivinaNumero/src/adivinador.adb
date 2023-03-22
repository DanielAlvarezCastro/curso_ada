with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;
with Ada.Text_IO;               use Ada.Text_IO;

package body Adivinador is

   Semilla : Generator;

   function Convertir_A_Rango_Numero (X : Float) return Rango_Numero is
      Espectro : Rango_Numero := Rango_Numero'Last - Rango_Numero'First;
   begin
      return Rango_Numero (X * Float (Espectro)) + Rango_Numero'First;
   end Convertir_A_Rango_Numero;

   procedure Iniciar_Juego is
   begin
      Reset (Semilla);
      Numero_Secreto := Convertir_A_Rango_Numero (Random (Semilla));
   end Iniciar_Juego;

   function Adivinar (Numero : Rango_Numero) return Pista is
   begin
      if Numero = Numero_Secreto then
         return Correcto;
      elsif Numero > Numero_Secreto then
         return Menor;
      else
         return Mayor;
      end if;
   end Adivinar;


   --Esta función es mi solución para controlar que el input sea valido.
   --La funcion usa un argumento pasado por referencia para darle un
   --valor a la variable que se usará en el main. He usado un argumento
   --por referencia en lugar de que simplemente la función devuelva el
   --input porque he usado el return para devolver un booleano para
   --para controlar si la entrada ha sido exitosa. De no ser exitosa
   --la captura de la excepcion devuelve falso, y se sigue preguntando
   --por un input valido en el main.

   function Pide_Numero ( Input : in out Rango_Numero) return Boolean is
   begin
      Put ("Type your guess: ");
      Input := Rango_Numero'Value (Get_Line);
      return true;
   exception
      when Constraint_Error =>
         Put_Line ("Invalid number. Please try again.");
         return false;
   end Pide_Numero;

end Adivinador;
