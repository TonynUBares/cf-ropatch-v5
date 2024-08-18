Class RO_Event : EventHandler
{
 //int ROdiff,ModCheck;
 Class<Inventory> Vodka;


 Override void WorldThingSpawned(WorldEvent e)
  {
   if( whichMod != 1 || !e.thing || !e.Thing.bIsMonster ) { return; }

   switch(RO_Difficulty) 
    {
	case 3 	: e.thing.Health = 3 * e.thing.Health ; break;
	case 4 	: e.thing.Health = 6 * e.thing.Health ; break;
	case 5  : e.thing.Health = 9 * e.thing.Health ; break;
	case 6 	: e.thing.Health = 10 * e.thing.Health ; break;
	case 8 	: e.thing.Health = 1 ; break;
    }
  }

  Override void PlayerSpawned(PlayerEvent e) 
   { 
    if(whichMod != 1) { return;}
    PlayerMods(e); 
   }
	
  Override void PlayerRespawned(PlayerEvent e)
   { 
    if(whichMod != 1) { return;}
    PlayerMods(e); 
   }

  void PlayerMods(PlayerEvent e)
   { 
    let player = players[e.PlayerNumber].mo;

    // this allows to use this event even when RO is not loaded. It returns no errors when checking for Vodka
    string ItemName = "VodkaItem";
    Vodka = (Class<Inventory>) (ItemName);

    if(player)
     { 	
      switch(RO_Difficulty) 
       {
	case 1 	: player.DamageFactor = 0; break;
	case 2 	: int achance=random(1,10); if(achance==1 && Vodka) { player.GiveInventory(Vodka,1); }; break;
	case 6 	: player.DamageFactor = player.DamageFactor * 1.25 ; break;
	case 8 	: player.DamageFactor = 90000; break;
       }
     }
   }
}
