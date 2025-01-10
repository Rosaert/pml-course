{-
HOE WORD JE EEN USER?
We hebben nu een model waarin we lijsten van Boodschappenlijsten kunnen beheren. In beide contexten hebben we gebruikersrollen.
Langzamerhand moeten we gaan nadenken hoe zo'n model in de praktijk gaat werken.
Je hebt nu een heel aantal keren je model geupload in MyContexts. Je hebt gezien dat MyContexts diverse 'apps' heeft, zoals CouchdbManagement, 
waarmee je onder andere modellen kunt beheren.

Hoe kunnen we het model Boodschappenlijst aan MyContexts toevoegen als een 'app'?
We gaan daar stapsgewijs naartoe werken.
De eerste stap is dat we ons afvragen hoe we de Beheerder van BoodschappenlijstenBeheer kunnen worden.

MyContexts draait op diverse modellen. Eén ervan is het System model. Dat model bevat een rol voor gebruikers van MyContexts / Perspectives: 
de rol PerspectivesUsers. Neem op gezag aan dat als je MyContexts gebruikt, je vanzelf de rol PerspectivesUsers krijgt. Die heb je altijd: je hoeft
er niets voor te doen.

Zoals we contexten kunnen verbinden, zo kunnen we ook user rollen met elkaar verbinden. We kunnen daar ook het sleutelwoord 'filledBy' voor gebruiken,
maar in eerste instantie volgen we een andere, eenvoudiger weg.

OPDRACHT
Tik achter 'user Beheerder' de tekst '= sys:SocialMe'. Upload je bestand. Lees eventuele feedback. Ga naar de volgende opdracht.
-}

-------------------------------------------------------------------------------
-- MODEL TOT NOG TOE
-------------------------------------------------------------------------------
-- Firstname Lastname. mm/dd/yyyy.
domain model://joopringelberg.nl#Boodschappenlijst

  case BoodschappenlijstenBeheer
    user Beheerder
      perspective on Boodschappenlijsten
        only (Create, Remove)
        props (Datum) verbs (Consult, SetPropertyValue)
    context Boodschappenlijsten filledBy Boodschappenlijst
      property Datum (Date)

  case Boodschappenlijst
    thing Boodschappen
      property Naam (String)
      property Aantal (Number)
    user Boodschapper
      property Naam (String)
      perspective on Boodschappen
        props (Naam, Aantal) verbs (Consult, SetPropertyValue)
        only (Create, Remove)