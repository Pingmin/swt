// -------------------------------------------------------------------------
// SWT - Scilab wavelet toolbox
// Copyright (C) 2010-2014  Holger Nahrstaedt
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
//-------------------------------------------------------------------------
//
//  <-- NO CHECK ERROR OUTPUT -->


// dwt2d  Test 2

// waverec2
version = getversion("scilab");
if (version(1)<6) then
sz=stacksize();
stacksize(1e7);
end;

a=rand(500,501,'normal');

[Lo_R,Hi_R]=wfilters('haar','r');
[c,s]=wavedec2(a,3,'haar');
y0=waverec2(c,s,'haar');
y1=waverec2(c,s,Lo_R,Hi_R);
r3=s(1,1);
c3=s(1,2);
r2=s(3,1);
c2=s(3,2);
r1=s(4,1);
c1=s(4,2);
rr=s(5,1);
cc=s(5,2);
cA3=matrix(c(1:r3*c3),r3,c3);
cH3=matrix(c(r3*c3+1:2*r3*c3),r3,c3);
cV3=matrix(c(2*r3*c3+1:3*r3*c3),r3,c3);
cD3=matrix(c(3*r3*c3+1:4*r3*c3),r3,c3);
cH2=matrix(c(4*r3*c3+1:4*r3*c3+r2*c2),r2,c2);
cV2=matrix(c(4*r3*c3+r2*c2+1:4*r3*c3+2*r2*c2),r2,c2);
cD2=matrix(c(4*r3*c3+2*r2*c2+1:4*r3*c3+3*r2*c2),r2,c2);
cH1=matrix(c(4*r3*c3+3*r2*c2+1:4*r3*c3+3*r2*c2+r1*c1),r1,c1);
cV1=matrix(c(4*r3*c3+3*r2*c2+r1*c1+1:4*r3*c3+3*r2*c2+2*r1*c1),r1,c1);
cD1=matrix(c(4*r3*c3+3*r2*c2+2*r1*c1+1:4*r3*c3+3*r2*c2+3*r1*c1),r1,c1);
cA2=idwt2(cA3,cH3,cV3,cD3,'haar',size(cH2));
cA1=idwt2(cA2,cH2,cV2,cD2,'haar',size(cH1));
r0=idwt2(cA1,cH1,cV1,cD1,'haar',size(a));

assert_checkalmostequal ( r0 , y0 , %eps );
assert_checkalmostequal ( r0 , y1 , %eps );

clear cA1;
clear cA2;
clear cA3;
clear cH1;
clear cH2;
clear cH3;
clear cV1;
clear cV2;
clear cV3;
clear cD1;
clear cD2;
clear cD3;
clear r0;
clear c;
clear s;
clear r1;
clear r2;
clear r3;
clear c1;
clear c2;
clear c3;
clear rr;
clear cc;
clear y0;
clear y1;
clear Lo_R;
clear Hi_R;

// db1
for N=1:27
wname="db"+sprintf("%d",N);
[Lo_R,Hi_R]=wfilters(wname,'r');
[c,s]=wavedec2(a,3,wname);
y0=waverec2(c,s,wname);
y1=waverec2(c,s,Lo_R,Hi_R);
r3=s(1,1);
c3=s(1,2);
r2=s(3,1);
c2=s(3,2);
r1=s(4,1);
c1=s(4,2);
rr=s(5,1);
cc=s(5,2);
cA3=matrix(c(1:r3*c3),r3,c3);
cH3=matrix(c(r3*c3+1:2*r3*c3),r3,c3);
cV3=matrix(c(2*r3*c3+1:3*r3*c3),r3,c3);
cD3=matrix(c(3*r3*c3+1:4*r3*c3),r3,c3);
cH2=matrix(c(4*r3*c3+1:4*r3*c3+r2*c2),r2,c2);
cV2=matrix(c(4*r3*c3+r2*c2+1:4*r3*c3+2*r2*c2),r2,c2);
cD2=matrix(c(4*r3*c3+2*r2*c2+1:4*r3*c3+3*r2*c2),r2,c2);
cH1=matrix(c(4*r3*c3+3*r2*c2+1:4*r3*c3+3*r2*c2+r1*c1),r1,c1);
cV1=matrix(c(4*r3*c3+3*r2*c2+r1*c1+1:4*r3*c3+3*r2*c2+2*r1*c1),r1,c1);
cD1=matrix(c(4*r3*c3+3*r2*c2+2*r1*c1+1:4*r3*c3+3*r2*c2+3*r1*c1),r1,c1);
cA2=idwt2(cA3,cH3,cV3,cD3,wname,size(cH2));
cA1=idwt2(cA2,cH2,cV2,cD2,wname,size(cH1));
r0=idwt2(cA1,cH1,cV1,cD1,wname,size(a));

assert_checkalmostequal ( r0 , y0 , %eps );
assert_checkalmostequal ( r0 , y1 , %eps );


clear cA1;
clear cA2;
clear cA3;
clear cH1;
clear cH2;
clear cH3;
clear cV1;
clear cV2;
clear cV3;
clear cD1;
clear cD2;
clear cD3;
clear r0;
clear c;
clear s;
clear r1;
clear r2;
clear r3;
clear c1;
clear c2;
clear c3;
clear rr;
clear cc;
clear y0;
clear y1;
clear Lo_R;
clear Hi_R;
end;


// coif1
for N=1:17
wname="coif"+sprintf("%d",N);
[Lo_R,Hi_R]=wfilters('coif1','r');
[c,s]=wavedec2(a,3,'coif1');
y0=waverec2(c,s,'coif1');
y1=waverec2(c,s,Lo_R,Hi_R);
r3=s(1,1);
c3=s(1,2);
r2=s(3,1);
c2=s(3,2);
r1=s(4,1);
c1=s(4,2);
rr=s(5,1);
cc=s(5,2);
cA3=matrix(c(1:r3*c3),r3,c3);
cH3=matrix(c(r3*c3+1:2*r3*c3),r3,c3);
cV3=matrix(c(2*r3*c3+1:3*r3*c3),r3,c3);
cD3=matrix(c(3*r3*c3+1:4*r3*c3),r3,c3);
cH2=matrix(c(4*r3*c3+1:4*r3*c3+r2*c2),r2,c2);
cV2=matrix(c(4*r3*c3+r2*c2+1:4*r3*c3+2*r2*c2),r2,c2);
cD2=matrix(c(4*r3*c3+2*r2*c2+1:4*r3*c3+3*r2*c2),r2,c2);
cH1=matrix(c(4*r3*c3+3*r2*c2+1:4*r3*c3+3*r2*c2+r1*c1),r1,c1);
cV1=matrix(c(4*r3*c3+3*r2*c2+r1*c1+1:4*r3*c3+3*r2*c2+2*r1*c1),r1,c1);
cD1=matrix(c(4*r3*c3+3*r2*c2+2*r1*c1+1:4*r3*c3+3*r2*c2+3*r1*c1),r1,c1);
cA2=idwt2(cA3,cH3,cV3,cD3,'coif1',size(cH2));
cA1=idwt2(cA2,cH2,cV2,cD2,'coif1',size(cH1));
r0=idwt2(cA1,cH1,cV1,cD1,'coif1',size(a));
assert_checkalmostequal ( r0 , y0 , %eps );
assert_checkalmostequal ( r0 , y1 , %eps );
clear cA1;
clear cA2;
clear cA3;
clear cH1;
clear cH2;
clear cH3;
clear cV1;
clear cV2;
clear cV3;
clear cD1;
clear cD2;
clear cD3;
clear r0;
clear c;
clear s;
clear r1;
clear r2;
clear r3;
clear c1;
clear c2;
clear c3;
clear rr;
clear cc;
clear y0;
clear y1;
clear Lo_R;
clear Hi_R;
end;


// sym4
for N=2:20
wname="sym"+sprintf("%d",N);
[Lo_R,Hi_R]=wfilters(wname,'r');
[c,s]=wavedec2(a,3,wname);
y0=waverec2(c,s,wname);
y1=waverec2(c,s,Lo_R,Hi_R);
r3=s(1,1);
c3=s(1,2);
r2=s(3,1);
c2=s(3,2);
r1=s(4,1);
c1=s(4,2);
rr=s(5,1);
cc=s(5,2);
cA3=matrix(c(1:r3*c3),r3,c3);
cH3=matrix(c(r3*c3+1:2*r3*c3),r3,c3);
cV3=matrix(c(2*r3*c3+1:3*r3*c3),r3,c3);
cD3=matrix(c(3*r3*c3+1:4*r3*c3),r3,c3);
cH2=matrix(c(4*r3*c3+1:4*r3*c3+r2*c2),r2,c2);
cV2=matrix(c(4*r3*c3+r2*c2+1:4*r3*c3+2*r2*c2),r2,c2);
cD2=matrix(c(4*r3*c3+2*r2*c2+1:4*r3*c3+3*r2*c2),r2,c2);
cH1=matrix(c(4*r3*c3+3*r2*c2+1:4*r3*c3+3*r2*c2+r1*c1),r1,c1);
cV1=matrix(c(4*r3*c3+3*r2*c2+r1*c1+1:4*r3*c3+3*r2*c2+2*r1*c1),r1,c1);
cD1=matrix(c(4*r3*c3+3*r2*c2+2*r1*c1+1:4*r3*c3+3*r2*c2+3*r1*c1),r1,c1);
cA2=idwt2(cA3,cH3,cV3,cD3,wname,size(cH2));
cA1=idwt2(cA2,cH2,cV2,cD2,wname,size(cH1));
r0=idwt2(cA1,cH1,cV1,cD1,wname,size(a));
assert_checkalmostequal ( r0 , y0 , %eps );
assert_checkalmostequal ( r0 , y1 , %eps );
clear cA1;
clear cA2;
clear cA3;
clear cH1;
clear cH2;
clear cH3;
clear cV1;
clear cV2;
clear cV3;
clear cD1;
clear cD2;
clear cD3;
clear r0;
clear c;
clear s;
clear r1;
clear r2;
clear r3;
clear c1;
clear c2;
clear c3;
clear rr;
clear cc;
clear y0;
clear y1;
clear Lo_R;
clear Hi_R;
end;


// bior1.1
bior_fam=["bior1.1","bior1.3", "bior1.5", "bior2.2", "bior2.4", "bior2.6",...
"bior2.8", "bior3.1", "bior3.3", "bior3.5", "bior3.7",...
"bior3.9", "bior4.4", "bior5.5", "bior6.8"];
// bior1.1
for N=1:max(size(bior_fam))
[Lo_R,Hi_R]=wfilters(bior_fam(N),'r');
[c,s]=wavedec2(a,3,bior_fam(N));
y0=waverec2(c,s,bior_fam(N));
y1=waverec2(c,s,Lo_R,Hi_R);
r3=s(1,1);
c3=s(1,2);
r2=s(3,1);
c2=s(3,2);
r1=s(4,1);
c1=s(4,2);
rr=s(5,1);
cc=s(5,2);
cA3=matrix(c(1:r3*c3),r3,c3);
cH3=matrix(c(r3*c3+1:2*r3*c3),r3,c3);
cV3=matrix(c(2*r3*c3+1:3*r3*c3),r3,c3);
cD3=matrix(c(3*r3*c3+1:4*r3*c3),r3,c3);
cH2=matrix(c(4*r3*c3+1:4*r3*c3+r2*c2),r2,c2);
cV2=matrix(c(4*r3*c3+r2*c2+1:4*r3*c3+2*r2*c2),r2,c2);
cD2=matrix(c(4*r3*c3+2*r2*c2+1:4*r3*c3+3*r2*c2),r2,c2);
cH1=matrix(c(4*r3*c3+3*r2*c2+1:4*r3*c3+3*r2*c2+r1*c1),r1,c1);
cV1=matrix(c(4*r3*c3+3*r2*c2+r1*c1+1:4*r3*c3+3*r2*c2+2*r1*c1),r1,c1);
cD1=matrix(c(4*r3*c3+3*r2*c2+2*r1*c1+1:4*r3*c3+3*r2*c2+3*r1*c1),r1,c1);
cA2=idwt2(cA3,cH3,cV3,cD3,bior_fam(N),size(cH2));
cA1=idwt2(cA2,cH2,cV2,cD2,bior_fam(N),size(cH1));
r0=idwt2(cA1,cH1,cV1,cD1,bior_fam(N),size(a));
assert_checkalmostequal ( r0 , y0 , %eps );
assert_checkalmostequal ( r0 , y1 , %eps );
clear cA1;
clear cA2;
clear cA3;
clear cH1;
clear cH2;
clear cH3;
clear cV1;
clear cV2;
clear cV3;
clear cD1;
clear cD2;
clear cD3;
clear r0;
clear c;
clear s;
clear r1;
clear r2;
clear r3;
clear c1;
clear c2;
clear c3;
clear rr;
clear cc;
clear y0;
clear y1;
clear Lo_R;
clear Hi_R;
end;


// type 3
[Lo_R,Hi_R]=wfilters('bior3.9','r');
[c,s]=wavedec2(a,3,'bior3.9');
dwtmode('ppd');
y0=waverec2(c,s,'bior3.9');
y1=waverec2(c,s,Lo_R,Hi_R);
r3=s(1,1);
c3=s(1,2);
r2=s(3,1);
c2=s(3,2);
r1=s(4,1);
c1=s(4,2);
rr=s(5,1);
cc=s(5,2);
cA3=matrix(c(1:r3*c3),r3,c3);
cH3=matrix(c(r3*c3+1:2*r3*c3),r3,c3);
cV3=matrix(c(2*r3*c3+1:3*r3*c3),r3,c3);
cD3=matrix(c(3*r3*c3+1:4*r3*c3),r3,c3);
cH2=matrix(c(4*r3*c3+1:4*r3*c3+r2*c2),r2,c2);
cV2=matrix(c(4*r3*c3+r2*c2+1:4*r3*c3+2*r2*c2),r2,c2);
cD2=matrix(c(4*r3*c3+2*r2*c2+1:4*r3*c3+3*r2*c2),r2,c2);
cH1=matrix(c(4*r3*c3+3*r2*c2+1:4*r3*c3+3*r2*c2+r1*c1),r1,c1);
cV1=matrix(c(4*r3*c3+3*r2*c2+r1*c1+1:4*r3*c3+3*r2*c2+2*r1*c1),r1,c1);
cD1=matrix(c(4*r3*c3+3*r2*c2+2*r1*c1+1:4*r3*c3+3*r2*c2+3*r1*c1),r1,c1);
cA2=idwt2(cA3,cH3,cV3,cD3,'bior3.9',size(cH2));
cA1=idwt2(cA2,cH2,cV2,cD2,'bior3.9',size(cH1));
r0=idwt2(cA1,cH1,cV1,cD1,'bior3.9',size(a));
dwtmode('spd');
y2=waverec2(c,s,'bior3.9');
y3=waverec2(c,s,Lo_R,Hi_R);
dwtmode('symh');

assert_checkalmostequal ( r0 , y0 , %eps );
assert_checkalmostequal ( r0 , y1 , %eps );
assert_checkalmostequal ( r0 , y2 , %eps );
assert_checkalmostequal ( r0 , y3 , %eps );

clear cA1;
clear cA2;
clear cA3;
clear cH1;
clear cH2;
clear cH3;
clear cV1;
clear cV2;
clear cV3;
clear cD1;
clear cD2;
clear cD3;
clear r0;
clear c;
clear s;
clear r1;
clear r2;
clear r3;
clear c1;
clear c2;
clear c3;
clear rr;
clear cc;
clear y0;
clear y1;
clear y2;
clear y3;
clear Lo_R;
clear Hi_R;
if (version(1)<6) then
stacksize(sz(1));
clear sz;
end;
