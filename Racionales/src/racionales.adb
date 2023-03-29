with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Numerics;

package body Racionales is

   function sumar (X, Y : Racional) return Racional is
      sumResult : Racional;
   begin

      sumResult.Numerador := X.Numerador*Y.Denominador + X.Denominador*Y.Numerador;
      sumResult.Denominador := X.Denominador*Y.Denominador;

      return sumResult;
   end sumar;

   function restar (X, Y : Racional) return Racional is
      resResult : Racional;
   begin
      resResult.Numerador := X.Numerador*Y.Denominador - X.Denominador*Y.Numerador;
      resResult.Denominador := X.Denominador*Y.Denominador;
      return resResult;
   end restar;

   function multiplicar (X, Y : Racional) return Racional is
      mulResult : Racional;
   begin
      mulResult.Numerador := X.Numerador*Y.Numerador;
      mulResult.Denominador := X.Denominador*Y.Denominador;
      return mulResult;
   end multiplicar;

   function dividir (X, Y : Racional) return Racional is
      divResult : Racional;
   begin
      divResult.Numerador := X.Numerador*Y.Denominador;
      divResult.Denominador := X.Denominador*Y.Numerador;
      return DivResult;
   --Una excepcion en la division significa que hemos intentado dividir entre 0
   exception
      when Constraint_Error =>
         Put_Line ("MATH ERROR. No se puede dividir entre 0");
         return X;
   end dividir;

   function get_Racional (R : out Racional) return Boolean is
   begin
      Put ("Introduce el numerador: ");
      R.Numerador := Integer'Value (Get_Line);

      Put ("Introduce el denominador: ");
      R.Denominador := Integer'Value (Get_Line);

      return True;
   exception
      when Constraint_Error =>
         Put_Line ("ERROR! Por favor introduce un número válido.");
         Put_Line ("El denominador no puede ser 0 ni negativo.");
         return False;
   end Get_Racional;


   --Modificado para que simplifique y escriba un entero si es un entero
   procedure Put_Racional (R : Racional) is
      A : Racional := R;
   begin
      if Is_Integer(A) then
         Put(A.Numerador'Image);
      else
         Put(A.Numerador'Image & " /" & A.Denominador'Image);
      end if;
   end put_Racional;

   procedure put_Racional (R : Racional; Etiqueta : Integer) is
   begin
      Put("El numero (" & Etiqueta'Image & ") es: ");
      put_Racional(R);
      New_Line;
   end put_Racional;

   -- función para simplificar fracciones
   function Simplificar (X : in out Racional) return Racional is
      MCD : Integer:= GCD(X.Numerador, X.Denominador);
   begin
      X.Numerador   := X.Numerador / MCD;
      X.Denominador := X.Denominador / MCD;
      return X;

   end Simplificar;

   ---------------------------------------------------------------------------

   function GCD (X : Integer; Y : Positive) return Integer is
      A : Integer := X;
      B : Integer := Y;
      T : Integer;
   begin
      while B /= 0 loop
         T := A;
         A := B;
         B := T mod B;
      end loop;
      return A;
   end GCD;

   function Is_Integer (X : in out Racional) return Boolean is
   begin
      X:= Simplificar(X);
      if X.Denominador = 1 then
         return True;
      end if;
      return False;
   end Is_Integer;

end Racionales;
