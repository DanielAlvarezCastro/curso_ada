package Racionales is

   type Racional is record
      Numerador   : Integer;
      Denominador : Positive;
   end record;

   function sumar (X, Y : Racional) return Racional;
   function restar (X, Y : Racional) return Racional;
   function multiplicar (X, Y : Racional) return Racional;
   function dividir (X, Y : Racional) return Racional;
   --get_Racional ahora devuelve un booleano para reaccionar a errores;
   function get_Racional (R : out Racional) return Boolean;
   procedure put_Racional (R : Racional);
   procedure put_Racional (R : Racional; Etiqueta : Integer);
   function Simplificar (X : in out Racional) return Racional;

   --función que calcula el MCD
   function GCD (X : Integer; Y : Positive) return Integer;

   --simplifica y comprueba si un racional es un entero
   function Is_Integer (X : in out Racional) return Boolean;

end Racionales;
