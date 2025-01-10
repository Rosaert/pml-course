{-
PROPERTIES
We gaan het rudimentaire model nu verfijnen met 'properties'. Alleen rollen hebben properties (er is een manier om contexten properties te geven, maar dat is voor later).
Je beschrijft een property met het sleutelwoord 'property'. Een property heeft een naam en een range. 
Het aantal soorten ranges is beperkt. De belangrijkste zijn: String, Number, Date, DateTime, Boolean, URL, Email, File. Zie de referentie documenten voor een volledige lijst.
Een property is altijd ingebed in een roltype. In de modeltekst geef je dat aan met een extra indentering.

OPDRACHT
Voeg een property toe aan de rol 'Boodschappen'. Geef die property de naam 'Naam' en als range 'String'.
Voeg ook een naam property toe aan Boodschapper.
-}

-------------------------------------------------------------------------------
-- MODEL TOT NOG TOE
-------------------------------------------------------------------------------
-- Firstname Lastname. mm/dd/yyyy.
domain model://joopringelberg.nl#Boodschappenlijst

  case Boodschappenlijst
    thing Boodschappen
    user Boodschapper
