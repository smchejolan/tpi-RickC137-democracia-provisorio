%1)
%partidoDe(Nombre,Partido).
candidato(frank,rojo).
candidato(claire,rojo).
candidato(garrett,azul).
%petter no tiene partido por lo que no pertenece al Universo Cerrado
candidato(jackie,amarillo).
% El partido violeta no tiene candidatos entonces no se agrega
candidato(catherine,rojo).
candidato(seth,amarillo).
candidato(heather,amarillo).

partido(rojo).
partido(azul).
partido(amarillo).

%edad(Nombre,Edad).
edad(frank,50).
edad(claire,52).
edad(garrett,64).
edad(petter,26).
edad(jackie,28).
edad(linda,30).
%no se conoce la edad de seth por lo que no se agrega al predicado edad
edad(catherine,59).
edad(heather,60).

%sePostula(Partido,Provincia).
sePostula(azul,buenosAires).
sePostula(azul,chaco).
sePostula(azul,tierraDelFuego).
sePostula(azul,sanLuis).
sePostula(azul,neuquen).
sePostula(rojo,buenosAires).
sePostula(rojo,santaFe).
sePostula(rojo,cordoba).
sePostula(rojo,chubut).
sePostula(rojo,tierraDelFuego).
sePostula(rojo,sanLuis).
%si no se presenta en formoza no se agrega el predicado
sePostula(amarillo,chaco).
sePostula(amarillo,formoza).
sePostula(amarillo,tucuman).
sePostula(amarillo,salta).
sePostula(amarillo,santaCruz).
sePostula(amarillo,laPampa).
sePostula(amarillo,corrientes).
sePostula(amarillo,misiones).
sePostula(amarillo,buenosAires).

%habitantes(Provincia,Cantidad).
habitantes(buenosAires,15355000).
habitantes(chaco,1143201).
habitantes(tierraDelFuego,160720).
habitantes(sanLuis,489255).
habitantes(neuquen,637913).
habitantes(santaFe,3397532).
habitantes(cordoba,3567654).
habitantes(chubut,577466).
habitantes(formoza,527895).
habitantes(tucuman,1687305).
habitantes(salta,1333635).
habitantes(santaCruz,273964).
habitantes(laPampa,349299).
habitantes(corrientes,992595).
habitantes(misiones,1189446).

%2)

provinciaPicante(Provincia):-
    habitantes(Provincia, Cantidad),
    Cantidad > 1000000,
    sePostula(Partido,Provincia),
    not(forall(sePostula(Partido2,Provincia), Partido = Partido2)).
    
%3)

% intencionDeVotoEn(Provincia, Partido, Porcentaje)
intencionDeVotoEn(buenosAires, rojo, 40).
intencionDeVotoEn(buenosAires, azul, 30).
intencionDeVotoEn(buenosAires, amarillo, 30).
intencionDeVotoEn(chaco, rojo, 50).
intencionDeVotoEn(chaco, azul, 20).
intencionDeVotoEn(chaco, amarillo, 0).
intencionDeVotoEn(tierraDelFuego, rojo, 40).
intencionDeVotoEn(tierraDelFuego, azul, 20).
intencionDeVotoEn(tierraDelFuego, amarillo, 10).
intencionDeVotoEn(sanLuis, rojo, 50).
intencionDeVotoEn(sanLuis, azul, 20).
intencionDeVotoEn(sanLuis, amarillo, 0).
intencionDeVotoEn(neuquen, rojo, 80).
intencionDeVotoEn(neuquen, azul, 10).
intencionDeVotoEn(neuquen, amarillo, 0).
intencionDeVotoEn(santaFe, rojo, 20).
intencionDeVotoEn(santaFe, azul, 40).
intencionDeVotoEn(santaFe, amarillo, 40).
intencionDeVotoEn(cordoba, rojo, 10).
intencionDeVotoEn(cordoba, azul, 60).
intencionDeVotoEn(cordoba, amarillo, 20).
intencionDeVotoEn(chubut, rojo, 15).
intencionDeVotoEn(chubut, azul, 15).
intencionDeVotoEn(chubut, amarillo, 15).
intencionDeVotoEn(formosa, rojo, 0).
intencionDeVotoEn(formosa, azul, 0).
intencionDeVotoEn(formosa, amarillo, 0).
intencionDeVotoEn(tucuman, rojo, 40).
intencionDeVotoEn(tucuman, azul, 40).
intencionDeVotoEn(tucuman, amarillo, 20).
intencionDeVotoEn(salta, rojo, 30).
intencionDeVotoEn(salta, azul, 60).
intencionDeVotoEn(salta, amarillo, 10).
intencionDeVotoEn(santaCruz, rojo, 10).
intencionDeVotoEn(santaCruz, azul, 20).
intencionDeVotoEn(santaCruz, amarillo, 30).
intencionDeVotoEn(laPampa, rojo, 25).
intencionDeVotoEn(laPampa, azul, 25).
intencionDeVotoEn(laPampa, amarillo, 40).
intencionDeVotoEn(corrientes, rojo, 30).
intencionDeVotoEn(corrientes, azul, 30).
intencionDeVotoEn(corrientes, amarillo, 10).
intencionDeVotoEn(misiones, rojo, 90).
intencionDeVotoEn(misiones, azul, 0).
intencionDeVotoEn(misiones, amarillo, 0).

leGanaA(CandidatoA,CandidatoB,Provincia):-
    candidatoSePresentaEn(CandidatoA,_,Provincia),
    not(candidatoSePresentaEn(CandidatoB,_,Provincia)).   
leGanaA(CandidatoA,CandidatoB,Provincia):-
    candidatoSePresentaEn(CandidatoA,PartidoA,Provincia),
    candidatoSePresentaEn(CandidatoB,PartidoB,Provincia),
    distintosCandidatos(CandidatoA,CandidatoB),
    partidoLeGanaA(PartidoA,PartidoB,Provincia).
leGanaA(CandidatoA,CandidatoB,Provincia):-
    candidatoSePresentaEn(CandidatoA,Partido,Provincia),
    candidatoSePresentaEn(CandidatoB,Partido,Provincia),  
    distintosCandidatos(CandidatoA,CandidatoB).

distintosCandidatos(CandidatoA,CandidatoB):-
    candidato(CandidatoA,_),
    candidato(CandidatoB,_),
    CandidatoA \= CandidatoB.

candidatoSePresentaEn(Candidato,Partido,Provincia):-
    candidato(Candidato,Partido),
    sePostula(Partido,Provincia).

%4)
elGranCandidato(Candidato):-
    candidato(Candidato,Partido),
    esElMasJovenDeSuPartido(Candidato),
    ganaEnTodasLasProvincias(Partido).

ganaEnTodasLasProvincias(Partido):-
    partido(Partido),
    forall(sePostula(Partido,Provincia),ganaEnEsaProvincia(Partido,Provincia)).

ganaEnEsaProvincia(Partido,Provincia):-
    sePostula(Partido,Provincia),
    forall(partidoDiferente(Partido,PartidoB),partidoLeGanaA(Partido,PartidoB,Provincia)).

partidoDiferente(PartidoA,PartidoB):-
    partido(PartidoA),
    partido(PartidoB),
    PartidoA \= PartidoB.

partidoLeGanaA(PartidoA,PartidoB,Provincia):-
    sePostula(PartidoA,Provincia),
    sePostula(PartidoB,Provincia),
    intencionDeVotoEn(Provincia,PartidoA,PorcentajeA),
    intencionDeVotoEn(Provincia,PartidoB,PorcentajeB),   
    partidoDiferente(PartidoA,PartidoB),
    PorcentajeA > PorcentajeB.
partidoLeGanaA(PartidoA,PartidoB,Provincia):-
    sePostula(PartidoA,Provincia),
    not(sePostula(PartidoB,Provincia)).

esElMasJovenDeSuPartido(Candidato):-
    candidato(Candidato,Partido),
    forall(candidato(CandidatoB,Partido),esMasJoven(Candidato,CandidatoB)).
%No se puede encontrar el mas joven del partido amarillo porque seth no tiene definida una edad.

esMasJoven(CandidatoA,CandidatoB):-
    edad(CandidatoA,EdadA),
    edad(CandidatoB,EdadB),    
    distintosCandidatos(CandidatoA,CandidatoB),
    EdadA < EdadB.
esMasJoven(Candidato,Candidato).


/*  Se puede estar seguro que frank es el unico gran candidato usando una consulta existencial y viendo
    que es el unico individuo que cumple. Esta relacionado con el cocepto de unificacion.
    La consulta seria esta:
    ?- elGranCandidato(Candidato).
    Candidato = frank ;
    false.
    y quiere decir que en efecto frank es el unico gran candidato.*/