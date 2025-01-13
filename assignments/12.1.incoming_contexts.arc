{-
BINNENKOMENDE CONTEXTEN
Met het model zoals we dat nu hebben gemaakt, ontvangt een peer die tot Huisgenoot is gemaakt, de betreffende Boodschappenlijst.
Maar hij zal hem niet kunnen opzoeken.

In opdracht 9.1 hebben we het model zo gemaakt, dat bij in gebruik nemen automatisch een instantie van BoodschappenlijstenBeheer wordt aangemaakt.
Dus: als jij het model in gebruik neemt, krijg je zo'n beheer-instantie.
En als je peer het model in gebruik neemt, krijgt hij ook zo'n instantie. MAAR DAT IS ZIJN EIGEN INSTANTIE - een andere dan die van jou!

Als jouw peer in MyContexts naar Mijn Boodschappen gaat, ziet hij dus zijn eigen beheer-instantie. En die is leeg.
Want als jij een Boodschappenlijst aanmaakt, gebeurt dat in jouw instantie, niet in die van je peer.

Weliswaar ontvangt je peer (als hij een rol in boodschappenlijst X heeft) de Boodschappenlijst X, maar die is niet ingebed in zijn eigen (die van de peer) beheer-instantie.
Dat gaan we nu regelen en dat vergt twee stappen. De eerste stap zetten we hier; de tweede in de volgende opdracht.

GEINDEXEERDE CONTEXTEN
Denk eens na over het woord 'thuis'. Het betekent voor iedereen een ander huis (een ander adres). Toch is er geen verwarring als we het woord gebruiken.
Als een collega zegt: "Ik ben thuis", dan weet je dat hij in zijn eigen huis is, niet in dat van jou.
In de Perspectives Language gebruiken we ook geïndexeerde contexten. Dat zijn contexten die voor iedereen een andere instantie hebben. 

OPDRACHT
In BoodschappenlijstenBeheer schrijf je boven de aspect regel:

  indexed bl:BoodschappenApp

Compileer het model.

De naam BoodschappenApp (in de namespace van het model) wijst in elke installatie naar een andere instantie van BoodschappenlijstenBeheer.

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
      perspective on Boodschapper
        props (FirstName, LastName) verbs (Consult)
      perspective on Huisgenoten 
        props (FirstName, LastName) verbs (Consult)
    user Contacten = sys:TheWorld >> PerspectivesUsers