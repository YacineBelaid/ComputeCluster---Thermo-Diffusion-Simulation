// Pièce avec canaux de refroidissement
// Source: géométrie adaptée des exemples MFEM
SetFactory("OpenCASCADE");

Mesh.Algorithm = 6;
Mesh.CharacteristicLengthMin = 0.01;
Mesh.CharacteristicLengthMax = 0.2;
Mesh.MeshSizeFromCurvature = 20;

L=1.0;
Box(1) = {0,0,0,L,L,L};

Rc=L/10;
Cylinder(2) = {L/8, 0.0, L/4, 0, L, 0, Rc , 2*Pi};
Cylinder(3) = {4*L/8, 0.0, L/4, 0, L, 0, Rc , 2*Pi};

BooleanDifference(50) = { Volume{1}; Delete; }{ Volume{2,3}; Delete; };

Physical Volume(1) = {50};
Physical Surface(1) = {7,8};

Mesh.MshFileVersion = 2.2;
