{-
We hebben nu geregeld dat je automatisch de Beheerder rol hebt in BoodschappenlijstenBeheer. 
Maar dan moet er wel een instantie van BoodschappenlijstenBeheer zijn!
We moeten regelen dat er een instantie van BoodschappenlijstenBeheer wordt aangemaakt als je het model toevoegt aan je installatie.
Dat is tamelijk complex. Ik leg daarom uit wat de bedoeling is en geef je dan een modelfragment dat je moet toevoegen aan je model.
Dit fragment is een soort pre-ambule die (met kleine wijzigingen) in elk model moet worden opgenomen
In de loop van de cursus leer je alle benodigde technieken om dit te kunnen begrjpen en zelf te kunnen doen.

Je herinnert je nog wel dat het domein óók een context-type is. Twee dingen zijn belangrijk:
1. Als MyContext een model laadt, maakt het programma een instantie van dat context-type aan (dat gebeurt namens jou, je hoeft er niets voor te doen).
2. Het is mogelijk om in je model aan te geven dat iets moet gebeuren als een context of rol wordt aangemaakt.
Die twee tellen bij elkaar op tot de mogelijkheid om iets automatisch te laten gebeuren als een model in gebruik wordt genomen in een MyContexts installatie.
(LET OP: alleen de allereerste keer dat je een model in gebruik neemt, gebeurt dit. Als je een model actualiseert, gebeurt het niet.)

In de pre-ambule nemen we daarom op dat er een instantie van BoodschappenlijstenBeheer moet worden aangemaakt als het model wordt geladen.
Omdat je daarin automatisch de Beheerder-rol hebt, kun je daarna direct aan de slag.

OPDRACHT
Neem het volgende fragment over in je model (en let op de indentering!). Upload je model. Lees de feedback. Ga naar de volgende opdracht.

-------------------------------------------------------------------------------
  ---- PREAMBULE
  -------------------------------------------------------------------------------
  state ReadyToInstall = exists sys:PerspectivesSystem$Installer
    on entry
      do for sys:PerspectivesSystem$Installer
        letA
          app <- create context BoodschappenlijstenBeheer
          start <- create role StartContexts in sys:MySystem
        in
          bind_ app >> extern to start
          Name = "Boodschappen lijsten" for start

  aspect user sys:PerspectivesSystem$Installer  
  -------------------------------------------------------------------------------
  ---- END OF PREAMBULE
  -------------------------------------------------------------------------------
  
  -}

-------------------------------------------------------------------------------
-- MODEL TOT NOG TOE
-------------------------------------------------------------------------------
-- Firstname Lastname. mm/dd/yyyy.
domain model://joopringelberg.nl#Boodschappenlijst
  use bl for model://joopringelberg.nl#Boodschappenlijst

  case BoodschappenlijstenBeheer
    user Beheerder = sys:SocialMe
      perspective on Boodschappenlijsten
        only (Create, Remove)
        props (Datum) verbs (Consult, SetPropertyValue)
    context Boodschappenlijsten filledBy Boodschappenlijst
      property Datum (Date)

  case Boodschappenlijst
    thing Boodschappen
      property Naam (String)
      property Aantal (Number)
    user Boodschapper = sys:SocialMe
      perspective on Boodschappen
        props (Naam, Aantal) verbs (Consult, SetPropertyValue)
        only (Create, Remove)