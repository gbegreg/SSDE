unit uUtils;

interface
uses Generics.Collections, FMX.Objects3D, FMX.Types3d, System.Math.Vectors, System.UITypes;

type
  TEnnemi = record
    corps, toit : TSphere;
  end;
  TTir = record
    portee, vitesse : single;
    projectile : TSphere;
    direction, positionDepart : TPoint3D;
  end;

const
  MAX_SPEED = 0.06;
  MISSILE_SPEED = 0.2;
  MISSILE_RANGE = 8;
  accelerationTouche = 0.01;
  maxAccelerationTouche = 1;
  maxBalles = 999;
  vitesseTir = 1.5;
  porteeTir = 60;
  maxEnnemis = 25;
  tailleEnnemi = 1;

implementation

end.
