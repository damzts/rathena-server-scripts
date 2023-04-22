//======================================================================
//              Portal > Inicia desactivado
//======================================================================
prontera,139,169,5	script	PortalColiseo1	45,2,2,{
	end;
	OnTouch:
    specialeffect2 6;
	warp "guild_vs1",0,0;
	end;
}

//======================================================================
//              Evento completo hecho en una sola funcion
//======================================================================
//4_M_REIDIN_KURS,
guild_vs1,48,57,6	script	EventoColiseo	4_M_REIDIN_KURS,{
    
    OnClock1600:
    OnClock2100:
	enablenpc "PortalColiseo1";
	announce "Se ha abierto el Coliseo de Campeones!",bc_all,"0xffff00";
	//sleep 3000;
    announce "Si quieren participar entren al portal que esta dentro la sala de espera al final del pasillo.",bc_all,"0xffff00";
	//sleep 3800;
	announce "La entrada a la sala esta en Prontera [139,169].",bc_all,"0xffff00"; 
	//sleep 5000;
	announce "Tienen 1 minuto para entrar",bc_all,"0xffff00";
	//sleep 30000; //30 s
    announce "El portal se cerrara en 30 Segundos",bc_all,"0xffff00";
    //sleep 25000; //25 s
    for(.@timer=5;.@timer>=1;.@timer--){
        announce "El portal se cerrara en " +.@timer+" segundos",bc_all,"0xffff00";
        //sleep 1000;
    } disablenpc "PortalColiseo1";
    mapannounce "guild_vs1","Comenzaremos con el evento... primero les explicare de que se trata. ",bc_map,"0xffff00";
	//sleep 4000; //6s
	mapannounce "guild_vs1","El evento consta de 20 rondas en cada una aparecera uno o dos MVP y su horda de monstruos, matenlos a todos para pasar a la siguiente ronda",bc_map,"0xffff00";
	//sleep 4000; //6s
	mapannounce "guild_vs1","Al el final de cada 5 rondas, 10 en mayores rondas recibiran un premio, luchen y sobrevivan!",bc_map,"0xffff00";
	//sleep 8000;
	mapannounce "guild_vs1","Bien comenzemos.. mucha suerte!",bc_map,"0xffff00";

    set $@ronda_actual,1;
    setarray .@contenedor$[0],"1086,1,1054,15,1053,15,1051,15,1048,5","1059,1,1303,25,1004,20","1147,1,1159,1,1105,15,1160,15,1095,15,1097,5","1112,1,1071,70","1307,15,1150,1,1180,15","1630,1,1416,30","1312,1,1319,10,1316,10,1318,10,1314,10","1492,1,1401,10,1405,10,1403,5,1400,5","1038,1,1297,15,1032,15,1041,20","1157,1,1511,1,1098,10,1140,10,1146,10","1148,25,1418,1,1029,15,1037,15","1658,1,1046,1,1654,10,1653,10,1657,10,1656,10,1655,10,1652,10","1785,1,1783,20","1087,1,1190,1,1686,20,1213,15,1189,10,1273,10,1023,5","1039,1,1101,25,1582,8,1109,15,1272,1,1302,10","1871,1,1870,18","1832,1,1833,18,1831,18","1751,1,1702,10,1703,10,1371,10","1873,1,1035,30,1042,5,1091,5,1011,5","1956,1,1957,1,1958,8,1960,6,1961,4";
    setarray .@titulos$[0],"Golden Thief Bug","Mistress","Maya y Phreeoni","Drake","Cat o' Nine Tails","White Lady","Turtle General","Samurai Specter","Osiris","Pharaoh y Amon Ra","Evil Snake Lord","Egnigem Cenia y Doppelganger","Atroce","Orc Hero y Orc Lord","Baphomet","Falling Bishop Hibram","Ifrit","Valkyrie Randgris","Beelzebub","Nacht Sieger y su mano derecha Entweihen";
    setarray $@recompensas$,"512,1","13813,1,14533,1,13995,1,13534,2,7539,5,13810,1,12913,1,12914,1","13813,1,14533,1,13995,1,13534,2,7539,10,13810,1,12913,1,12914,1","13813,1,14533,1,13995,1,13534,2,7539,15,13810,1,12913,1,12914,1","13813,1,14533,1,13995,1,13534,2,7539,20,13810,1,12913,1,12914,1","13813,2,14533,1,13995,2,13534,3,7539,25,13810,2,12913,1,12914,1","13813,2,14533,1,13995,2,13534,3,7539,30,13810,2,12913,1,12914,1","13813,2,14533,1,13995,2,13534,3,7539,35,13810,2,12913,1,12914,1","13813,2,14533,1,13995,2,13534,3,7539,40,13810,2,12913,1,12914,1","13813,3,14533,2,13995,3,13534,4,7539,45,13810,3,12913,1,12914,1","13813,3,14533,2,13995,3,13534,4,7539,50,13810,3,12913,1,12914,1","13813,3,14533,2,13995,3,13534,4,7539,55,13810,3,12913,1,12914,1","13813,3,14533,2,13995,3,13534,4,7539,60,13810,3,12913,1,12914,1","13813,4,14533,2,13995,3,13534,5,7539,65,13810,4,12913,1,12103,1,12914,1","13813,4,14533,2,13995,3,13534,5,7539,70,13810,4,12913,1,12103,1,12914,1","13813,4,14533,2,13995,3,13534,5,7539,75,13810,4,12913,1,12103,1,12914,1","13813,4,14533,2,13995,3,13534,5,7539,80,13810,4,12913,1,12103,1,12914,1","13813,5,14533,3,13995,3,13534,6,7539,85,13810,5,12913,1,12103,1,12914,1","13813,5,14533,3,13995,3,13534,6,7539,90,13810,5,12913,1,12103,1,12914,1","13813,5,14533,3,13995,3,13534,6,7539,95,13810,5,12913,1,12103,1,12914,1","13813,6,14533,4,13995,4,13534,8,7539,120,13810,8,12913,1,12103,1,12914,1,512,1";
    
    .@nb = query_sql("SELECT DISTINCT id,name_english,hp FROM mob_db WHERE class = 'boss' AND mvp_exp!='' GROUP BY name_english ORDER BY hp ASC;", .@mob_id_sql$, .@mob_name_sql$);
    freeloop(1);

    setarray $@recompensa_actual[0],512,1;

    while($@indice_actual <= getarraysize(.@mob_id_sql$)){
        mapannounce "guild_vs1","Preparense para la siguiente ronda !",bc_map,0xffff00;
        mapannounce "guild_vs1","~~~~~~~~~ "+.@mob_name_sql$[$@indice_actual]+" ~~~~~~~~~",0xffff00;
        //sleep 10000;
        // Spawnear mobs
        areamonster "guild_vs1",46,53,53,45,"--en--",atoi(.@mob_id_sql$[$@indice_actual]),1,"EventoColiseo::OnKill";
        .@mobs_en_mapa = mobcount("guild_vs1","EventoColiseo::OnKill");
        //
        while(.@mobs_en_mapa!=0){
            .@mobs_en_mapa = mobcount("guild_vs1","EventoColiseo::OnKill");
            sleep 1000;
            if (getmapusers("guild_vs1") < 1 ){
                announce "Parece que no queda nadie en el evento..",bc_all,0xffff00;
                announce "Limpiaremos el mapa y cancelaremos el evento, hasta la proxima!",bc_all,0xffff00; 
                killmonsterall "guild_vs1";
                disablenpc "EventoColiseo";
                end;
            }
        }

        $@indice_actual++;
        //
        mapannounce "guild_vs1","MVP asesinado!!",bc_map,0xffff00;
        //
        if(($@indice_actual%5)==0){
            //.@checkpoint++;
            //$@recompensa_actual[0],13813 
            //$@recompensa_actual[0],
        }
        
        
    }
    mapannounce "guild_vs1","Todos las rondas han terminado!!",bc_map,0xffff00;
    addrid(1);

    // Fin del evento, entrega recompensas en muerte o al ganar
    OnPCDieEvent:
		getmapxy .@mapnvz$,.@xnvz,.@ynvz,BL_PC;
		if ( .@mapnvz$ == "guild_vs1") {
			sleep2 250;
			warp "prontera",156,223;
			percentheal 100,100;
            sleep2 1000;
            if($@ronda_actual >= 20){
                // // Fix para indices de recompensa
                dispbottom "Felicidades por completar el coliseo de campeones !";
            }else{
                .@displayvariable=$@ronda_actual-1;
                dispbottom "Que lastima has muerto.. pero lograste llegar a la ronda "+.@displayvariable+" felicidades!.";
            }
            sleep2 1500;
            //===================== Recompensas ====================================
            dispbottom "Aqui te entrego tu recompensa.";
            explode(.@reward_array$[0], $@recompensas$[$@ronda_actual-1], ",");
            for (.@j = 0; .@j < getarraysize(.@reward_array$); .@j = .@j+2){
                .@cantidad2 = .@j + 1;
                getitem atoi(.@reward_array$[.@j]),atoi(.@reward_array$[.@cantidad2]);
            }
		} 
    end;

   // Contador de mobs
    OnKill:
        .@mobs_en_mapa = mobcount("guild_vs1","EventoColiseo::OnKill");
        if (.@mobs_en_mapa!=0){
            mapannounce "guild_vs1",""+((.@mobs_en_mapa >= 2)?"Quedan " + .@mobs_en_mapa + " monstruos para pasar a la siguiente ronda":"Queda un monstruo para pasar a la siguiente ronda!")+"",bc_map,0xffff00;
        }
    OnInit:
        disablenpc "PortalColiseo1";
}


//= Mapflags ==============================================
guild_vs1	mapflag	nowarpto
guild_vs1	mapflag	nomemo
guild_vs1	mapflag	nopenalty
guild_vs1	mapflag	noteleport
guild_vs1	mapflag	nosave
guild_vs1	mapflag	noloot
guild_vs1	mapflag	bexp	50
guild_vs1	mapflag	jexp	50
guild_vs1	mapflag	monster_noteleport
guild_vs1	mapflag	nobranch
//=========================================================