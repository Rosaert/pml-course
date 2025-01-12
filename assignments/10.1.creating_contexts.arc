{-
Je model zou probleemloos door de compiler heengekomen moeten zijn. Zo niet, neem dan het onderstaande over in je eigen bestand en probeer het nogmaals.

Dit model kan nu in gebruik genomen worden!
Doe dat door
1. vanuit de versie-context terug te navigeren naar de manifest context;
2. de publieke versie van het manifest te openen;
3. versie 1.0 te selecteren;
4. de actie StartUsing in het actie-menu van de versietabel te kiezen.
(LET OP: je kunt StartUsing maar één keer toepassen. Als je het model actualiseert, moet je UpdateModel kiezen.)

Navigeer dan naar de Home context en klik op de tab "Start Contexts". Daar zou je nu een context "Boodschappen lijsten" moeten zien. 
Klik op de naam van die context om hem te openen. 
Je ziet dan een (lege) lijst met boodschappenlijsten.
Klik op de + knop om een nieuwe boodschappenlijst toe te voegen.
Vul een datum in.

DISCUSSIE
Hoewel ons model functioneert, geeft het toch een ander beeld dan verwacht. Immers, we zouden een lijst of tabel van boodschappenlijsten verwachten.
In plaats daarvan zien we een formulier met één veld, de datum. Misschien heb je geprobeerd om te dubbelklikken op het kaartje in de toolbar 
onder het formuler. Je hebt dan gemerkt dat MyContexts meldt dat het geen context kan openen.

FUNCTIONELE EN RELATIONELE ROLLEN
Bij verstek is een rol 'functioneel'. Dat betekent dat er maar één instantie van die rol kan bestaan. 
Maar het hele punt van BoodschappenlijstenBeheer is dat er meerdere boodschappenlijsten kunnen zijn. 
Daarom moeten we de rol 'Boodschappenlijsten' veranderen in een 'relationele' rol. 

OPDRACHT
schrijf tussen 'Boodschappenlijsten' en 'filledBy' tussen haakjes 'relational'.
Upload je bestand. In de manifest context actualiseer je het in gebruik genomen model door in het menu van de versietabel de actie 'UpdateModel' te kiezen.

Navigeer naar de context BoodschappenlijstenBeheer en klik op de + knop om een nieuwe boodschappenlijst toe te voegen. Vul een datum in.
Nu is duidelijk zichtbaar dat je met een tabel van Boodschappenlijsten werkt.

WAAROM ZIE IK GEEN DATUM?
De regels van de tabel laten grote getallen zien, in plaats van een datum, terwijl je wel degelijk een datum hebt ingevoerd. 
Dat komt omdat de datum hier niet is geformatteerd. Het gaat te ver om dat hier uit te leggen, maar het komt later aan de orde.

Ga nu naar de volgende opdracht.
-}


-------------------------------------------------------------------------------
-- MODEL TOT NOG TOE
-------------------------------------------------------------------------------
-- Firstname Lastname. mm/dd/yyyy.
domain model://joopringelberg.nl#Boodschappenlijst
  use bl for model://joopringelberg.nl#Boodschappenlijst

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
  
  case BoodschappenlijstenBeheer
    aspect sys:RootContext
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