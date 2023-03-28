with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Racionales;          use Racionales;

procedure Main is

   N_R1 : Racional;
   N_R2 : Racional;

begin

   --Pedimos racionales hasta que recibimos dos válidos
   loop
      Put_Line ("Primer racional");
      exit when get_Racional (N_R1);
   end loop;

   loop
      Put_Line ("Segundo racional");
      exit when get_Racional (N_R2);
   end loop;

   --Los mostramos por pantalla simplificados
   put_Racional (N_R1, 1);
   put_Racional (N_R2, 2);

   --Hacemos y mostramos todas las operaciones con ellos
   Put ("Suma: ");
   put_Racional (sumar (N_R1, N_R2));
   New_Line;
   Put ("Resta: ");
   put_Racional (restar (N_R1, N_R2));
   New_Line;
   Put ("Multiplicacion: ");
   put_Racional (multiplicar (N_R1, N_R2));
   New_Line;
   Put ("Division: ");
   put_Racional (dividir (N_R1, N_R2));

end Main;
