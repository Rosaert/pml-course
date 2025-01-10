{-
NAMEN, INDENTERING, NAMESPACE
Zowel de rol Boodschappen als de rol Boodschapper hebben een property Naam. Betekent dat dat dit dezelfde property is?
Neen. 
Hoewel ze in de leesbare tekst precies hetzelfde zijn, worden ze door de compiler beschouwd als twee volkomen aparte properties.
Om ze uit elkaar te houden, plaatst de compiler elk in een eigen namespace. Die namespace is de naam van de rol waarin de property staat.
Tussen beide wordt een dollar-teken geplaatst.
Kortom, het model hieronder heeft twee properties: Boodschappen$Naam en Boodschapper$Naam.

Maar datzelfde geldt eigenlijk ook voor de rollen. De compiler plaatst ze in een namespace die gelijk is aan de naam van de context.
En het geldt ook voor contexten, tot en met het domain toe. Dus eigenlijk heten beide properties:
  * model://joopringelberg.nl#Boodschappenlijst$Boodschappen$Naam
  * model://joopringelberg.nl#Boodschappenlijst$Boodschapper$Naam.
Hier zie je in actie hoe namespaces werken en ertoe leiden dat een typenaam op het open internet zowel uniek is, als vindbaar is. 
Uit de domein component kan MyContexts afleiden waar het model staat, dat ophalen en vervolgens de juiste property erin vinden.

Corrigeer zo nodig je eigen modeltekst en voeg de property Aantal toe aan de rol Boodschappen.

Ga nu naar de volgende opdracht.
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