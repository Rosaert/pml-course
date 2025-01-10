{-
PERSPECTIEVEN
Er is een groot verschil tussen user- en thingrollen. Een userrol is een rol die door een gebruiker van het systeem wordt gespeeld.
Zo'n gebruiker wil dingen op het scherm zien en kunnen veranderen.
In ons model moeten we aangeven wat de Boodschapper kan zien en veranderen.

Je gebruikt daarvoor de sleutelwoorden 'perspective on', gevolgd door de rol waar het perspectief geldt.
Op de volgende regel gebruik je 'props', gevolgd door een lijst van de eigenschappen die de Boodschapper kan zien.
Op dezelfde regel moet je ook aangeven welke dingen de Boodschapper met die eigenschappen kan doen. Je gebruikt daarvoor het sleutelwoord 'verbs'
gevolgd door een lijst van werkwoorden, zoals 'Consult'.

OPDRACHT
Probeer voor de Boodschapper een perspectief te maken. Geef aan dat de Boodschapper de Naam van de Boodschappen kan zien.

Bewaar je bestand en upload het. Lees de feedback en ga naar de volgende opdracht.
-}
-------------------------------------------------------------------------------
-- MODEL TOT NOG TOE
-------------------------------------------------------------------------------
-- Firstname Lastname. mm/dd/yyyy.
domain model://joopringelberg.nl#Boodschappenlijst

  case Boodschappenlijst
    thing Boodschappen
      property Naam (String)
      property Aantal (Number)
    user Boodschapper
      property Naam (String)