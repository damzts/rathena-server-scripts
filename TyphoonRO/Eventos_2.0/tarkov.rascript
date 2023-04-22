//======================================================================
//              Portal > Inicia desactivado
//======================================================================
prontera,139,169,5	script	PortalTarkov1	45,2,2,{
	end;
	OnTouch:
        specialeffect2 6;
		warp "gld2_prt",0,0;
	end;
}
//======================================================================
//              Portal > Inicia desactivado
//======================================================================
//4_M_REIDIN_KURS,
gld2_prt,92,105,5	script	EventoTarkov	-1,{

    OnClock1700:
    OnClock:2200:
    enablenpc "PortalTarkov1";
    announce "Ha comenzado el evento TARKOV!",bc_all,0xffff00;
	sleep 8000;
    announce "Si quieren participar entren al portal que esta en Prontera [139,169].",bc_all,0xffff00;
	sleep 8000;
	announce "Tienen 1 minuto para entrar",bc_all,0xffff00;
	sleep 30000; //30 s
    announce "El portal se cerrara en 30 Segundos",bc_all,0xffff00;
    sleep 25000; //25 s
    for(.@timer=5;.@timer>=1;.@timer--){
        announce "El portal se cerrara en " +.@timer+" segundos",bc_all,0xffff00;
        sleep 1000;
    } 
    disablenpc "PortalTarkov1";

    mapannounce "gld2_prt","Comenzaremos con el evento... primero explicare de que se trata. ",bc_map,0xffff00;
	sleep 4000; //6s
	mapannounce "gld2_prt","El evento consta de 2 fases, Recoleccion y Extraccion",bc_map,0xffff00;
	sleep 4000; //6s
	mapannounce "gld2_prt","En la etapa de recoleccion habran monstruos con valiosos items por todo el mapa, el PvP NO estara disponible en esta etapa.",bc_map,0xffff00;
	sleep 4000;
    mapannounce "gld2_prt","Tras 10 minutos de recoleccion se abriran las puertas de escape, el PvP se ACTIVARA y deberas escapar con vida del lugar si no quieres que alguien robe tus recompensas!",bc_map,0xffff00;
	sleep 4000;
    mapannounce "gld2_prt","Bien, comenzemos.. Mucha suerte!",bc_map,0xffff00;
    sleep 8000;

    //logica del spawn
    set $@minute_counter,0;
    set $@second_counter,0;
    freeloop(1);
    //
    while($@second_counter<=300){

        if(($@second_counter % 60) == 0 || $@second_counter == 0){
            if($@second_counter != 0){
                $@minute_counter++:
            }
            areamonster "gld2_prt",8,255,255,21,"--en--",1884,100,"EventoTarkov::OnKill";
            if(rand(1,5)==1){
                mapannounce "gld2_prt","Maya ha aparecido!",bc_map,0xffff00;
                areamonster "gld2_prt",8,255,255,21,"--en--",1147,1,"EventoTarkov::OnKill";
            }
            //areamonster "gld2_prt",84,115,99,100,"--en--",1884,100,"EventoColiseo::OnKill";
            if($@minute_counter!=0){
                mapannounce "gld2_prt",($@minute_counter>=2)?"Han pasado "+ $@minute_counter +" minutos!":"Ha pasado 1 minuto!",bc_map,0xffff00;
            }
        }
        sleep 1000;
        $@second_counter++;
    }
    mapannounce "gld2_prt","Bien hecho, ahora.... Escapa con vida del evento!. El PvP se activara en 15 segundos...",bc_map,0xffff00;
    sleep 10000;
    for(.@timer=5;.@timer>=1;.@timer--){
        announce "~  " +.@timer+" ~ segundos.",bc_all,0xffff00;
                sleep 1000;
    }
    killmonsterall "gld2_prt";
    pvpon "gld2_prt";
    //activar portales en sitios random
    while(getmapusers("gld2_prt") >= 1){
        sleep 4000;
        .@xrand = rand(8,255);
        .@yrand = rand(21,255);
        viewpointmap "gld2_prt",0,.@xrand,.@yrand,++.@point,0xFF0000;
        warpportal .@xrand,.@yrand,"prontera",156,223;
        //mapannounce "gld2_prt","Escapa del evento - debug - sleep",bc_map,0xffff00;
        //announce "Sobrevivientes: "+getmapusers("gld2_prt"),bc_all,0xffff00;
    }
    announce "Parece que no queda nadie en el evento..",bc_all,0xffff00;
    announce "Limpiaremos el mapa y cancelaremos el evento, hasta la proxima!",bc_all,0xffff00; 
    killmonsterall "gld2_prt";
    pvpoff "gld2_prt";
    disablenpc "EventoTarkov";
    mapannounce "gld2_prt","Fin del Script",bc_map,0xffff00;
    end;

    OnPCDieEvent:
        getmapxy(.@mapnvz$,.@x,.@y,BL_PC);
            if(.@mapnvz$ == "gld2_prt"){

                //mapannounce "gld2_prt","-----RID: "+rid2name(killerrid)+"",0xffff00;
                //mapannounce "gld2_prt","-----RID: "+killerrid+"",0xffff00;
                if(killerrid<2000000 || killerrid==0){
                    //dropea tus cosas
                    getinventorylist();
                    for (.@i = 0; .@i < @inventorylist_count; @i = .@i+1){
                        for (.@j = 0; .@j < getarraysize($articulos_robables); .@j = .@j+1){
                            if (@inventorylist_id[.@i] == $articulos_robables[.@j]){
                                makeitem @inventorylist_id[.@i],@inventorylist_amount[.@i],"gld2_prt",.@x,.@y;
                                delitemidx @inventorylist_idx[.@i];
                            }
                        }

                    }
                    specialeffect2 611;
                    specialeffect2 512;
                    dispbottom "Los monstruos han acabado contigo y dejaste tus recompensas atras, mejor suerte la proxima!";
                }
            //warp "gld2_prt",92,95;
            warp "prontera",156,223;
            percentheal 100,100;
            //dispbottom "Asesinado por: "+(killedrid!=1884)?rid2name(killedrid):"Mobs"; //1884
        }
        end;
    OnKill:
        getmapxy(.@mapnvz$,.@x,.@y,BL_PC);
        if(.@mapnvz$ == "gld2_prt"){
            .@mobs_en_mapa = mobcount("gld2_prt","EventoTarkov::OnKill");
            getitem 7539,1;
            specialeffect2 66;
            if(rand(1,20)==1){
                specialeffect2 75;
                dispbottom "Golpe de suerte!";
                getitem 969,5;
                getitem 616,1;
            }

        }
        end;

    OnPCKillEvent:
        getmapxy(.@mapnvz$,.@x,.@y,BL_PC);
        if(.@mapnvz$ == "gld2_prt"){


            //strcharinfo(0) nombre del personaje  ---------- //rid2name(<rid>)  you can convert 'killedrid' to the name of the player

            //rid = account id.

            //getcharid(<type>{,"<character name>"}) - 0 character id , 3 account id


            //getinventorylist ()  recibe char id
        
            //invoked
            //set .@killer_name$,strcharinfo(0);
            set .@killer_rid,getcharid(3,strcharinfo(0));

            //killed
            //set .@killed_name$,rid2name(killedrid);
            set .@killed_rid,killedrid;
            set .@killed_char_id,getcharid(0,rid2name(killedrid));
            specialeffect2 668;

            detachrid;
            attachrid(.@killed_rid);
            getinventorylist .@killed_char_id;
            specialeffect2 622;

            for (.@i = 0; .@i < @inventorylist_count; ++.@i){

                for (.@j = 0; .@j < getarraysize($articulos_robables); .@j = .@j+1){
                    if (@inventorylist_id[.@i] == $articulos_robables[.@j]){
                        //mapannounce "gld2_prt",rid2name(.@killed_rid)+" Murio con "+@inventorylist_amount[.@i]+" manzanas.",bc_all,0xffff00;
                        //mapannounce "gld2_prt"," Entre al if de robar",bc_all,0xffff00;
                        setarray .@ides[.@contador],@inventorylist_id[.@i];
                        setarray .@cantidades[.@contador],@inventorylist_amount[.@i];
                        delitemidx @inventorylist_idx[.@i];
                        .@contador++;
                    }
                }
            }
            //
            detachrid;
            attachrid(.@killer_rid);

            for (.@k = 0; .@k < getarraysize(.@ides); .@k = .@k+1){
                getitem .@ides[.@k],.@cantidades[.@k];
            }
            //dispbottom rid2name(.@killer_rid)+"Robo"+.@cantidad+"manzanas";
            //mapannounce "gld2_prt","Robaste "+@inventorylist_amount[.@i]+" manzanas",bc_map,0xffff00;
        }
        end;
    
    OnInit:
        setarray $articulos_robables[0],7539,969,616; 
        disablenpc "PortalTarkov1";
}



//= Mapflags ==============================================
guild_vs5	mapflag	nowarpto
guild_vs5	mapflag	nomemo
guild_vs5	mapflag	nopenalty
guild_vs5	mapflag	noteleport
guild_vs5	mapflag	nosave
guild_vs5	mapflag	noloot
guild_vs5	mapflag	bexp	50
guild_vs5	mapflag	jexp	50
guild_vs5	mapflag	monster_noteleport
guild_vs5	mapflag	nobranch
//=========================================================