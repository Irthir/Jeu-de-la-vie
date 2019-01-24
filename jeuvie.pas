program jeuvie;
//BUT : Faire un jeu de la vie.
//ENTREE : Un choix de l'utilisateur pour la premiere forme.
//SORTIE : Le jeu de la vie se déroulant au fur et à mesure.


//Any live cell with fewer than two live neighbors dies, as if by underpopulation.
//Any live cell with two or three live neighbors lives on to the next generation.
//Any live cell with more than three live neighbors dies, as if by overpopulation.
//Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.

uses crt;

CONST 	TMAX1=25;
		TMAX2=40;
//Le type tableau
TYPE
BooleanArray = array[0..TMAX1+1,0..TMAX2+1] of BOOLEAN;

//Les Fonctions.

function forme1(): BooleanArray;
VAR	creation: BooleanArray;
        i,j:integer;
begin
	FOR i:=0 TO TMAX1+1 DO
	BEGIN
		FOR j:=0 to TMAX2+1 DO
		BEGIN
			creation[i,j]:=false;
		END;
	END;
	creation [11,19]:=true;
	creation [11,21]:=true;
	creation [12,19]:=true;
	creation [12,21]:=true;
	creation [13,19]:=true;
	creation [13,20]:=true;
	creation [13,21]:=true;
	forme1:=creation;
end;

function forme2(): BooleanArray;
VAR	creation: BooleanArray;
        i,j:integer;
begin
	FOR i:=0 TO TMAX1+1 DO
	BEGIN
		FOR j:=0 to TMAX2+1 DO
		BEGIN
			creation[i,j]:=false;
		END;
	END;
	creation [7,16]:=true;
	creation [7,17]:=true;
	creation [7,18]:=true;
	creation [7,22]:=true;
	creation [7,23]:=true;
	creation [7,24]:=true;
	creation [9,14]:=true;
	creation [9,19]:=true;
	creation [9,21]:=true;
	creation [9,26]:=true;
	creation [10,14]:=true;
	creation [10,19]:=true;
	creation [10,21]:=true;
	creation [10,26]:=true;
	creation [11,14]:=true;
	creation [11,19]:=true;
	creation [11,21]:=true;
	creation [11,26]:=true;
	creation [12,16]:=true;
	creation [12,17]:=true;
	creation [12,18]:=true;
	creation [12,22]:=true;
	creation [12,23]:=true;
	creation [12,24]:=true;

	creation [14,16]:=true;
	creation [14,17]:=true;
	creation [14,18]:=true;
	creation [14,22]:=true;
	creation [14,23]:=true;
	creation [14,24]:=true;
	creation [15,14]:=true;
	creation [15,19]:=true;
	creation [15,21]:=true;
	creation [15,26]:=true;
	creation [16,14]:=true;
	creation [16,19]:=true;
	creation [16,21]:=true;
	creation [16,26]:=true;
	creation [17,14]:=true;
	creation [17,19]:=true;
	creation [17,21]:=true;
	creation [17,26]:=true;
	creation [19,16]:=true;
	creation [19,17]:=true;
	creation [19,18]:=true;
	creation [19,22]:=true;
	creation [19,23]:=true;
	creation [19,24]:=true;
	forme2:=creation;
end;

function forme3(): BooleanArray;
VAR	creation: BooleanArray;
        i,j:integer;
begin
	FOR i:=0 TO TMAX1+1 DO
	BEGIN
		FOR j:=0 to TMAX2+1 DO
		BEGIN
			creation[i,j]:=false;
		END;
	END;
	creation [9,15]:=true;
	creation [9,16]:=true;
	creation [9,18]:=true;
	creation [9,19]:=true;
	creation [9,20]:=true;
	creation [9,21]:=true;
	creation [9,22]:=true;
	creation [9,23]:=true;

	creation [10,15]:=true;
	creation [10,16]:=true;
	creation [10,18]:=true;
	creation [10,19]:=true;
	creation [10,20]:=true;
	creation [10,21]:=true;
	creation [10,22]:=true;
	creation [10,23]:=true;

	creation [11,15]:=true;
	creation [11,16]:=true;
	
	creation [12,15]:=true;
	creation [12,16]:=true;
	creation [12,22]:=true;
	creation [12,23]:=true;

	creation [13,15]:=true;
	creation [13,16]:=true;
	creation [13,22]:=true;
	creation [13,23]:=true;

	creation [14,15]:=true;
	creation [14,16]:=true;
	creation [14,22]:=true;
	creation [14,23]:=true;

	creation [15,22]:=true;
	creation [15,23]:=true;

	creation [16,15]:=true;
	creation [16,16]:=true;
	creation [16,17]:=true;
	creation [16,18]:=true;
	creation [16,19]:=true;
	creation [16,20]:=true;
	creation [16,22]:=true;
	creation [16,23]:=true;

	creation [17,15]:=true;
	creation [17,16]:=true;
	creation [17,17]:=true;
	creation [17,18]:=true;
	creation [17,19]:=true;
	creation [17,20]:=true;
	creation [17,22]:=true;
	creation [17,23]:=true;

	forme3:=creation;
end;

//Fonction d'itération pour faire passer le tableau d'un état à un autre.
function iteration (T: BooleanArray): BooleanArray;
VAR ttest:BooleanArray;
i,j,test : integer;
BEGIN
	FOR i:=0 TO TMAX1+1 DO
	BEGIN
		FOR j:=0 to TMAX2+1 DO
		BEGIN
			ttest[i,j]:=false;
		END;
	END;

	FOR i:=1 TO TMAX1 DO
	begin
		FOR j:=1 to TMAX2 DO
		BEGIN
			test:=0;
			IF T[i-1,j]=true THEN
			test:=test+1;
			IF T[i-1,j-1]=true THEN
			test:=test+1;
			IF T[i,j-1]=true THEN
			test:=test+1;
			IF T[i+1,j]=true THEN
			test:=test+1;
			IF T[i,j+1]=true THEN
			test:=test+1;
			IF T[i+1,j+1]=true THEN
			test:=test+1;
			IF T[i-1,j+1]=true THEN
			test:=test+1;
			IF T[i+1,j-1]=true THEN
			test:=test+1;


			IF (test=2) AND (T[i,j]=true) THEN
				ttest[i,j]:=true
			ELSE
				IF test=3 THEN
					ttest[i,j]:=true
				ELSE
					ttest[i,j]:=false;
		END;
	END;
	iteration:=ttest;
END;

//La procedure d'ecriture.
procedure ecrire(T: BooleanArray);
VAR i,j:integer;
BEGIN
	textcolor(red);
	FOR i:=1 to TMAX1 DO
	BEGIN
		FOR j:=1 to TMAX2 DO
		BEGIN
			IF (T[i,j]=true) THEN
				WRITE (chr(64))
			ELSE
				WRITE (chr(32));
		END;
		WRITEln;
	END;
	textcolor(white);
END;

//Debut du programme.

VAR reponse, nbiteration, x : integer;
	t1: BooleanArray;

BEGIN
	clrscr;
	WRITEln ('Bonjour, veuillez choisir la forme de depart et le nombre d''iterations que vous souhaitez.');
	WRITEln ('Forme 1.');
	ecrire (forme1());

	WRITEln;

	WRITEln ('Forme 2.');
	ecrire (forme2());

	WRITEln;

	WRITEln ('Forme 3.');
	ecrire (forme3());

	reponse:=0;
	WHILE (reponse<1) OR (reponse>3) DO
	BEGIN
		WRITEln('Veuillez entrer le numero de la forme souhaitee.');
		READln (reponse);
	END;

        nbiteration:=0;
	WHILE (nbiteration<1) DO
	BEGIN
		WRITEln ('Veuillez entrez le nombre d''iterations souhaitées.');
		READln (nbiteration);
	END;

	Case reponse of
		1: t1:=forme1();
		2: t1:=forme2();
		3: t1:=forme3();
	end;

	FOR x:=1 TO nbiteration DO
	BEGIN
		WRITEln ('Iteration ',x,'.');
		t1:=iteration(t1);
		ecrire(t1);
	END;
	READln;
END.
