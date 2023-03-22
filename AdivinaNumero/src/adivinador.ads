package Adivinador is

   type Rango_Numero is new Integer range 0 .. 100;
   
   type Pista is (Mayor, Menor, Correcto);
   
   Numero_Secreto: Rango_Numero;
   
   procedure Iniciar_Juego;
   
   function Adivinar (Numero: Rango_Numero) return Pista;
   
   function Pide_Numero ( Input : in out Rango_Numero) return Boolean;

end Adivinador;
