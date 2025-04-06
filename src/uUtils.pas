unit uUtils;

interface
uses Generics.Collections, FMX.Objects3D, FMX.Types3d, System.Math.Vectors, System.UITypes;

type
  TEnnemi = record
    corps, toit : TSphere;
  end;
  TBonus = record
    caisse : TRectangle3D;
  end;
  TTir = record
    portee, vitesse : single;
    projectile : TSphere;
    direction, positionDepart : TPoint3D;
  end;

const
  MAX_SPEED = 0.15;
  MISSILE_SPEED = 0.2;
  MISSILE_RANGE = 8;
  accelerationTouche = 0.01;
  maxAccelerationTouche = 1;
  maxBallesDepart = 20;
  vitesseTir = 1.5;
  porteeTirEnnemi = 40;
  maxEnnemis = 25;
  maxBonus = 25;
  tailleEnnemi = 1;

implementation

end.
