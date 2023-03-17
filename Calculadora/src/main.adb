with Ada.Text_IO;           use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

procedure Main is

   NumA, NumB, operator : Unbounded_String;
   A, B, Result         : Integer;

begin
   loop
      --Pedimos el primer numero
      Put_Line ("Introduce el primer operando: ");
      NumA := To_Unbounded_String (Get_Line);
      --Comprobamos la condicion de salida
      exit when To_String (NumA) = "";
      --Pedimos segundo numero
      Put_Line ("Introduce el segundo operando: ");
      NumB := To_Unbounded_String (Get_Line);
      --Convertimos los numeros_cadena en numeros enteros
      A := Integer'Value (To_String (NumA));
      B := Integer'Value (To_String (NumB));
      --Pedimos el operador hasta que se introduzca uno valido
      loop
         Put_Line ("Introduce la operación deseada (+ - * / ^)");
         operator := To_Unbounded_String (Get_Line);
         --Comprobamos el operador y calculamos el resultado
         --(Aqui idealmente hubiera usado un Case, pero Case no
         --admite comparaciones de strings, solo admite tipos discretos.
         --Encontre soluciones creando un nuevo tipo enumerado, pero
         --decidi no usarlo ya que aun no los hemos visto).
         if To_String (operator) = "+" then
            Result := A + B;
            exit;
         elsif To_String (operator) = "-" then
            Result := A - B;
            exit;
         elsif To_String (operator) = "*" then
            Result := A * B;
            exit;
         elsif To_String (operator) = "/" then
            Result := A / B;
            exit;
         elsif To_String (operator) = "^" then
            Result := A**B;
            exit;
         else
            Put_Line ("Simbolo incorrecto, por favor prueba otra vez");
         end if;
      end loop;
      --Imprimimos el resultado
      Put
        (To_String (NumA) & " " & To_String (operator) & " " &
         To_String (NumB) & " =");
      Put_Line (Result'Image);

   end loop;
   --Nos despedimos al salir
   Put_Line ("Gracias por usar la calculadora! Goodbye!");
--Capturamos las posibles excepciones
exception
   when Constraint_Error =>
      Put_Line ("Algun operando es incorrecto...o dividiste algo entre 0");
end Main;
