{-
CONTEXTEN IN CONTEXTEN
In het domein van boodschappen doen is een lijstje heel belangrijk. Maar zodra de boodschappen zijn gedaan, kun je het lijstje weggooien.
De volgende keer dat je boodschappen gaat doen, begin je met een nieuw lijstje.
We gaan nu regelen dat we verschillende boodschappenlijsten kunnen beheren.
Dat doen we door nog een context te maken, die we BoodschappenlijstenBeheer noemen.
In die context kunnen we dan Boodschappenlijsten toevoegen en verwijderen.
In die context hebben we een gebruikersrol Beheerder die Boodschappenlijsten kan toevoegen en verwijderen.

OPDRACHT
Maak een nieuwe context BoodschappenlijstenBeheer aan, compleet met de rollen Beheerder en Boodschappenlijsten

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
        props (Naam, Aantal) verbs (Consult, SetPropertyValue)
        only (Create, Remove)