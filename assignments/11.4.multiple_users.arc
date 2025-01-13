{-
MEER PERSPECTIEVEN VOOR HUISGENOTEN
Mocht je inderdaad een peer hebben toegevoegd als huisgenoot, dan zou je verwachten dat die peer inmiddels wel iets zou zien.
Maar dat is nog steeds niet zo. Het inlezen van een nieuwe versie van het model verandert niet iets aan de bestaande situatie.
Pas als je opnieuw veranderingen aanbrengt, gaat het nieuwe model werken. 
Dus als je nu een nieuwe huisgenoot toevoeg (of je gooit de vorige versie weg en maakt hem opnieuw), wordt die huisgenoot op de hoogte gesteld.
Overigens is dat alleen als er daadwerkelijk iets in de Boodschappenlijst staat!
We hebben immers alleen een perspectief op de lijst zelf gegeven.
Om ook een lege Boodschappenlijst zichtbaar te maken, moeten we de Huisgenoot meer perspectieven geven.
Bijvoorbeeld op de Boodschapper.
Of op de Huisgenoten.

OPDRACHT
Voeg voor Huisgenoten twee perspectieven toe. Van de Boodschapper moet hij voor- en achternaam kunnen zien en van de Huisgenoten ook.
Er zijn geen rol-werkwoorden nodig: alleen de Boodschapper mag Huisgenoten toevoegen.

Compileer het model en ga naar de volgende opdracht (je hoeft nog niet te actualiseren, want er zal nog geen verschil te zien zijn in MyContexts).

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
        only (CreateAndFill, Remove)
        props (Datum) verbs (Consult, SetPropertyValue)
    context Boodschappenlijsten (relational) filledBy Boodschappenlijst
      property Datum (Date)

  case Boodschappenlijst
    thing Boodschappen (relational)
      property Naam (String)
      property Aantal (Number)
    user Boodschapper = sys:SocialMe
      perspective on Boodschappen
        props (Naam, Aantal) verbs (Consult, SetPropertyValue)
        only (Create, Remove)
      perspective on Huisgenoten
        only (Create, Remove)
        props (FirstName, LastName) verbs (Consult)
      perspective on Contacten
        props (FirstName, LastName) verbs (Consult)
    user Huisgenoten (relational) filledBy sys:TheWorld$PerspectivesUsers
      perspective on Boodschappen
        props (Naam, Aantal) verbs (Consult, SetPropertyValue)
        only (Create, Remove)
    user Contacten = sys:TheWorld >> PerspectivesUsers