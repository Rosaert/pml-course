{-
PERSPECTIEVEN
De vorige opdracht was lastig, want de syntax voor perspectieven is complex.
Hieronder zie je hoe het moet.
Hoewel dit perspectief de Boodschapper laat lezen wat er op de boodschappenlijst staat, kan de hij nog niet het Aantal van de Boodschappen zien.
Tevens kan hij de de properties van een instantie van Boodschappen niet wijzigen. Behalve Consult zijn er ook de property werkwoorden 
SetPropertyValue, AddPropertyValue, RemovePropertyValue en DeleteProperty.

OPDRACHT
Verander het perspectief zo dat de Boodschapper ook het aantal kan zien en dat hij de properties kan aanpassen.

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
      perspective on Boodschappen
        props (Naam) verbs (Consult)      