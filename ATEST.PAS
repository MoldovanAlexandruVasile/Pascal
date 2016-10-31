uses crt, graph;

var gd,gm,cursor,cursor2,pred,pred2,cursor3,pred3:integer;
    AB,BC,AC,CD,AD,a,b,xp,yp,l:integer;
    panta,circumf,dist,r,xc,yc,BD,DC,
    d,rc, ri, ha, hb, hc, bisa, bisb, bisc, meda, medb, medc, aria, p, sp, uA, uB, uC, uD: real;
    k:char;
    ec,t,t1,t2:string;

procedure margine;
var i:integer;
begin
     setcolor(white);
     for i:=9 to 462 do
         begin
              outtextxy(2,i,chr(186));
              outtextxy(630,i,chr(186));
         end;
     for i:=9 to 625 do
         begin
              outtextxy(i,2,chr(205));
              outtextxy(i,470,chr(205));
         end;
     outtextxy(2,2,chr(201));
     outtextxy(2,470,chr(200));
     outtextxy(630,2,chr(187));
     outtextxy(630,470,chr(188));
end;

function CitesteNumar(a,b:integer):integer;
var c:char;
    code,x:integer;
    s:string;
begin
     s:='';
     repeat
           c:=readkey;
           if c in ['0'..'9'] then
              begin
                   setcolor(black);
                   outtextxy(a,b,'ллллллллллл');
                   s:=s+c;
                   setcolor(lightgray);
                   outtextxy(a,b,s);
              end;
           if ord(c)=8 then
              if length(s)>0 then
                 begin
                      setcolor(black);
                      outtextxy(a,b,'ллллллллллл');
                      delete(s,length(s),1);
                      setcolor(lightgray);
                      outtextxy(a,b,s);
                 end;
     until ord(c)=13;
     val(s,x,code);
     CitesteNumar:=x;
     setcolor(lightgray);
end;

function coordonata(a,b:integer):integer;
var c:char;
    code,x:integer;
    s:string;
begin
     s:='';
     repeat
           c:=readkey;
           if (c in ['0'..'9']) or (c='-') then
              begin
                   setcolor(black);
                   outtextxy(a,b,'лллллллллл');
                   s:=s+c;
                   setcolor(lightgray);
                   outtextxy(a,b,s);
              end;
           if ord(c)=8 then
              if length(s)>0 then
                 begin
                      setcolor(black);
                      outtextxy(a,b,'лллллллллл');
                      delete(s,length(s),1);
                      setcolor(lightgray);
                      outtextxy(a,b,s);
                 end;
     until ord(c)=13;
     val(s,x,code);
     coordonata:=x;
     setcolor(lightgray);
end;


procedure legenda;
begin
     setcolor(lightgray);
     outtextxy(370,300,'S = Aria');
     outtextxy(370,320,'R = Raza cercului circumscris');
     outtextxy(370,340,'r = Raza cercului inscris');
     outtextxy(370,360,'hX = Inaltimea din pct. X');
     outtextxy(370,380,'P = Perimetrul');
     outtextxy(370,400,'p = Semiperimetrul');
     outtextxy(370,420,'mX = Mediana din pct. X');
     outtextxy(370,440,'bisX = Bisectoarea din pct. X');
end;

procedure info;
begin
     setcolor(lightgray);
     outtextxy(60,420,'Apasa ESC pentru a iesi in meniu');
     outtextxy(20,440,'Apasa ENTER pentru a introduce noi valori');
end;

procedure hexagon;
begin
     setcolor(lightgray);
     line(460,150,540,150);
     line(460,278,540,278);
     line(540,150,575,214);
     line(575,214,540,278);
     line(460,278,425,214);
     line(425,214,460,150);
end;

procedure clear_hexagon;
begin
     setcolor(black);
     line(460,150,540,150);
     line(460,278,540,278);
     line(540,150,575,214);
     line(575,214,540,278);
     line(460,278,425,214);
     line(425,214,460,150);
end;

procedure hexagon_p;
begin
     setcolor(white);
     line(460,260,540,260);
     line(460,388,540,388);
     line(540,260,575,324);
     line(575,324,540,388);
     line(460,388,425,324);
     line(425,324,460,260);
end;

procedure patrat;
begin
     setcolor(lightgray);
     line(450,280,550,280);
     line(450,280,450,180);
     line(450,180,550,180);
     line(550,180,550,280);
end;

procedure clear_patrat;
begin
     setcolor(Black);
     line(450,280,550,280);
     line(450,280,450,180);
     line(450,180,550,180);
     line(550,180,550,280);
end;

procedure patrat_p;
begin
     line(50,100,150,100);
     line(50,200,50,100);
     line(150,200,150,100);
     line(50,200,150,200);
end;

procedure dreptunghi;
begin
     setcolor(lightgray);
     line(400,280,580,280);
     line(400,280,400,180);
     line(400,180,580,180);
     line(580,180,580,280);
end;

procedure dreptunghi_p;
begin
     line(190,70,370,70);
     line(190,70,190,115);
     line(190,115,370,115);
     line(370,70,370,115);
end;

procedure clear_dreptunghi;
begin
     setcolor(black);
     line(400,280,580,280);
     line(400,280,400,180);
     line(400,180,580,180);
     line(580,180,580,280);
end;

procedure triunghi;
begin
     setcolor(lightgray);
     line(550,150,425,250);
     line(550,150,600,250);
     line(425,250,600,250);
end;

procedure triunghi_p;
begin
     Line(170,300,50,350);
     Line(170,300,150,415);
     Line(50,350,150,415);
end;

procedure clear_triunghi;
begin
     setcolor(black);
     line(550,150,425,250);
     line(550,150,600,250);
     line(425,250,600,250);
end;

procedure triunghi_dreptunghic;
begin
     setcolor(lightgray);
     line(425,251,600,251);
     line(425,170,425,251);
     line(425,170,600,251);
end;

procedure clear_triunghi_dreptunghic;
begin
     setcolor(black);
     line(425,251,600,251);
     line(425,170,425,251);
     line(425,170,600,251);
end;

procedure triunghi_echilateral;
begin
     setcolor(lightgray);
     line(463,252,560,252);
     line(512,172,463,252);
     line(512,172,560,252);
end;

procedure clear_triunghi_echilateral;
begin
     setcolor(black);
     line(463,252,560,252);
     line(512,172,463,252);
     line(512,172,560,252);
end;

procedure triunghi_isoscel;
begin
     setcolor(lightgray);
     line(460,253,570,253);
     line(460,253,512,140);
     line(512,140,570,253);
end;

procedure clear_triunghi_isoscel;
begin
     setcolor(black);
     line(460,253,570,253);
     line(460,253,512,140);
     line(512,140,570,253);
end;

procedure romb;
begin
     setcolor(lightgray);
     line(500,120,450,220);
     line(500,120,550,220);
     line(450,220,500,320);
     line(550,220,500,320);
end;

procedure romb_p;
begin
     line(300,250,260,330);
     line(300,250,340,330);
     line(260,330,300,410);
     line(340,330,300,410);
end;

procedure clear_romb;
begin
     setcolor(black);
     line(500,120,450,220);
     line(500,120,550,220);
     line(450,220,500,320);
     line(550,220,500,320);
end;

procedure cerc;
var radius:integer;
begin
     setcolor(lightgray);
     Radius:=1;
     Arc(500, 220, 100, 460, Radius * 75);
end;

procedure cerc_p;
var radius:integer;
begin
     Radius:=1;
     Arc(500, 130, 100, 460, Radius * 80);
end;

procedure clear_cerc;
var radius:integer;
begin
     setcolor(black);
     Radius:=1;
     Arc(500, 220, 100, 460, Radius * 75);
end;

begin
     clrscr;
     gd:=detect;
     InitGraph(Gd, Gm,'D:\TP\BGI');
     margine;
     patrat_p;
     cerc_p;
     hexagon_p;
     dreptunghi_p;
     triunghi_p;
     romb_p;
     cursor:=1;
     setcolor(yellow);
     outtextxy(290,170,'START');
     setcolor(lightgray);
     outtextxy(285,200,'IESIRE');
     repeat
          k:=readkey;
          pred:=cursor;
          case ord(k) of 72{sageata sus} : dec(cursor);
                         80{sageata jos} : inc(cursor);
                         13{enter}: case cursor of 1:
                                                     begin
                                                            cleardevice;
                                                            setcolor(white);
                                          outtextxy(75,50,'ATENTIE ! Desenele NU o sa corespunda cu dimensiunile introduse !');
          						    cursor2:=1;
                                                            margine;
                                                            setcolor(yellow);
                                                            outtextxy(285,140,'TRIUNGHI');
                                                            setcolor(lightgray);
                                                            triunghi;
                                                            outtextxy(300,180,'CERC');
                                                            outtextxy(293,220,'PATRAT');
          						    outtextxy(300,260,'ROMB');
          						    outtextxy(290,300,'HEXAGON');
                                                            outtextxy(278,340,'DREPTUNGHI');
          						    outtextxy(550,420,'INAPOI');
          						    repeat
               							 k:=readkey;
                						 pred2:=cursor2;
                						 case ord(k) of 72{sageata sus} : dec(cursor2);
                               							80{sageata jos} : inc(cursor2);
                               							13{enter}: case cursor2 of
                                                                                1:
                                                                                begin
                                                                                     cleardevice;
                                                                                     margine;
                                                                                     cursor3:=1;
                                                                                     triunghi_isoscel;
                                                                                     setcolor(yellow);
                                                                                     outtextxy(255,150,'TRIUNGHI ISOSCEL');
                                                                                     setcolor(lightgray);
                                                                                     outtextxy(240,190,'TRIUNGHI ECHILATERAL');
                                                                                     outtextxy(240,230,'TRIUNGHI DREPTUNGHIG');
                                                                                     outtextxy(252,270,'TRIUNGHI OARECARE');
                                                                                     outtextxy(550,420,'INAPOI');
                                                                                repeat
                                                                                     k:=readkey;
                                                                                     pred3:=cursor3;
                                                                                     case ord(K) of 72 : dec(cursor3);
                                                                                                    80 : inc(cursor3);
                                                                                                    13 : case cursor3 of
                                                                                     1: begin
                                                                                        cleardevice;
                                                                                        margine;
                                                                                        legenda;
                                                                                        setcolor(lightgray);
                                                                outtextxy(100,45,'Lungimile laturilor AB si AC sunt egale !');
                                                                    outtextxy(100,65,'Masura unghiului B si C sunt egale !');
                                                                                        setcolor(lightgray);
                                                                                        triunghi_isoscel;
                                                                                        outtextxy(455,255,'B');
                                                                                        outtextxy(509,130,'A');
                                                                                        outtextxy(572,255,'C');
                                                                                        outtextxy(150,105,'AB=AC=');
                                                                                        ab:=citestenumar(205,105);
                                                                                        ac:=ab;
                                                                                        outtextxy(150,125,'BC=');
                                                                                        bc:=citestenumar(180,125);
                                                                                 P:=ab+ac+bc;
                                                                                 sp:=p / 2;
                                                                            Aria:=sqrt(abs(sp * (sp-ab) * (sp-ac) * (sp-bc)));
                                                                                        setcolor(yellow);
                                                                                        hA:=2 * (aria / bc);
                                                                                        str(hA:6:2,t);
                                                                                        outtextxy(150,165,'hA=mA=bisA=');
                                                                                        outtextxy(235,165,t);
                                                                                        line(512,141,512,252);
                                                                                        hB:=2 * (aria / ac);
                                                                                        str(hB:6:2,t);
                                                                                        outtextxy(150,185,'hB=hC=');
                                                                                        outtextxy(195,185,t);
                                                                                        setcolor(white);
                                                                                        str(aria:6:2,t);
                                                                                        outtextxy(150,205,'S=');
                                                                                        outtextxy(165,205,t);
                                                                                        str(p:6:2,t);
                                                                                        outtextxy(150,225,'P=');
                                                                                        outtextxy(165,225,t);
                                                                                        str(sp:6:2,t);
                                                                                        outtextxy(150,245,'p=');
                                                                                        outtextxy(165,245,t);
											if aria<>0 then
											   begin
                                                                                        	setcolor(lightblue);
                                                                                        	rc:=(ab * bc * ac) / (4 * aria);
                                                                                        	str(rc:6:2,t);
                                                                                        	outtextxy(150,265,'R=');
                                                                                        	outtextxy(165,265,t);
                                                                                        	Arc(514, 210, 100, 460, 1 * 70);
                                                                                        	line(512,208,550,150);
                                                                                                setcolor(lightgray);
                                                                                                uA:= bc / (2 * rc);
                                                                                                str(uA:6:2,t);
                                                                                                outtextxy(250,105,'sinA=');
                                                                                                outtextxy(290,105,t);
                                                                                                ub:= ac / (2 * rc);
                                                                                                str(uB:6:2,t);
                                                                                               outtextxy(250,125,'sinB=sinC=');
                                                                                                outtextxy(330,125,t);
											   end;
                                                                                        setcolor(green);
                                                                                        ri:=aria / sp;
                                                                                        str(ri:6:2,t);
                                                                                        outtextxy(150,285,'r=');
                                                                                        outtextxy(165,285,t);
                                                                                        Arc(513, 218, 100, 460, 1 * 34);
                                                                                        line(513,220,493,190);
                                                                                        setcolor(brown);
                                                                           medb:=sqrt(abs((2 * (bc*bc + ab*ab) - ac*ac) / 4 ));
                                                                                        str(medb:6:2,t);
                                                                                        outtextxy(150,305,'mB=mC=');
                                                                                        outtextxy(195,305,t);
                                                                                        line(460,253,540,200);
                                                                                        setcolor(magenta);
                                                          bisb:= sqrt(abs(((4 * bc * ab) * sp * (sp-ac)) / ((ab+bc)*(ab+bc))));
                                                                                        line(570,253,480,208);
                                                                                        str(bisb:6:2,t);
                                                                                        outtextxy(150,325,'bisB=bisC=');
                                                                                        outtextxy(230,325,t);
                                                                                        info;
                                                                                     end;
                                                                                     2: begin
                                                                                        cleardevice;
                                                                                        margine;
                                                                                        legenda;
                                                                                        triunghi_echilateral;
                                                                                        setcolor(lightgray);
                                                                                        outtextxy(455,255,'B');
                                                                                        outtextxy(508,163,'A');
                                                                                        outtextxy(572,255,'C');
                                                 outtextxy(80,75,'Lungimile medianei, bisectoarei, si inaltimii sunt egale !');
                                                                                        outtextxy(150,155,'^ ^ ^');
                                                                                        outtextxy(150,160,'A=B=C=60ј');
                                                                                        outtextxy(150,185,'AB=AC=BC=');
                                                                                        ab:=citestenumar(225,185);
                                                                                        bc:=ab;
                                                                                        ac:=ab;
                                                                                        ha:=(ab * 1.73) / 2;
                                                                                        str(ha:6:2,t);
                                                                                        setcolor(yellow);
                                                                                        line(512,172,512,252);
                                                                                        outtextxy(150,210,'h=m=bis=');
                                                                                        outtextxy(210,210,t);
                                                                                        rc:=(ab * 1.73) / 3;
                                                                                        str(rc:6:2,t);
                                                                                        setcolor(lightblue);
                                                                                        outtextxy(150,230,'R=');
                                                                                        outtextxy(165,230,t);
                                                                                        line(512,227,463,252);
                                                                                        Arc(512, 227, 100, 460, 1 * 55);
                                                                                        setcolor(lightgray);
                                                                                        ri:=(ab * 1.73) / 6;
                                                                                        str(ri:6:2,t);
                                                                                        setcolor(green);
                                                                                        outtextxy(150,250,'r=');
                                                                                        outtextxy(165,250,t);
                                                                                        line(512,227,538,214);
                                                                                        Arc(512, 225, 100, 460, 1 * 27);
                                                                                        setcolor(lightgray);
                                                                                        aria:=(ab * ab * 1.73) / 4;
                                                                                        str(aria:6:2,t);
                                                                                        setcolor(white);
                                                                                        outtextxy(150,270,'S=');
                                                                                        outtextxy(165,270,t);
                                                                                        setcolor(black);
                                                                                        setcolor(lightgray);
                                                                                        p:=3 * ab;
                                                                                        str(p:6:2,t);
                                                                                        setcolor(white);
                                                                                        outtextxy(150,290,'P=');
                                                                                        outtextxy(165,290,t);
                                                                                        setcolor(lightgray);
                                                                                        sp:=(3 * ab) / 2;
                                                                                        str(sp:6:2,t);
                                                                                        setcolor(white);
                                                                                        outtextxy(150,310,'p=');
                                                                                        outtextxy(165,310,t);
                                                                                        info;
                                                                                    end;
                                                                                     3: begin
                                                                                        cleardevice;
                                                                                        margine;
                                                                                        legenda;
                                                                                        setcolor(lightgray);
                                                                                        line(395,191,590,191);
                                                                                        line(395,110,395,191);
                                                                                        line(395,110,590,191);
                                                                                        setcolor(lightgray);
                                                                                        outtextxy(395,195,'B');
                                                                                        outtextxy(395,100,'A');
                                                                                        outtextxy(590,195,'C');
                                                                                        outtextxy(150,65,'AB=');
                                                                                        ab:=citestenumar(180,65);
                                                                                        outtextxy(150,85,'AC=');
                                                                                        ac:=citestenumar(180,85);
                                                                                        outtextxy(150,105,'BC=');
                                                                                        bc:=citestenumar(180,105);
                                                                                        setcolor(lightgray);
                                                              aria:=(ab * bc) / 2;
                                                              setcolor(yellow);
                                                              ha:=ab;
                                                              str(ha:6:2,t);
                                                              outtextxy(150,125,'hA=');
                                                              outtextxy(175,125,t);
                                                              hc:=bc;
                                                              str(hc:6:2,t);
                                                              outtextxy(150,165,'hC=');
                                                              outtextxy(175,165,t);
                                                              hb:=2 * (aria/ac);
                                                              str(hb:6:2,t);
                                                              outtextxy(150,145,'hB=');
                                                              outtextxy(175,145,t);
                                                              line(395,191,426,124);
                                                              setcolor(white);
                                                              str(aria:6:2,t);
                                                              outtextxy(150,185,'S=');
                                                              outtextxy(175,185,t);
                                                              sp:=(ab+ac+bc) / 2;
                                                              str(sp:6:2,t);
                                                              outtextxy(150,205,'p=');
                                                              outtextxy(175,205,t);
                                                              p:=2*sp;
                                                              str(p:6:2,t);
                                                              outtextxy(150,225,'P=');
                                                              outtextxy(175,225,t);
							      if aria<>0 then
							      	begin	
                                                              		setcolor(lightblue);
                                                              		rc:=(ab * ac * bc) / (4 * aria);
                                                              		str(rc:6:2,t);
                                                              		outtextxy(150,245,'R=');
                                                              		outtextxy(175,245,t);
                                                              		line(487,48,487,148);
                                                              		Arc(492, 153, 100, 460, 1 * 105);
								end;
                                                              setcolor(lightgray);
                                                              uA:=bc / (2 * rc);
                                                              str(uA:6:2,t);
                                                              outtextxy(210,65,'sinA=');
                                                              outtextxy(245,65,t);
                                                              uB:=ac / (2 * rc);
                                                              str(uB:6:2,t);
                                                              outtextxy(210,85,'sinB=');
                                                              outtextxy(245,85,t);
                                                              uC:=ab / (2 * rc);
                                                              str(uC:6:2,t);
                                                              outtextxy(210,105,'sinC=');
                                                              outtextxy(245,105,t);
                                                              setcolor(green);
                                                              ri:=aria / sp;
                                                              str(ri:6:2,t);
                                                              outtextxy(150,265,'r=');
                                                              outtextxy(175,265,t);
                                                              Arc(427, 159, 100, 460, 1 * 32);
                                                              line(428,158,428,191);
                                                              setcolor(brown);
                                                              meda:=sqrt(abs((2 * (ac*ac + ab*ab) - bc*bc) / 4 ));
                                                              line(395,110,492,190);
                                                              str(meda:6:2,t);
                                                              outtextxy(150,285,'mA=');
                                                              outtextxy(175,285,t);
                                                              medb:=sqrt(abs((2 * (ab*ab + bc*bc) - ac*ac) / 4 ));
                                                              str(medb:6:2,t);
                                                              outtextxy(150,305,'mB=');
                                                              outtextxy(175,305,t);
                                                              medc:=sqrt(abs((2 * (bc*bc + ac*ac) - ab*ab) / 4 ));
                                                              str(medc:6:2,t);
                                                              outtextxy(150,325,'mC=');
                                                              outtextxy(175,325,t);
                                                              setcolor(magenta);
                                                          bisa:= sqrt(abs(((4 * ac * ab) * sp * (sp-bc)) / ((ac+ab)*(ac+ab))));
                                                              str(bisa:6:2,t);
                                                              outtextxy(150,345,'bisA=');
                                                              outtextxy(190,345,t);
                                                          bisb:= sqrt(abs(((4 * bc * ab) * sp * (sp-ac)) / ((ab+bc)*(ab+bc))));
                                                              str(bisb:6:2,t);
                                                              outtextxy(150,365,'bisB=');
                                                              outtextxy(190,365,t);
                                                          bisc:= sqrt(abs(((4 * ac * bc) * sp * (sp-ab)) / ((ac+bc)*(ac+bc))));
                                                              line(590,191,395,152);
                                                              str(bisC:6:2,t);
                                                              outtextxy(150,385,'bisC=');
                                                              outtextxy(190,385,t);
                                                              info;
                                                                                        end;
                                                                                     4: begin
                                                                                        cleardevice;
                                                                                        margine;
                                                                                        legenda;
                                                                                        line(500,110,375,210);
                                                                                        line(500,110,550,210);
                                                                                        line(375,210,550,210);
                                                                                        setcolor(lightgray);
                                                                                        outtextxy(375,215,'B');
                                                                                        outtextxy(500,100,'A');
                                                                                        outtextxy(550,215,'C');
                                                                                        outtextxy(150,65,'AB=');
                                                                                        ab:=citestenumar(180,65);
                                                                                        outtextxy(150,85,'AC=');
                                                                                        ac:=citestenumar(180,85);
                                                                                        outtextxy(150,105,'BC=');
                                                                                        bc:=citestenumar(180,105);
                                                                                  P:=ab+ac+bc;
                                                                                  sp:=p / 2;
                                                                            Aria:=sqrt(abs(sp * (sp-ab) * (sp-ac) * (sp-bc)));
                                                                                  setcolor(yellow);
                                                                                  hA:=2 * (aria / bc);
                                                                                  str(hA:6:2,t);
                                                                                  outtextxy(150,125,'hA=');
                                                                                  outtextxy(175,125,t);
                                                                                  line(500,110,500,210);
                                                                                  hB:=2 * (aria / ac);
                                                                                  str(hB:6:2,t);
                                                                                  outtextxy(150,145,'hB=');
                                                                                  outtextxy(175,145,t);
                                                                                  hC:=2 * (aria / ab);
                                                                                  str(hC:6:2,t);
                                                                                  outtextxy(150,165,'hC=');
                                                                                  outtextxy(175,165,t);
                                                                                  setcolor(white);
                                                                                  str(aria:6:2,t);
                                                                                  outtextxy(150,185,'S=');
                                                                                  outtextxy(175,185,t);
                                                                                  str(p:6:2,t);
                                                                                  outtextxy(150,205,'P=');
                                                                                  outtextxy(175,205,t);
                                                                                  str(sp:6:2,t);
                                                                                  outtextxy(150,225,'p=');
                                                                                  outtextxy(175,225,t);
										  if aria<>0 then
											   begin
                                                                                  		setcolor(lightblue);
                                                                                  		rc:=(ab * ac * bc) / (4 * aria);
                                                                                  		str(rc:6:2,t);
                                                                                  		outtextxy(150,245,'R=');
                                                                                  		outtextxy(175,245,t);
                                                                                  		Arc(462, 191, 100, 460, 1 * 90);
                                                                                  		line(462,189,420,271);
  											   end;
                                                                                  setcolor(green);
                                                                                  ri:= aria / sp;
                                                                                  str(ri:6:2,t);
                                                                                  outtextxy(150,265,'r=');
                                                                                  outtextxy(175,265,t);
                                                                                  Arc(486, 170, 100, 460, 1 * 39);
                                                                                  line(487,170,487,210);
                                                              setcolor(lightgray);
                                                              uA:=bc / (2 * rc);
                                                              str(uA:6:2,t);
                                                              outtextxy(210,65,'sinA=');
                                                              outtextxy(245,65,t);
                                                              uB:=ac / (2 * rc);
                                                              str(uB:6:2,t);
                                                              outtextxy(210,85,'sinB=');
                                                              outtextxy(245,85,t);
                                                              uC:=ab / (2 * rc);
                                                              str(uC:6:2,t);
                                                              outtextxy(210,105,'sinC=');
                                                              outtextxy(245,105,t);
                                                              setcolor(brown);
                                                              meda:=sqrt(abs((2 * (ac*ac + ab*ab) - bc*bc) / 4 ));
                                                              str(meda:6:2,t);
                                                              outtextxy(150,285,'mA=');
                                                              outtextxy(175,285,t);
                                                              medb:=sqrt(abs((2 * (ab*ab + bc*bc) - ac*ac) / 4 ));
                                                              str(medb:6:2,t);
                                                              outtextxy(150,305,'mB=');
                                                              outtextxy(175,305,t);
                                                              line(375,210,526,159);
                                                              medc:=sqrt(abs((2 * (bc*bc + ac*ac) - ab*ab) / 4 ));
                                                              str(medc:6:2,t);
                                                              outtextxy(150,325,'mC=');
                                                              outtextxy(175,325,t);
                                                              setcolor(magenta);
                                                          bisa:= sqrt(abs(((4 * ac * ab) * sp * (sp-bc)) / ((ac+ab)*(ac+ab))));
                                                              str(bisa:6:2,t);
                                                              outtextxy(150,345,'bisA=');
                                                              outtextxy(190,345,t);
                                                          bisb:= sqrt(abs(((4 * bc * ab) * sp * (sp-ac)) / ((ab+bc)*(ab+bc))));
                                                              str(bisb:6:2,t);
                                                              outtextxy(150,365,'bisB=');
                                                              outtextxy(190,365,t);
                                                          bisc:= sqrt(abs(((4 * ac * bc) * sp * (sp-ab)) / ((ac+bc)*(ac+bc))));
                                                              str(bisC:6:2,t);
                                                              outtextxy(150,385,'bisC=');
                                                              outtextxy(190,385,t);
                                                              line(550,210,452,148);
                                                                                  info;
                                                                                        end;
                                                                                     5: k:=chr(27);
                                                                                                    end;
                                                                                     end;
                                                                                     if cursor3=6 then cursor3:=1;
                                                                                     if cursor3=0 then cursor3:=5;
                                                                                     if pred3<>cursor3 then
                                                                                     begin
                                                                                     setcolor(yellow);
                                                                                     case cursor3 of
                                                                                     1: begin
                                                                                     outtextxy(255,150,'TRIUNGHI ISOSCEL');
                                                                                     triunghi_isoscel;
                                                                                     end;
                                                                                     2: begin
                                                                                     outtextxy(240,190,'TRIUNGHI ECHILATERAL');
                                                                                     triunghi_echilateral;
                                                                                     end;
                                                                                     3: begin
                                                                                     outtextxy(240,230,'TRIUNGHI DREPTUNGHIG');
                                                                                     triunghi_dreptunghic;
                                                                                     end;
                                                                                     4: begin
                                                                                     outtextxy(252,270,'TRIUNGHI OARECARE');
                                                                                     triunghi;
                                                                                     end;
                                                                                     5: outtextxy(550,420,'INAPOI');
                                                                                     end;
                                                                                     setcolor(lightgray);
                                                                                     case pred3 of
                                                                                     1: begin
                                                                                     outtextxy(255,150,'TRIUNGHI ISOSCEL');
                                                                                     clear_triunghi_isoscel;
                                                                                     end;
                                                                                     2: begin
                                                                                     outtextxy(240,190,'TRIUNGHI ECHILATERAL');
                                                                                     clear_triunghi_echilateral;
                                                                                     end;
                                                                                     3: begin
                                                                                     outtextxy(240,230,'TRIUNGHI DREPTUNGHIG');
                                                                                     clear_triunghi_dreptunghic;
                                                                                     end;
                                                                                     4: begin
                                                                                     outtextxy(252,270,'TRIUNGHI OARECARE');
                                                                                     clear_triunghi;
                                                                                     end;
                                                                                     5: outtextxy(550,420,'INAPOI');
                                                                                     end;
                                                                                     end;
                                                                                     until ord(k)=27;
                                                                                k:=chr(0);
                                                                                cleardevice;
                                                                                triunghi;
                                                                                setcolor(yellow);
                                                                                outtextxy(285,140,'TRIUNGHI');
                                                                                end;
                                                        			2:
                                                                                begin
                                                                                repeat
                                                                                cleardevice;
                                                                                margine;
                                                                                setcolor(lightgray);
                                                                                Arc(500, 220, 100, 460, 1 * 75);
                                                                                outtextxy(420,360,'r = Raza cercului');
                                                                                outtextxy(420,380,'C = Centrul cercului');
                                                                                outtextxy(420,400,'S = Aria cercului');
                                                                               outtextxy(420,420,'c = Circumferinta cercului');
                                              outtextxy(60,65,'Ecuatia cercului: x^2 + y^2 - 2ax - 2by + a^2 + b^2 - r^2 = 0');
                                                                                outtextxy(150,85,'a=');
                                                                                a:=coordonata(175,85);
                                                                                xc:=a;
                                                                                str(xc:4:1,t);
                                                                                outtextxy(150,105,'b=');
                                                                                b:=coordonata(175,105);
                                                                                yc:=b;
                                                                                outtextxy(150,125,'a^2 + b^2 - r^2=');
                                                                                l:=coordonata(285,125);
                                                                                str(yc:4:1,t1);
                                                                                setcolor(green);
                                                                                outtextxy(505,220,'C');
                                                                                outtextxy(150,145,'C(');
                                                                                outtextxy(165,145,t);
                                                                                outtextxy(198,145,',');
                                                                                outtextxy(205,145,t1);
                                                                                outtextxy(245,145,')');
                                                                                setcolor(yellow);
                                                                                r:=sqrt(abs(a * a + b * b + l));
                                                                                line(500,145,500,220);
                                                                                str(r:6:2,t);
                                                                                outtextxy(150,165,'r=');
                                                                                outtextxy(165,165,t);
                                                                                setcolor(lightblue);
                                                                                aria:=3.14 * r * r;
                                                                                str(aria:6:2,t);
                                                                                outtextxy(150,185,'S=');
                                                                                outtextxy(175,185,t);
                                                                                setcolor(brown);
                                                                                circumf:= 2 * 3.14 * r;
                                                                                str(circumf:6:2,t);
                                                                                outtextxy(150,205,'c=');
                                                                                outtextxy(175,205,t);
                                                                                setcolor(lightgray);
                                                                                outtextxy(30,225,'Doresti sa afli pozitia ');
                                                                            outtextxy(80,245,'unui punct fata de cerc? (D/N)');
                                                                                k:=readkey;
                                                                                if pos(k,'Dd')>0 then
                                                                                   begin
                                                                                        outtextxy(80,265,'Coordonata x=');
                                                                                        xp:=coordonata(185,265);
                                                                                        outtextxy(230,265,'Coordonata y=');
                                                                                        yp:=coordonata(335,265);
                                                                            dist:=sqrt(abs((xc-xp)*(xc-xp) + (yc-yp)*(yc-yp)));
                                                                                 setcolor(white);
                                                       if dist < r then
                                                          begin
                                                               outtextxy(90,285,'Se afla in interiorul cercului');
                                                               arc(465,255,10,1,1*2);
                                                               outtextxy(470,245,'M');
                                                          end
                                                       else if dist = r then
                                                            begin
                                                                 outtextxy(90,285,'Se afla pe cerc');
                                                                 outtextxy(539,290,'M');
                                                                 arc(536,286,10,1,1*2);
                                                            end
                                                     else if dist > r then
                                                          begin
                                                               outtextxy(90,285,'Se afla in exteriorul cercului');
                                                               outtextxy(606,230,'M');
                                                               arc(600,236,10,1,1*2);
                                                          end;
                                                                                  end;
                                                                                  setcolor(lightgray);
                                                                            outtextxy(30,325,'Doresti sa afli ec. tangentei ');
                                                                            outtextxy(80,345,'la cerc a unui punct? (D/N)');
                                                                            k:=readkey;
                                                                            if pos(k,'Dd')>0 then
                                                                               begin
                                                                                    outtextxy(80,365,'Coordonata x=');
                                                                                    xp:=coordonata(185,365);
                                                                                    outtextxy(230,365,'Coordonata y=');
                                                                                    yp:=coordonata(335,365);
                                                                                    panta:= (yp-yc) / (xp - xc);
                                                                                    panta:= (-1) *  (1/panta);
                                                                                    setcolor(white);
                                                                                    str(panta:6:2,t1);
                                                                                    str(panta*(-xp)+yp:6:2,t2);
                                                                                    if panta*(-xp)+yp < 0 then
                                                                                       t:='y = '+t1+'x'+t2
                                                                                    else if panta*(-xp)+yp=0 then
                                                                                            t:='y = '+t1+'x'
                                                                                         else t:='y = '+t1+'x'+'+'+t2;
                                                                                    outtextxy(110,385,t);
                                                                                    line(500,220,550,165);
                                                                                    outtextxy(555,157,'T');
                                                                                    line(480,105,620,225);
                                                                                end;
                                                                                info;
                                                                                k:=readkey;
                                                                                until ord(k)=27;
                                                                                k:=chr(0);
                                                                                cleardevice;
                                                                                triunghi;
                                                                                setcolor(yellow);
                                                                                outtextxy(285,140,'TRIUNGHI');
                                                                                cursor2:=1;
                                                                                pred2:=cursor2;
                                                                                end;
                                                         			3:begin
                                                                                      repeat
                                                                                      cleardevice;
                                                                                      margine;
                                                                                      line(450,250,550,250);
                                                                                      line(450,250,450,150);
                                                                                      line(450,150,550,150);
                                                                                      line(550,150,550,250);
                                                                                      legenda;
                                                                                      outtextxy(150,100,'^ ^ ^ ^');
                                                                                      outtextxy(150,105,'A=B=C=D=90ј');
                                    outtextxy(50,65,'Toate laturie si unghiurile patrulaterului, sunt de dimensiuni egale !');
                                                                                      outtextxy(440,140,'A');
                                                                                      outtextxy(553,140,'D');
                                                                                      outtextxy(440,255,'B');
                                                                                      outtextxy(553,255,'C');
                                                                                      outtextxy(150,125,'AB=BC=CD=DA=');
                                                                                      ab:=citestenumar(250,125);
                                                                                      setcolor(yellow);
                                                                                      ha:=ab;
                                                                                      str(ha:6:2,t);
                                                                                      outtextxy(150,145,'hA=hB=hC=hD=');
                                                                                      outtextxy(235,145,t);
                                                                                      line(450,150,450,250);
                                                                                      setcolor(white);
                                                                                      aria:=ab*ab;
                                                                                      str(aria:6:2,t);
                                                                                      outtextxy(150,165,'S=');
                                                                                      outtextxy(165,165,t);
                                                                                      p:=4 * ab;
                                                                                      str(p:6:2,t);
                                                                                      outtextxy(150,185,'P=');
                                                                                      outtextxy(165,185,t);
                                                                                      sp:=p / 2;
                                                                                      str(sp:6:2,t);
                                                                                      outtextxy(150,205,'p=');
                                                                                      outtextxy(165,205,t);
                                                                                      setcolor(lightblue);
                                                                                      rc:=(ab * sqrt(2)) / 2;
                                                                                      str(rc:6:2,t);
                                                                                      outtextxy(150,225,'R=');
                                                                                      outtextxy(165,225,t);
                                                                                      Arc(500, 200, 100, 460, 1 *71);
                                                                                      line(500,200,500,270);
                                                                                      setcolor(green);
                                                                                      ri:=ab / 2;
                                                                                      str(ri:6:2,t);
                                                                                      outtextxy(150,245,'r=');
                                                                                      outtextxy(165,245,t);
                                                                                      Arc(500, 200, 100, 460, 1 *49);
                                                                                      line(500,200,550,200);
                                                                                      setcolor(brown);
                                                                                      medA:=sqrt(abs((ab/2)*(ab/2) + ab*ab));
                                                                                      str(medA:6:2,t);
                                                                                     outtextxy(150,265,'mA=mB=mC=mD=');
                                                                                     outtextxy(235,265,t);
                                                                                     line(450,250,500,150);
                                                                                     setcolor(magenta);
                                                                                      bisA:=ab * sqrt(2);
                                                                                      str(bisA:6:2,t);
                                                                                     outtextxy(150,285,'bisA=bisB=bisC=bisD=');
                                                                                     outtextxy(300,285,t);
                                                                                     line(450,150,550,250);
                                                                                     setcolor(white);
                                                                                      d:=ab * sqrt(2);
                                                                                      str(d:6:2,t);
                                                                                      outtextxy(150,305,'AC=BD=');
                                                                                      outtextxy(190,305,t);
                                                                                      line(450,250,550,150);
                                                                                      info;
                                                                                      k:=readkey;
                                                                                      until ord(k)=27;
                                                                                      k:=chr(0);
                                                                                      cleardevice;
                                                                                      triunghi;
                                                                                      setcolor(yellow);
                                                                                      outtextxy(285,140,'TRIUNGHI');
                                                                                      cursor2:=1;
                                                                                      pred2:=cursor2;
                                                                                  end;
                                                         			4:begin
                                                                                  repeat
                                                                                  cleardevice;
                                                                                  legenda;
                                                                                  margine;
                                                                                  setcolor(lightgray);
                                                                                  line(500,80,450,180);
                                                                                  line(500,80,550,180);
                                                                                  line(450,180,500,280);
                                                                                  line(550,180,500,280);
                                                                                  outtextxy(497,70,'A');
                                                                                  outtextxy(439,175,'B');
                                                                                  outtextxy(497,285,'C');
                                                                                  outtextxy(555,175,'D');
                                                                                  outtextxy(150,105,'AB=BC=CD=DA=');
                                                                                  ab:=citestenumar(255,105);
                                                                                  outtextxy(150,125,'AC=');
                                                                                  ac:=citestenumar(180,125);
                                                                                  line(500,80,500,280);
                                                                                  outtextxy(150,145,'BD=');
                                                                                  bd:=citestenumar(180,145);
                                                                                  line(450,180,550,180);
                                                                                  aria:=(ac * bd) / 2;
                                                                                  setcolor(yellow);
                                                                                  hA:= aria / ab;
                                                                                  str(hA:6:2,t);
                                                                                  outtextxy(150,165,'hB=hD=');
                                                                                  outtextxy(190,165,t);
                                                                                  line(450,180,531,144);
                                                                                  setcolor(white);
                                                                                  str(aria:6:2,t);
                                                                                  outtextxy(150,185,'S=');
                                                                                  outtextxy(165,185,t);
                                                                                  p:=4 * ab;
                                                                                  str(p:6:2,t);
                                                                                  outtextxy(150,205,'P=');
                                                                                  outtextxy(165,205,t);
                                                                                  sp:=p / 2;
                                                                                  str(sp:6:2,t);
                                                                                  outtextxy(150,225,'p=');
                                                                                  outtextxy(165,225,t);
                                                                                  setcolor(green);
                                                                                  ri:=bd / 2;
                                                                                  str(ri:6:2,t);
                                                                                  outtextxy(150,245,'r=');
                                                                                  outtextxy(165,245,t);
                                                                                  Arc(500, 180, 100, 460, 1 *44);
                                                                                  line(500,180,530,213);
                                                                                  setcolor(brown);
                                                                           medB:=sqrt(abs((2 * (ab*ab + ab*ab) - bd*bd) / 4 ));
                                                                                  str(medB:6:2,t);
                                                                                  outtextxy(150,265,'medB=medD=');
                                                                                  outtextxy(230,265,t);
                                                                                  line(550,180,475,230);
                                                                           medA:=sqrt(abs((2 * (ac*ac + ab*ab) - ab*ab) / 4 ));
                                                                                  str(medA:6:2,t);
                                                                                  outtextxy(150,285,'medA=medC=');
                                                                                  outtextxy(230,285,t);
                                                                                  line(500,80,475,230);
                                                                                  setcolor(magenta);
                                                                                  bisA:= ac;
                                                                                  str(bisA:6:2,t);
                                                                                  outtextxy(150,305,'bisA=bisC=');
                                                                                  outtextxy(230,305,t);
                                                                                  bisB:= bd;
                                                                                  str(bisB:6:2,t);
                                                                                  outtextxy(150,325,'bisB=bisD=');
                                                                                  outtextxy(230,325,t);
                                                                                  line(450,180,550,180);
                                                                                  line(500,80,500,280);
                                                                                  info;
                                                                                  k:=readkey;
                                                                                  until ord(k)=27;
                                                                                  k:=chr(0);
                                                                                  cleardevice;
                                                                                  triunghi;
                                                                                  setcolor(yellow);
                                                                                  outtextxy(285,140,'TRIUNGHI');
                                                                                  cursor2:=1;
                                                                                  pred2:=cursor2;
                                                                                  end;
                                                         			5:begin
                                                                                       repeat
                                                                                       cleardevice;
                                                                                       margine;
                                                                                       hexagon;
                                                                                       outtextxy(455,140,'A');
                                                                                       outtextxy(540,140,'B');
                                                                                       outtextxy(580,210,'C');
                                                                                       outtextxy(540,282,'D');
                                                                                       outtextxy(456,283,'E');
                                                                                       outtextxy(415,210,'F');
                                                                                       setcolor(lightgray);
                                                                                       outtextxy(370,320,'S = Aria');
                                                                            outtextxy(370,340,'R = Raza cercului circumscris');
                                                                            outtextxy(370,360,'r = Raza cercului inscris');
                                                                                       outtextxy(370,380,'P = Perimetrul');
                                                                                       outtextxy(370,400,'p = Semiperimetrul');
                                                                            outtextxy(370,420,'bisX = Bisectoarea din pct. X');
                                                                            outtextxy(370,440,'hX = Inaltimea din pct. X');
                                                                   outtextxy(100,60,'Toate diagonalele au dimensiuni egale !');
                                                                  outtextxy(100,80,'Toate bisectoarele au dimensiuni egale !');
                                                                  outtextxy(100,100,'Toate inaltimile au dimensiuni egale !');
                                                                  outtextxy(100,40,'Fiecare unghi are 120ј');
                                                                                       outtextxy(150,145,'AB=BC=CD=DE=EF=');
                                                                                       ab:=citestenumar(280,145);
                                                                                       setcolor(white);
                                                                                       ad:=2 * ab;
                                                                                       str(ad:6,t);
                                                                                       outtextxy(150,165,'AD=');
                                                                                       outtextxy(150,165,t);
                                                                                       line(460,150,540,278);
                                                                                       aria:=(3 * ab * ab * sqrt(3)) / 2;
                                                                                       str(aria:6:2,t);
                                                                                       outtextxy(150,185,'S=');
                                                                                       outtextxy(165,185,t);
                                                                                       p:=6 * ab;
                                                                                       str(p:6:2,t);
                                                                                       outtextxy(150,205,'P=');
                                                                                       outtextxy(165,205,t);
                                                                                       sp:= p / 2;
                                                                                       str(sp:6:2,t);
                                                                                       outtextxy(150,225,'p=');
                                                                                       outtextxy(165,225,t);
                                                                                       setcolor(lightblue);
                                                                                       rc:=ab;
                                                                                       str(rc:6:2,t);
                                                                                       outtextxy(150,245,'R=');
                                                                                       outtextxy(165,245,t);
                                                                                       Arc(500, 214, 100, 460, 1 *75);
                                                                                       line(501,214,460,278);
                                                                                       setcolor(green);
                                                                                       ri:=(ab * sqrt(3)) / 2;
                                                                                       str(ri:6:2,t);
                                                                                       outtextxy(150,265,'r=');
                                                                                       outtextxy(165,265,t);
                                                                                       Arc(500, 214, 100, 460, 1 *65);
                                                                                       line(501,214,501,150);
                                                                                       setcolor(magenta);
                                                                                       bisA:=ad;
                                                                                       str(bisA:6:2,t);
                                                                                       outtextxy(150,285,'bisA=');
                                                                                       outtextxy(185,285,t);
                                                                                       line(425,214,575,214);
                                                                                       setcolor(yellow);
                                                                                       hA:=sqrt(abs(ab * ab - ad * ad));
                                                                                       str(hA:6:2,t);
                                                                                       outtextxy(150,305,'hA=');
                                                                                       outtextxy(165,305,t);
                                                                                       line(460,150,575,214);
                                                                                       info;
                                                                                       k:=readkey;
                                                                                       until ord(k)=27;
                                                                                       k:=chr(0);
                                                                                       cleardevice;
                                                                                       triunghi;
                                                                                       setcolor(yellow);
                                                                                       outtextxy(285,140,'TRIUNGHI');
                                                                                       cursor2:=1;
                                                                                       pred2:=cursor2;
                                                                                  end;
                                                                                6:begin
                                                                                       repeat
                                                                                       cleardevice;
                                                                                       margine;
                                                                                       legenda;
                                                                                       line(400,250,580,250);
                                                                                       line(400,250,400,150);
                                                                                       line(400,150,580,150);
                                                                                       line(580,150,580,250);
                                                                                       outtextxy(395,140,'A');
                                                                                       outtextxy(580,140,'D');
                                                                                       outtextxy(395,255,'B');
                                                                                       outtextxy(580,255,'C');
                                       outtextxy(50,40,'Laturile sunt egale doua cate doua, si toate unghiurile sunt egale !');
                                                                                       outtextxy(150,100,'^ ^ ^ ^');
                                                                                       outtextxy(150,105,'A=B=C=D=90ј');
                                                                                       outtextxy(150,125,'AB=CD=');
                                                                                       ab:=citestenumar(200,125);
                                                                                       outtextxy(150,145,'BC=DA=');
                                                                                       bc:=citestenumar(200,145);
                                                                                       setcolor(yellow);
                                                                                       ha:=ab;
                                                                                       str(ha:6:2,t);
                                                                                       outtextxy(150,165,'hA=hC=');
                                                                                       outtextxy(190,165,t);
                                                                                       hc:=bc;
                                                                                       str(hc:6:2,t);
                                                                                       outtextxy(150,185,'hB=hD=');
                                                                                       outtextxy(190,185,t);
                                                                                       line(400,250,400,150);
                                                                                       line(400,250,580,250);
                                                                                       setcolor(white);
                                                                                       aria:=ab * bc;;
                                                                                       str(aria:6:2,t);
                                                                                       outtextxy(150,205,'S=');
                                                                                       outtextxy(165,205,t);
                                                                                       p:= 2 * (ab + bc);
                                                                                       str(p:6:2,t);
                                                                                       outtextxy(150,225,'P=');
                                                                                       outtextxy(165,225,t);
                                                                                       sp:=p / 2;
                                                                                       str(sp:6:2,t);
                                                                                       outtextxy(150,245,'p=');
                                                                                       outtextxy(165,245,t);
                                                                                       setcolor(lightblue);
                                                                                       rc:=bc / 2;
                                                                                       str(rc:6:2,t);
                                                                                       outtextxy(150,265,'R=');
                                                                                       outtextxy(165,265,t);
                                                                                       Arc(490, 200, 100, 460, 1 *104);
                                                                                       line(490,200,490,303);
                                                                                       setcolor(brown);
                                                                                medA:=sqrt(abs((ab / 2) * (ab / 2) + bc * bc));
                                                                                       str(medA:6:2,t);
                                                                                       outtextxy(150,285,'medA=medD=');
                                                                                       outtextxy(225,285,t);
                                                                                medB:=sqrt(abs((bc / 2) * (bc / 2) + ab * ab));
                                                                                       str(medB:6:2,t);
                                                                                       outtextxy(150,305,'medB=medC=');
                                                                                       outtextxy(225,305,t);
                                                                                       line(580,250,490,150);
                                                                                       line(400,150,580,200);
                                                                                       setcolor(magenta);
                                                                                       bisA:=medB;
                                                                                       str(bisA:6:2,t);
                                                                                     outtextxy(150,325,'bisA=bisB=bisC=bisD=');
                                                                                     outtextxy(300,325,t);
                                                                                       line(400,150,490,250);
                                                                                       setcolor(white);
                                                                                       d:=sqrt(abs(ab * ab + bc * bc));
                                                                                       str(d:6:2,t);
                                                                                       outtextxy(150,345,'AC=BC=');
                                                                                       outtextxy(190,345,t);
                                                                                       line(400,150,580,250);
                                                                                       info;
                                                                                       k:=readkey;
                                                                                       until ord(k)=27;
                                                                                       k:=chr(0);
                                                                                       cleardevice;
                                                                                       triunghi;
                                                                                       setcolor(yellow);
                                                                                       outtextxy(285,140,'TRIUNGHI');
                                                                                       cursor2:=1;
                                                                                       pred2:=cursor2;
                                                                                  end;
                                                         			7:k:=chr(27);
                                          					           end;
                						 end;
               							 if cursor2=0 then cursor2:=7;
               							 if cursor2=8 then cursor2:=1;
                                                                 margine;
                                                                 setcolor(white);
                                          outtextxy(75,50,'ATENTIE ! Desenele NU o sa corespunda cu dimensiunile introduse !');
                                                                 setcolor(lightgray);
                                                                 outtextxy(300,180,'CERC');
                                                                 outtextxy(293,220,'PATRAT');
          						         outtextxy(300,260,'ROMB');
          						         outtextxy(290,300,'HEXAGON');
                                                                 outtextxy(278,340,'DREPTUNGHI');
          						         outtextxy(550,420,'INAPOI');
               							 if pred2<>cursor2 then
                  							 begin
                                                                                 setcolor(yellow);
										 case cursor2 of
                                                                                 1:begin
                                                                                       outtextxy(285,140,'TRIUNGHI');
                                                                                       triunghi;
                                      						   end;
                                       						 2: begin
                                                                                         outtextxy(300,180,'CERC');
                                                                                         cerc;
                                                                                    end;
                                       						 3: begin
                                                                                         outtextxy(293,220,'PATRAT');
                                                                                         patrat;
                                       						    end;
                                      						 4: begin
                                                                                         outtextxy(300,260,'ROMB');
                                                                                         romb;
                                       						    end;
                                       						 5: begin
                                                                                         outtextxy(290,300,'HEXAGON');
                                                                                         hexagon;
                                       					            end;
                                                                                 6: begin
                                                                                         outtextxy(278,340,'DREPTUNGHI');
                                                                                         dreptunghi;
                                                                                    end;
                                       						 7: begin
                                                                                         outtextxy(550,420,'INAPOI');
                                       						    end;
                        							end;
                        							setcolor(lightgray);
                        							case pred2 of
                                                                                 1:begin
                                                                                       outtextxy(285,140,'TRIUNGHI');
                                                                                       clear_triunghi;
                                      						   end;
                                       						 2: begin
                                                                                         outtextxy(300,180,'CERC');
                                                                                         clear_cerc;
                                                                                    end;
                                       						 3: begin
                                                                                         outtextxy(293,220,'PATRAT');
                                                                                         clear_patrat;
                                       						    end;
                                      						 4: begin
                                                                                         outtextxy(300,260,'ROMB');
                                                                                         clear_romb;
                                       						    end;
                                       						 5: begin
                                                                                         outtextxy(290,300,'HEXAGON');
                                                                                         clear_hexagon;
                                       					            end;
                                                                                 6: begin
                                                                                         outtextxy(278,340,'DREPTUNGHI');
                                                                                         clear_dreptunghi;
                                                                                    end;
                                       						 7: outtextxy(550,420,'INAPOI');
                        							end;
                   							 end;
                                                                   	 until ord(k)=27;
                                                                 k:=chr(0);
                                                                 cleardevice;
                                                     end;
                                                   2: k:=chr(27); {ESC}
                                                   end;
          end;
          if cursor=0 then cursor:=2;
          if cursor=3 then cursor:=1;
          margine;
          patrat_p;
          cerc_p;
          dreptunghi_p;
          triunghi_p;
          romb_p;
          hexagon_p;
          setcolor(yellow);
          outtextxy(290,170,'START');
          setcolor(lightgray);
          outtextxy(285,200,'IESIRE');
          if pred<>cursor then
              begin
                  setcolor(yellow);
                  case cursor of 1: outtextxy(290,170,'START');
                                 2: outtextxy(285,200,'IESIRE');
                                 end;
                  setcolor(lightgray);
                  case pred of 1: outtextxy(290,170,'START');
                               2: outtextxy(285,200,'IESIRE');
                               end;
             end;
     until ord(k)=27;
end.