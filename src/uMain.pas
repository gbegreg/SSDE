unit uMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  System.Math.Vectors, FMX.Types3D, FMX.Objects, GBEPlayerPosition,
  FMX.Objects3D, GBEHeightmap, FMX.MaterialSources, FMX.Controls3D,
  GBEJoystick, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  FMX.Viewport3D, GBEViewport3D, FMX.Ani, Generics.collections, uGBEUtils3D, uUtils, uUrl,
  FMX.Effects;

type
  TScene = (menu, space, planet);

  TfMain = class(TForm)
    GBEViewport3D: TGBEViewport3D;
    GBEJoystick1: TGBEJoystick;
    dmyMonde: TDummy;
    Light1: TLight;
    lmsSol: TLightMaterialSource;
    hSol: TGBEHeightmap;
    GBEPlayerPosition: TGBEPlayerPosition;
    imgViseur: TImage;
    aniPrincipale: TFloatAnimation;
    cmsBalle: TColorMaterialSource;
    dmyEnnemis: TDummy;
    lmsEnnemi: TLightMaterialSource;
    sky: TSphere;
    tmsSky: TTextureMaterialSource;
    layMenu: TLayout;
    recFond: TRectangle;
    aniFond: TGradientAnimation;
    layBas: TLayout;
    Layout5: TLayout;
    Label13: TLabel;
    Layout2: TLayout;
    aniApparitionMenu: TFloatAnimation;
    layIHM: TFlowLayout;
    btnPlay: TRectangle;
    lblPlay: TLabel;
    GlowEffect1: TGlowEffect;
    glowEffectJoypad: TGlowEffect;
    btnHowToPlay: TRectangle;
    Label3: TLabel;
    GlowEffect4: TGlowEffect;
    btnQuitter: TRectangle;
    Label14: TLabel;
    GlowEffect8: TGlowEffect;
    layHowtoplay: TLayout;
    Rectangle3: TRectangle;
    Label6: TLabel;
    Line3: TLine;
    Layout4: TLayout;
    btnOkCredits: TImage;
    GlowEffect7: TGlowEffect;
    Label7: TLabel;
    GlowEffect18: TGlowEffect;
    Label8: TLabel;
    GlowEffect19: TGlowEffect;
    Label10: TLabel;
    GlowEffect13: TGlowEffect;
    layFollowMe: TLayout;
    Label11: TLabel;
    GlowEffect14: TGlowEffect;
    Label15: TLabel;
    GlowEffect16: TGlowEffect;
    Label12: TLabel;
    GlowEffect27: TGlowEffect;
    Label34: TLabel;
    GlowEffect39: TGlowEffect;
    lblHowToPlay: TLabel;
    GlowEffect2: TGlowEffect;
    aniLayHowToPlay: TFloatAnimation;
    Image1: TImage;
    layPlanet: TLayout;
    laySpace: TLayout;
    dmyStar: TDummy;
    star: TSphere;
    Light2: TLight;
    lmsMissile: TLightMaterialSource;
    lmsPlanetBlue: TLightMaterialSource;
    lmsStar: TLightMaterialSource;
    dmyBluePlanet: TDummy;
    planetBlue: TSphere;
    aniPlanetBleue: TFloatAnimation;
    screen: TRectangle;
    Label2: TLabel;
    dmyAnneauPlanet: TDummy;
    anneauPlanete: TSphere;
    aniAnneauPlanet: TFloatAnimation;
    lmsAnneauPlanet: TLightMaterialSource;
    anneaux: TSphere;
    lmsAnneaux: TLightMaterialSource;
    dmyPlaneteGrise: TDummy;
    planeteGrise: TSphere;
    aniPlaneteGrise: TFloatAnimation;
    lmsPlaneteGrise: TLightMaterialSource;
    lmsEnnemiToit: TLightMaterialSource;
    aniTitre: TFloatAnimation;
    imgTableauBord: TImage;
    layHUD: TLayout;
    layJoystick: TLayout;
    layHUD2: TLayout;
    dmyZoneDetection: TDummy;
    cmsBalleEnnemi: TColorMaterialSource;
    recMessage: TRectangle;
    lblMessage: TLabel;
    Rectangle1: TRectangle;
    Label4: TLabel;
    GlowEffect3: TGlowEffect;
    dmyBonus: TDummy;
    lmsBonusPorteeTir: TLightMaterialSource;
    lmsBonusPuissanceTir: TLightMaterialSource;
    lmsBonusBouclier: TLightMaterialSource;
    lmsBonusMunitions: TLightMaterialSource;
    Rectangle3D1: TRectangle3D;
    lmsBonusMunitionsCote: TLightMaterialSource;
    lmsBonusPorteetirCote: TLightMaterialSource;
    lmsBonusPuissanceTirCote: TLightMaterialSource;
    lmsBonusBouclierCote: TLightMaterialSource;
    dmyRedPlanet: TDummy;
    redPlanet: TSphere;
    aniRedPlanet: TFloatAnimation;
    lmsRedPlanet: TLightMaterialSource;
    FontColorAnimation: TColorAnimation;
    procedure FormCreate(Sender: TObject);
    procedure aniPrincipaleProcess(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
    procedure FormDestroy(Sender: TObject);
    procedure btnPlayClick(Sender: TObject);
    procedure btnQuitterClick(Sender: TObject);
    procedure btnHowToPlayClick(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure Label11Click(Sender: TObject);
    procedure Label12Click(Sender: TObject);
    procedure Label15Click(Sender: TObject);
    procedure btnOkCreditsClick(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure Rectangle1Click(Sender: TObject);
  private
    procedure TournerADroite;
    procedure TournerAGauche;
    procedure Avancer;
    procedure Reculer;
    procedure GererTouche;
    procedure GererDeplacementJoueur;
    procedure GererTir;
    procedure Tirer;
    procedure ChargerEnnemis;
    function DetecterCollisionBalleEnnemis(balle: TSphere): TGBECollisionRetour;
    procedure GererVitesseTouche(sensibilite: single);
    procedure afficherScene(scene: TScene);
    procedure GererTirEnnemis;
    procedure TirEnnemi(direction,positionDepart: TPoint3D);
    function DetecterCollisionTirEnnemis(balle: TSphere): TGBECollisionRetour;
    procedure ChargerBonus;
    { Déclarations privées }
  public
    { Déclarations publiques }
    shield, porteeTir : integer;
    tirEnnemiEnCours : boolean;
    vitesse, vitesseTouche, demiHauteur, demiHauteurEnnemi : single;
    toucheDroite, toucheGauche, toucheAvancer, toucheReculer, toucheTir, tirPossible : boolean;
    listeBalles, listeBallesEnnemis : TList<TTir>;
    nbBalles, nbEnnemisRestants, puissanceTir : integer;
    listeAnimations : TList<TFloatAnimation>;
  end;

var
  fMain: TfMain;

implementation
{$R *.fmx}

procedure TfMain.aniPrincipaleProcess(Sender: TObject);
begin
  Label2.text := 'Speed : ' + copy(abs(vitesse*100).toString,0,3)+sLineBreak+
                 'Munitions : ' + nbBalles.ToString+sLineBreak+
                 'Shield : ' + shield.ToString+'%'+sLineBreak+sLineBreak+
                 'Nb of enemies :'+nbEnnemisRestants.ToString+sLineBreak;
  sky.position.x := dmyMonde.Position.x;
  sky.position.y := dmyMonde.Position.y;
  sky.position.z := dmyMonde.Position.z;
  dmyZoneDetection.Position.X := GBEPlayerPosition.Position.x;
  dmyZoneDetection.Position.Y := GBEPlayerPosition.Position.Y;
  dmyZoneDetection.Position.Z := GBEPlayerPosition.Position.Z;
  GererTouche;
  GererTir;
  GererTirEnnemis;
  GererDeplacementJoueur;

  if shield <= 20 then FontColorAnimation.start
  else FontColorAnimation.stop;

  if shield <= 0 then begin
     lblMessage.text := 'You no longer have a shield.'+sLineBreak+'Game over...';
     recMessage.visible := true;
  end;
  if nbEnnemisRestants = 0 then begin
     lblMessage.text := 'you killed all the enemies.'+sLineBreak+'Good game, you win !';
     recMessage.visible := true;
  end;

end;

procedure TfMain.FormCreate(Sender: TObject);
begin
  randomize;
  lblHowToPlay.text := '''
  You must destroy all alien saucers. For that :
    Accelerate     : Z or up arrow
    Brake          : S or down arrow
    Turn Left      : Q or Left arrow
    Trun right     : D or Right arrow
    Immediate stop : ESC
    Fire           : Space
    Orient ship and fire : Use the joystick (gray circle) with the mouse.
  ''';
  GBEJoystick1.Width := 0;
  GBEJoystick1.AutoCapture := true;
  GBEViewport3D.UsingDesignCamera := false;
  GBEViewport3D.Camera := GBEPlayerPosition.getCamera;
//  hSol.loadHeightmapFromResource('heightmap');
  listeBalles := TList<TTir>.create;
  listeBallesEnnemis := TList<TTir>.create;
  listeAnimations := TList<TFloatAnimation>.create;
  nbEnnemisRestants := maxEnnemis;
  demiHauteurEnnemi := tailleEnnemi * 0.5;
  afficherScene(TScene.menu);
end;

procedure TfMain.FormDestroy(Sender: TObject);
begin
  listeBalles.Free;
  listeBallesEnnemis.Free;
  listeAnimations.Free;
end;

procedure TfMain.FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  if (keyChar = 'D') or (keyChar = 'd') or (key = 39) then tournerADroite;
  if (keyChar = 'Q') or (keyChar = 'q') or (key = 37) then tournerAGauche;
  if (keyChar = 'Z') or (keyChar = 'z') or (key = 38) then Avancer;
  if (keyChar = 'S') or (keyChar = 's') or (key = 40) then Reculer;
  if keyChar = ' ' then toucheTir := true;
  if key = 27 then vitesse := 0;
end;

procedure TfMain.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char; Shift: TShiftState);
begin
  vitesseTouche := 0;
  if (keyChar = 'D') or (keyChar = 'd') or (key = 39) then toucheDroite := false;
  if (keyChar = 'Q') or (keyChar = 'q') or (key = 37) then toucheGauche := false;
  if (keyChar = 'Z') or (keyChar = 'z') or (key = 38) then toucheAvancer := false;
  if (keyChar = 'S') or (keyChar = 's') or (key = 40) then toucheReculer := false;
  if keyChar = ' ' then begin
    toucheTir := false;
    tirPossible := true;
  end;
end;

procedure TfMain.TournerADroite;
begin
  toucheGauche := false;
  GererVitesseTouche(1);
  toucheDroite := true;
end;

procedure TfMain.TournerAGauche;
begin
  toucheDroite := false;
  GererVitesseTouche(1);
  toucheGauche := true;
end;

procedure TfMain.Avancer;
begin
  toucheReculer := false;
  GererVitesseTouche(0.1);
  toucheAvancer := true;
end;

procedure TfMain.btnHowToPlayClick(Sender: TObject);
begin
  layHowtoplay.visible := true;
  aniLayHowToPlay.start;
end;

procedure TfMain.btnOkCreditsClick(Sender: TObject);
begin
  layHowtoplay.Opacity := 0;
  layHowtoplay.visible := false;
end;

procedure TfMain.btnPlayClick(Sender: TObject);
begin
  vitesse := 0;
  shield := 100;
  porteeTir := 60;
  recMessage.Visible := false;
  demiHauteur := GBEPlayerPosition.Height * 0.5;
  GBEJoystick1.deplacement := Point3D(-1,1,1);
  toucheDroite := false;
  toucheGauche := false;
  toucheAvancer := false;
  toucheReculer := false;
  toucheTir := false;
  tirPossible := true;
  nbBalles := maxBallesDepart;
  GBEPlayerPosition.Position.x := 0;
  GBEPlayerPosition.Position.y := 0;
  GBEPlayerPosition.position.z := 50;
  afficherScene(TScene.space);
end;

procedure TfMain.btnQuitterClick(Sender: TObject);
begin
  close;
end;

procedure TfMain.Rectangle1Click(Sender: TObject);
begin
  afficherScene(TScene.menu);
end;

procedure TfMain.Reculer;
begin
  toucheAvancer := false;
  GererVitesseTouche(0.1);
  toucheReculer := true;
end;

procedure TfMain.GererVitesseTouche(sensibilite: single);
begin
  if vitesseTouche < maxAccelerationTouche then vitesseTouche := vitesseTouche + accelerationTouche * sensibilite;
end;

procedure TfMain.Label10Click(Sender: TObject);
begin
  tUrlOpen.Open('https://www.embarcadero.com/fr/products/delphi');
end;

procedure TfMain.Label11Click(Sender: TObject);
begin
  tUrlOpen.Open('https://www.youtube.com/@gregorybersegeay5123/videos');
end;

procedure TfMain.Label12Click(Sender: TObject);
begin
   tUrlOpen.Open('https://www.gbesoft.fr');
end;

procedure TfMain.Label15Click(Sender: TObject);
begin
  tUrlOpen.Open('https://github.com/gbegreg');
end;

procedure TfMain.Label8Click(Sender: TObject);
begin
  tUrlOpen.Open('https://ldjam.com/events/ludum-dare/57/in-solar-system-depths');
end;

procedure TfMain.GererTouche;
begin
  vitesse := GBEJoystick1.OrientationKeyManagement(toucheDroite, toucheGauche, toucheAvancer, toucheReculer, false, false, false, false, vitesseTouche, vitesse, MAX_SPEED);
  if vitesse > MAX_SPEED then vitesse := MAX_SPEED;
  if vitesse < -MAX_SPEED then vitesse := -MAX_SPEED;

  if toucheTir then Tirer;
end;

procedure TfMain.GererDeplacementJoueur;
begin
  GBEPlayerPosition.NextPosition.Position.Point := GBEPlayerPosition.Position.Point - GBEJoystick1.direction * vitesse * Point3D(1,1,1);
//  GBEPlayerPosition.NextPosition.Position.Y := hSol.GetHeight(GBEPlayerPosition.NextPosition.Position.Point) + tailleJoueur  + demiHauteur;

  if collisionDummyChilds(dmyEnnemis, GBEPlayerPosition.NextPosition).bool then begin
    vitesse := 0;
    shield := shield -1;
    exit;
  end;

  if not(tirEnnemiEnCours) then begin
    var ennemi := collisionDummyChilds(dmyEnnemis, dmyZoneDetection);
    if ennemi.bool then begin
      tirEnnemiEnCours := true;
      var directionTirEnnemi := Point3D(1,-1,-1) * (GBEPlayerPosition.getPositionDirection.AbsolutePosition - GBEPlayerPosition.AbsolutePosition).Normalize;
      tirEnnemi(directionTirEnnemi, (ennemi.objet as TSphere).position.Point);
      exit;
    end;
  end;

  if collisionEntre2Objets(dmyStar, GBEPlayerPosition.NextPosition).bool then begin
    vitesse := 0;
    exit;
  end;

  var unBonus := collisionDummyChilds(dmyBonus, GBEPlayerPosition.NextPosition);
  if unBonus.bool then begin
    case unBonus.objet.Tag of
      1: if shield < 100 then shield := shield + 20;
      2: inc(nbBalles,30);
      3: porteeTir := porteeTir + 10;
      4: inc(puissanceTir);
    end;
    unBonus.objet.free;
    exit;
  end;

  if collisionEntre2Objets(dmyBluePlanet, GBEPlayerPosition.NextPosition).bool then begin
    vitesse := 0;
    exit;
  end;

  if collisionEntre2Objets(dmyAnneauPlanet, GBEPlayerPosition.NextPosition).bool then begin
    vitesse := 0;
    exit;
  end;

  if collisionEntre2Objets(dmyPlaneteGrise, GBEPlayerPosition.NextPosition).bool then begin
    vitesse := 0;
    exit;
  end;

  GBEPlayerPosition.Position.Point := GBEPlayerPosition.NextPosition.Position.Point;
end;

procedure TfMain.GererTir;
var balle : TTir;
    balleADetruire : boolean;
begin
  for balle in listeBalles do begin
    balleADetruire := false;
    balle.projectile.Position.Point := balle.projectile.Position.Point + balle.direction;
    if (balle.projectile.Position.Point.X > (balle.positionDepart.X + balle.portee)) or
       (balle.projectile.Position.Point.X < (balle.positionDepart.X - balle.portee)) or
       (balle.projectile.Position.Point.Z > (balle.positionDepart.Z + balle.portee)) or
       (balle.projectile.Position.Point.Z < (balle.positionDepart.Z - balle.portee)) then balleADetruire := true
    else begin
      if DetecterCollisionBalleEnnemis(balle.projectile).bool then balleADetruire := true;
    end;

    if balleADetruire then begin
      balle.projectile.Visible := false;
      listeBalles.Remove(balle);
    end;
  end;
end;

procedure TfMain.GererTirEnnemis;
var balle : TTir;
    balleADetruire : boolean;
begin
  for balle in listeBallesEnnemis do begin
    balleADetruire := false;
    balle.projectile.Position.Point := balle.projectile.Position.Point + balle.direction;
    if (balle.projectile.Position.Point.X > (balle.positionDepart.X + balle.portee)) or
       (balle.projectile.Position.Point.X < (balle.positionDepart.X - balle.portee)) or
       (balle.projectile.Position.Point.Z > (balle.positionDepart.Z + balle.portee)) or
       (balle.projectile.Position.Point.Z < (balle.positionDepart.Z - balle.portee)) then balleADetruire := true
    else begin
      if DetecterCollisionTirEnnemis(balle.projectile).bool then balleADetruire := true;
    end;

    if balleADetruire then begin
      balle.projectile.Visible := false;
      listeBallesEnnemis.Remove(balle);
      tirEnnemiEnCours := false;
    end;
  end;
end;

procedure TfMain.Tirer;
var balle : TTir;
begin
  if tirPossible then begin
    tirPossible := false;
    if nbBalles > 0 then begin
      balle.projectile := TSphere.Create(nil);
      balle.projectile.Parent := hsol;
      balle.vitesse := vitesseTir;
      balle.portee := porteeTir;
      balle.projectile.MaterialSource := cmsBalle;
      balle.projectile.Width := 0.2;
      balle.projectile.Depth := 0.2;
      balle.projectile.Height := 0.2;
      balle.positionDepart := GBEPlayerPosition.Position.Point;
      balle.direction := GBEJoystick1.direction * balle.vitesse;
      balle.projectile.Position.Point := balle.positionDepart;
      listeBalles.Add(balle);
      dec(nbBalles);
    end;
  end;
end;

procedure TfMain.TirEnnemi(direction, positionDepart : TPoint3D);
var balle : TTir;
begin
    balle.projectile := TSphere.Create(nil);
    balle.projectile.Parent := hsol;
    balle.vitesse := vitesseTir;
    balle.portee := porteeTirEnnemi;
    balle.projectile.MaterialSource := cmsBalleEnnemi;
    balle.projectile.Width := 0.2;
    balle.projectile.Depth := 0.2;
    balle.projectile.Height := 0.2;
    balle.positionDepart := positionDepart;
    balle.direction := direction * balle.vitesse;
    balle.projectile.Position.Point := balle.positionDepart;
    listeBallesEnnemis.Add(balle);
end;

procedure TfMain.ChargerEnnemis;
begin
  for var I := 0 to maxEnnemis -1 do begin
    var ennemi : TEnnemi;
    ennemi.corps := TSphere.Create(nil);
    ennemi.corps.Parent := dmyEnnemis;
    ennemi.corps.Width := tailleEnnemi;
    ennemi.corps.Height := 0.3;
    ennemi.corps.Depth := tailleEnnemi;
    ennemi.corps.RotationAngle.Z := 180;
    ennemi.Corps.Position.Point := Point3D(random(300)-150, 0, random(300)-150);
    ennemi.Corps.Position.Y := random(50)-25;
    ennemi.Corps.RotationAngle.Y := random(360);
    ennemi.Corps.Visible := true;
    ennemi.Corps.MaterialSource := lmsEnnemi;
    ennemi.Corps.Tag := 3;
    ennemi.toit := TSphere.Create(nil);
    ennemi.toit.Parent := ennemi.corps;
    ennemi.toit.Width := tailleEnnemi*0.5;
    ennemi.toit.Height := 0.3;
    ennemi.toit.Depth := tailleEnnemi*0.5;
    ennemi.toit.Position.X := 0;
    ennemi.toit.Position.Y := -0.15;
    ennemi.toit.Position.Z := 0;
    ennemi.toit.Visible := true;
    ennemi.toit.MaterialSource := lmsEnnemiToit;

    var uneAnimation := TFloatAnimation.Create(nil);
    uneAnimation.parent := ennemi.corps;
    uneAnimation.Interpolation := TInterpolationType.Linear;
    uneAnimation.AutoReverse := true;
    uneAnimation.Loop := true;
    uneAnimation.Duration := random(8)*6+15;
    if random(10) mod 2 = 0 then begin
      uneAnimation.PropertyName := 'Position.X';
      uneAnimation.StartValue := ennemi.corps.Position.Point.X;
    end else begin
      uneAnimation.PropertyName := 'Position.Z';
      uneAnimation.StartValue := ennemi.corps.Position.Point.Z;
    end;

    uneAnimation.StopValue := random(400)-200;
    uneAnimation.Start;
    listeAnimations.Add(uneAnimation);
  end;
end;

procedure TfMain.ChargerBonus;
begin
  for var I := 0 to maxBonus -1 do begin
    var bonus : TBonus;
    bonus.caisse := TRectangle3D.Create(nil);
    bonus.caisse.Parent := dmyBonus;
    bonus.caisse.Width := 0.5;
    bonus.caisse.Height := 0.5;
    bonus.caisse.Depth := 0.5;
    bonus.caisse.RotationAngle.Z := 180;
    bonus.caisse.Position.Point := Point3D(random(300)-150, 0, random(300)-150);
    bonus.caisse.Position.Y := random(50)-25;
    bonus.caisse.RotationAngle.Y := random(360);
    bonus.caisse.RotationAngle.X := random(360);
    bonus.caisse.RotationAngle.Z := random(360);
    bonus.caisse.Visible := true;

    if i mod 7 = 0 then begin
      bonus.caisse.Tag := 3;
      bonus.caisse.MaterialSource := lmsBonusPorteeTir;
      bonus.caisse.MaterialBackSource := lmsBonusPorteeTir;
      bonus.caisse.MaterialShaftSource := lmsBonusPorteeTirCote;
    end else begin
      if i mod 8 = 0 then begin
        bonus.caisse.Tag := 4;
        bonus.caisse.MaterialSource := lmsBonusPuissanceTir;
        bonus.caisse.MaterialBackSource := lmsBonusPuissanceTir;
        bonus.caisse.MaterialShaftSource := lmsBonusPuissanceTirCote;
      end else begin
        if i mod 3 = 0 then begin
          bonus.caisse.Tag := 1;
          bonus.caisse.MaterialSource := lmsBonusBouclier;
          bonus.caisse.MaterialBackSource := lmsBonusBouclier;
          bonus.caisse.MaterialShaftSource := lmsBonusBouclierCote;
        end else begin
          bonus.caisse.Tag := 2;
          bonus.caisse.MaterialSource := lmsBonusMunitions;
          bonus.caisse.MaterialBackSource := lmsBonusMunitions;
          bonus.caisse.MaterialShaftSource := lmsBonusMunitionsCote;
        end;
      end;
    end;
  end;
end;

function TfMain.DetecterCollisionBalleEnnemis(balle : TSphere): TGBECollisionRetour;
begin
  result := collisionDummyChilds(dmyEnnemis, balle);
  if result.bool then begin
    result.objet.Tag := result.objet.Tag - puissanceTir;
    if result.objet.tag <= 0 then begin
      listeAnimations.Remove(result.objet.Children[1] as TFloatanimation);
      (result.objet as TSphere).Visible := false;
      dec(nbEnnemisRestants);
    end;
  end;
end;

function TfMain.DetecterCollisionTirEnnemis(balle : TSphere): TGBECollisionRetour;
begin
  result := collisionEntre2Objets(balle, GBEPlayerPosition.NextPosition);
  if result.bool then shield := shield - 10;
end;

procedure TfMain.afficherScene(scene: TScene);
begin
  case scene of
    menu: begin
            laySpace.Visible := false;
            layMenu.Visible := true;
            layPlanet.Visible := false;
            aniPrincipale.Enabled := false;
            aniFond.start;
          end;
    space: begin
             chargerEnnemis;
             ChargerBonus;
             aniPrincipale.Start;
             puissanceTir := 1;
             layMenu.Visible := false;
             laySpace.Visible := true;
             layPlanet.Visible := false;
             layHUD.height := imgTableauBord.Height /4;
             layHUD2.Height := layHUD.height;
             layHUD2.Width := imgTableauBord.width /2.7;
           end;
    planet: begin
              layMenu.Visible := false;
              laySpace.Visible := false;
              layPlanet.Visible := true;
              aniPrincipale.Enabled := false;
            end;
  end;
  aniPlanetBleue.enabled := laySpace.Visible;
  aniPlaneteGrise.enabled := laySpace.Visible;
  aniAnneauPlanet.enabled := laySpace.Visible;
  aniRedPlanet.enabled := laySpace.Visible;
  aniTitre.Enabled := layMenu.Visible;
  tirEnnemiEnCours := false;
end;

end.
