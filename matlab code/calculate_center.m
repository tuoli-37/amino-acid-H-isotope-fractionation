
function y_center = calculate_center()



%中心碳原子直连氢原子
%非极性的脂肪族氨基酸

%设置温度
temp =linspace(273,373,1000);

%水分子
basefreq_water = load('D:\project1\vib\H2O\H2O.txt');
isofreq_water = load('D:\project1\vib\H2O\H2O-1.txt');
Qre_water =  UBMequation(basefreq_water, isofreq_water, temp);

y_center = struct();

%glycine
basefreq_gly = load('D:\project1\vibration\glycine.txt');
isofreq_gly1 = load('D:\project1\vibration\glycine7.txt');
isofreq_gly2 = load('D:\project1\vibration\glycine8.txt');
Qre_gly1 = UBMequation(basefreq_gly,isofreq_gly1,temp);
Qre_gly2 = UBMequation(basefreq_gly,isofreq_gly2,temp);
gly1 = Qre_gly1./Qre_water;
gly2 = Qre_gly2./Qre_water;
gly1_firstcolumn = gly1(:, 1);
gly2_firstcolumn = gly2(:, 1);
y_center.glycine = 1000*log((gly1_firstcolumn+gly2_firstcolumn)/2);

%L-alanine
basefreq_L_ala = load('D:\project1\vibration\L-alanine.txt');
isofreq_L_ala = load('D:\project1\vibration\L-alanine11.txt');
Qre_L_ala = UBMequation(basefreq_L_ala,isofreq_L_ala,temp);
L_ala = Qre_L_ala./Qre_water;
L_ala_firstcolumn = L_ala(:, 1);
y_center.L_alanine = 1000*log(L_ala_firstcolumn);

%L-proline
basefreq_L_pro = load('D:\project1\vib\L-proline\0-T.txt');
isofreq_L_pro = load('D:\project1\vib\L-proline\3-T.txt');
Qre_L_pro = UBMequation(basefreq_L_pro,isofreq_L_pro,temp);
L_pro = Qre_L_pro./Qre_water;
L_pro_firstcolumn = L_pro(:, 1);
y_center.L_proline = 1000*log(L_pro_firstcolumn);

%L-valine
basefreq_L_val = load('D:\project1\vib\L-valine\0-T.txt');
isofreq_L_val = load('D:\project1\vib\L-valine\2-T.txt');
Qre_L_val = UBMequation(basefreq_L_val, isofreq_L_val, temp);
L_val = Qre_L_val ./ Qre_water;
L_val_firstcolumn = L_val(:, 1);
y_center.L_valine = 1000 * log(L_val_firstcolumn);

%L-leucine
basefreq_L_leu = load('D:\project1\vib\L-leucine\0-T.txt');
isofreq_L_leu = load('D:\project1\vib\L-leucine\2-T.txt');
Qre_L_leu = UBMequation(basefreq_L_leu, isofreq_L_leu, temp);
L_leu = Qre_L_leu ./ Qre_water;
L_leu_firstcolumn = L_leu(:, 1);
y_center.L_leucine = 1000 * log(L_leu_firstcolumn);

%L-isoleucine
basefreq_L_ile = load('D:\project1\vib\L-isoleucine\0-T.txt');
isofreq_L_ile = load('D:\project1\vib\L-isoleucine\2-T.txt');
Qre_L_ile = UBMequation(basefreq_L_ile, isofreq_L_ile, temp);
L_ile = Qre_L_ile ./ Qre_water;
L_ile_firstcolumn = L_ile(:, 1);
y_center.L_isoleucine = 1000 * log(L_ile_firstcolumn);

%D-alanine
basefreq_D_ala = load('D:\project1\vibration\D-alanine.txt');
isofreq_D_ala = load('D:\project1\vibration\D-alanine11.txt');
Qre_D_ala = UBMequation(basefreq_D_ala,isofreq_D_ala,temp);
D_ala = Qre_D_ala./Qre_water;
D_ala_firstcolumn = D_ala(:, 1);
y_center.D_alanine = 1000*log(D_ala_firstcolumn);

%D-proline
basefreq_D_pro = load('D:\project1\vib\D-proline\0-T.txt');
isofreq_D_pro = load('D:\project1\vib\D-proline\9-T.txt');
Qre_D_pro = UBMequation(basefreq_D_pro, isofreq_D_pro, temp);
D_pro = Qre_D_pro ./ Qre_water;
D_pro_firstcolumn = D_pro(:, 1);
y_center.D_proline = 1000 * log(D_pro_firstcolumn);

%D-valine
basefreq_D_val = load('D:\project1\vib\D-valine\0-T.txt');
isofreq_D_val = load('D:\project1\vib\D-valine\2-T.txt');
Qre_D_val = UBMequation(basefreq_D_val, isofreq_D_val, temp);
D_val = Qre_D_val ./ Qre_water;
D_val_firstcolumn = D_val(:, 1);
y_center.D_valine = 1000 * log(D_val_firstcolumn);

%D-leucine
basefreq_D_leu = load('D:\project1\vib\D-leucine\0-T.txt');
isofreq_D_leu = load('D:\project1\vib\D-leucine\1-T.txt');
Qre_D_leu = UBMequation(basefreq_D_leu, isofreq_D_leu, temp);
D_leu = Qre_D_leu ./ Qre_water;
D_leu_firstcolumn = D_leu(:, 1);
y_center.D_leucine = 1000 * log(D_leu_firstcolumn);

%D-isoleucine
basefreq_D_ile = load('D:\project1\vib\D-isoleucine\0-T.txt');
isofreq_D_ile = load('D:\project1\vib\D-isoleucine\1-T.txt');
Qre_D_ile = UBMequation(basefreq_D_ile, isofreq_D_ile, temp);
D_ile = Qre_D_ile ./ Qre_water;
D_ile_firstcolumn = D_ile(:, 1);
y_center.D_isoleucine = 1000 * log(D_ile_firstcolumn);

%侧链不带电荷的极性氨基酸
% L-threonine
basefreq_L_thr = load('D:\project1\vib\L-threonine\0-T.txt');
isofreq_L_thr = load('D:\project1\vib\L-threonine\1-T.txt');
Qre_L_thr = UBMequation(basefreq_L_thr,isofreq_L_thr,temp);
L_thr = Qre_L_thr./Qre_water;
L_thr_firstcolumn = L_thr(:, 1);
y_center.L_threonine = 1000*log(L_thr_firstcolumn);

% L-serine
basefreq_L_ser = load('D:\project1\vibration\L-serine.txt');
isofreq_L_ser = load('D:\project1\vibration\L-serine11.txt');
Qre_L_ser = UBMequation(basefreq_L_ser, isofreq_L_ser, temp);
L_ser = Qre_L_ser ./ Qre_water;
L_ser_firstcolumn = L_ser(:, 1);
y_center.L_serine = 1000 * log(L_ser_firstcolumn);

% L-glutamine
basefreq_L_gln = load('D:\project1\vib\L-glutamine\0-T.txt');
isofreq_L_gln = load('D:\project1\vib\L-glutamine\2-T.txt');
Qre_L_gln = UBMequation(basefreq_L_gln,isofreq_L_gln,temp);
L_gln = Qre_L_gln./Qre_water;
L_gln_firstcolumn = L_gln(:, 1);
y_center.L_glutamine = 1000*log(L_gln_firstcolumn);

% L-asparagine
basefreq_L_asn = load('D:\project1\vib\L-asparagine\0-T.txt');
isofreq_L_asn = load('D:\project1\vib\L-asparagine\2-T.txt');
Qre_L_asn = UBMequation(basefreq_L_asn, isofreq_L_asn, temp);
L_asn = Qre_L_asn ./ Qre_water;
L_asn_firstcolumn = L_asn(:, 1);
y_center.L_asparagine = 1000 * log(L_asn_firstcolumn);

% L-methionine
basefreq_L_met = load('D:\project1\vib\L-metheonine\0-T.txt');
isofreq_L_met = load('D:\project1\vib\L-metheonine\8-T.txt');
Qre_L_met = UBMequation(basefreq_L_met, isofreq_L_met, temp);
L_met = Qre_L_met ./ Qre_water;
L_met_firstcolumn = L_met(:, 1);
y_center.L_methionine = 1000 * log(L_met_firstcolumn);

% L-cysteine
basefreq_L_cys = load('D:\project1\vib\L-cysteine\0-T.txt');
isofreq_L_cys = load('D:\project1\vib\L-cysteine\2-T.txt');
Qre_L_cys = UBMequation(basefreq_L_cys, isofreq_L_cys, temp);
L_cys = Qre_L_cys ./ Qre_water;
L_cys_firstcolumn = L_cys(:, 1);
y_center.L_cysteine = 1000 * log(L_cys_firstcolumn);

% D-serine
basefreq_D_ser = load('D:\project1\vibration\D-serine.txt');
isofreq_D_ser = load('D:\project1\vibration\D-serine11.txt');
Qre_D_ser = UBMequation(basefreq_D_ser, isofreq_D_ser, temp);
D_ser = Qre_D_ser ./ Qre_water;
D_ser_firstcolumn = D_ser(:, 1);
y_center.D_serine = 1000 * log(D_ser_firstcolumn); 

% D-threonine
basefreq_D_thr = load('D:\project1\vib\D-threonine\0-T.txt');
isofreq_D_thr = load('D:\project1\vib\D-threonine\1-T.txt');
Qre_D_thr = UBMequation(basefreq_D_thr,isofreq_D_thr,temp);
D_thr = Qre_D_thr./Qre_water;
D_thr_firstcolumn = D_thr(:, 1);
y_center.D_threonine = 1000*log(D_thr_firstcolumn);

% D-glutamine
basefreq_D_gln = load('D:\project1\vib\D-glutamine\0-T.txt');
isofreq_D_gln = load('D:\project1\vib\D-glutamine\2-T.txt');
Qre_D_gln = UBMequation(basefreq_D_gln, isofreq_D_gln, temp);
D_gln = Qre_D_gln ./ Qre_water;
D_gln_firstcolumn = D_gln(:, 1);
y_center.D_glutamine = 1000 * log(D_gln_firstcolumn);

% D-asparagine
basefreq_D_asn = load('D:\project1\vib\D-asparagine\0-T.txt');
isofreq_D_asn = load('D:\project1\vib\D-asparagine\2-T.txt');
Qre_D_asn = UBMequation(basefreq_D_asn, isofreq_D_asn, temp);
D_asn = Qre_D_asn ./ Qre_water;
D_asn_firstcolumn = D_asn(:, 1);
y_center.D_asparagine = 1000 * log(D_asn_firstcolumn);

% D-methionine
basefreq_D_met = load('D:\project1\vib\D-metheonine\0-T.txt');
isofreq_D_met = load('D:\project1\vib\D-metheonine\11-T.txt');
Qre_D_met = UBMequation(basefreq_D_met, isofreq_D_met, temp);
D_met = Qre_D_met ./ Qre_water;
D_met_firstcolumn = D_met(:, 1);
y_center.D_methionine = 1000 * log(D_met_firstcolumn);

% D-cysteine
basefreq_D_cys = load('D:\project1\vib\D-cysteine\0-T.txt');
isofreq_D_cys = load('D:\project1\vib\D-cysteine\2-T.txt');
Qre_D_cys = UBMequation(basefreq_D_cys, isofreq_D_cys, temp);
D_cys = Qre_D_cys ./ Qre_water;
D_cys_firstcolumn = D_cys(:, 1);
y_center.D_cysteine = 1000 * log(D_cys_firstcolumn);

%芳香族氨基酸
% L-Phenylalanine
basefreq_L_phe = load('D:\project1\vib\L-Phenylalanine\0-T.txt');
isofreq_L_phe = load('D:\project1\vib\L-Phenylalanine\3-T.txt');
Qre_L_phe = UBMequation(basefreq_L_phe, isofreq_L_phe, temp);
L_phe = Qre_L_phe ./ Qre_water;
L_phe_firstcolumn = L_phe(:, 1);
y_center.L_phenylalanine = 1000 * log(L_phe_firstcolumn);

% L-Tyrosine
basefreq_L_tyr = load('D:\project1\vib\L-Tyrosine\0-T.txt');
isofreq_L_tyr = load('D:\project1\vib\L-Tyrosine\2-T.txt');
Qre_L_tyr = UBMequation(basefreq_L_tyr, isofreq_L_tyr, temp);
L_tyr = Qre_L_tyr ./ Qre_water;
L_tyr_firstcolumn = L_tyr(:, 1);
y_center.L_tyrosine = 1000 * log(L_tyr_firstcolumn);

% L-Tryptophan
basefreq_L_trp = load('D:\project1\vib\L-Tryptophan\0-T.txt');
isofreq_L_trp = load('D:\project1\vib\L-Tryptophan\3-T.txt');
Qre_L_trp = UBMequation(basefreq_L_trp, isofreq_L_trp, temp);
L_trp = Qre_L_trp ./ Qre_water;
L_trp_firstcolumn = L_trp(:, 1);
y_center.L_tryptophan = 1000 * log(L_trp_firstcolumn);

% D-Phenylalanine
basefreq_D_phe = load('D:\project1\vib\D-Phenylalanine\0-T.txt');
isofreq_D_phe = load('D:\project1\vib\D-Phenylalanine\13-T.txt');
Qre_D_phe = UBMequation(basefreq_D_phe, isofreq_D_phe, temp);
D_phe = Qre_D_phe ./ Qre_water;
D_phe_firstcolumn = D_phe(:, 1);
y_center.D_phenylalanine = 1000 * log(D_phe_firstcolumn);

% D-Tyrosine
basefreq_D_tyr = load('D:\project1\vib\D-Tyrosine\0-T.txt');
isofreq_D_tyr = load('D:\project1\vib\D-Tyrosine\2-T.txt');
Qre_D_tyr = UBMequation(basefreq_D_tyr, isofreq_D_tyr, temp);
D_tyr = Qre_D_tyr ./ Qre_water;
D_tyr_firstcolumn = D_tyr(:, 1);
y_center.D_tyrosine = 1000 * log(D_tyr_firstcolumn);

% D-Tryptophan
basefreq_D_trp = load('D:\project1\vib\D-Tryptophan\0-T.txt');
isofreq_D_trp = load('D:\project1\vib\D-Tryptophan\3-T.txt');
Qre_D_trp = UBMequation(basefreq_D_trp, isofreq_D_trp, temp);
D_trp = Qre_D_trp ./ Qre_water;
D_trp_firstcolumn = D_trp(:, 1);
y_center.D_tryptophan = 1000 * log(D_trp_firstcolumn);

%侧链带电荷的极性氨基酸
% L-天冬氨酸 (Aspartic acid)
basefreq_L_asp = load('D:\project1\vib\L-asparticacid\0-T.txt');
isofreq_L_asp = load('D:\project1\vib\L-asparticacid\2-T.txt');
Qre_L_asp = UBMequation(basefreq_L_asp, isofreq_L_asp, temp);
L_asp = Qre_L_asp ./ Qre_water;
L_asp_firstcolumn = L_asp(:, 1);
y_center.L_asparticacid = 1000 * log(L_asp_firstcolumn);

% L-谷氨酸 (Glutamic acid)
basefreq_L_glu = load('D:\project1\vib\L-glutamicacid\0-T.txt');
isofreq_L_glu = load('D:\project1\vib\L-glutamicacid\2-T.txt');
Qre_L_glu = UBMequation(basefreq_L_glu, isofreq_L_glu, temp);
L_glu = Qre_L_glu ./ Qre_water;
L_glu_firstcolumn = L_glu(:, 1);
y_center.L_glutamicacid = 1000 * log(L_glu_firstcolumn);

% L-精氨酸 (Arginine)
basefreq_L_arg = load('D:\project1\vib\L-arginine\0-T.txt');
isofreq_L_arg = load('D:\project1\vib\L-arginine\2-T.txt');
Qre_L_arg = UBMequation(basefreq_L_arg, isofreq_L_arg, temp);
L_arg = Qre_L_arg ./ Qre_water;
L_arg_firstcolumn = L_arg(:, 1);
y_center.L_arginine = 1000 * log(L_arg_firstcolumn);

% L-赖氨酸 (Lysine)
basefreq_L_lys = load('D:\project1\vib\L-lysine\0-T.txt');
isofreq_L_lys = load('D:\project1\vib\L-lysine\2-T.txt');
Qre_L_lys = UBMequation(basefreq_L_lys, isofreq_L_lys, temp);
L_lys = Qre_L_lys ./ Qre_water;
L_lys_firstcolumn = L_lys(:, 1);
y_center.L_lysine = 1000 * log(L_lys_firstcolumn);

% L-组氨酸 (Histidine)
basefreq_L_his = load('D:\project1\vib\L-histidine\0-T.txt');
isofreq_L_his = load('D:\project1\vib\L-histidine\2-T.txt');
Qre_L_his = UBMequation(basefreq_L_his, isofreq_L_his, temp);
L_his = Qre_L_his ./ Qre_water;
L_his_firstcolumn = L_his(:, 1);
basefreq_L_hie = load('D:\project1\vib\L-histidine2\0-T.txt');
isofreq_L_hie = load('D:\project1\vib\L-histidine2\2-T.txt');
Qre_L_hie = UBMequation(basefreq_L_hie, isofreq_L_hie, temp);
L_hie = Qre_L_hie ./ Qre_water;
L_hie_firstcolumn = L_hie(:, 1);
y_center.L_histidine = 1000 * log((L_his_firstcolumn+L_hie_firstcolumn)/2);

% D-天冬氨酸 (Aspartic acid)
basefreq_D_asp = load('D:\project1\vib\D-asparcticacid\0-T.txt');
isofreq_D_asp = load('D:\project1\vib\D-asparcticacid\2-T.txt');
Qre_D_asp = UBMequation(basefreq_D_asp, isofreq_D_asp, temp);
D_asp = Qre_D_asp ./ Qre_water;
D_asp_firstcolumn = D_asp(:, 1);
y_center.D_asparticacid = 1000 * log(D_asp_firstcolumn);

% D-谷氨酸 (Glutamic acid)
basefreq_D_glu = load('D:\project1\vib\D-glutamicacid\0-T.txt');
isofreq_D_glu = load('D:\project1\vib\D-glutamicacid\1-T.txt');
Qre_D_glu = UBMequation(basefreq_D_glu, isofreq_D_glu, temp);
D_glu = Qre_D_glu ./ Qre_water;
D_glu_firstcolumn = D_glu(:, 1);
y_center.D_glutamicacid = 1000 * log(D_glu_firstcolumn);

% D-精氨酸 (Arginine)
basefreq_D_arg = load('D:\project1\vib\D-arginine\0-T.txt');
isofreq_D_arg = load('D:\project1\vib\D-arginine\2-T.txt');
Qre_D_arg = UBMequation(basefreq_D_arg, isofreq_D_arg, temp);
D_arg = Qre_D_arg ./ Qre_water;
D_arg_firstcolumn = D_arg(:, 1);
y_center.D_arginine = 1000 * log(D_arg_firstcolumn);

% D-赖氨酸 (Lysine)
basefreq_D_lys = load('D:\project1\vib\D-lysine\0-T.txt');
isofreq_D_lys = load('D:\project1\vib\D-lysine\1-T.txt');
Qre_D_lys = UBMequation(basefreq_D_lys, isofreq_D_lys, temp);
D_lys = Qre_D_lys ./ Qre_water;
D_lys_firstcolumn = D_lys(:, 1);
y_center.D_lysine = 1000 * log(D_lys_firstcolumn);

% D-组氨酸 (Histidine)
basefreq_D_his = load('D:\project1\vib\D-histidine\0-T.txt');
isofreq_D_his = load('D:\project1\vib\D-histidine\1-T.txt');
Qre_D_his = UBMequation(basefreq_D_his, isofreq_D_his, temp);
D_his = Qre_D_his ./ Qre_water;
D_his_firstcolumn = D_his(:, 1);
basefreq_D_hie = load('D:\project1\vib\D-histidine2\0-T.txt');
isofreq_D_hie = load('D:\project1\vib\D-histidine2\2-T.txt');
Qre_D_hie = UBMequation(basefreq_D_hie, isofreq_D_hie, temp);
D_hie = Qre_D_hie ./ Qre_water;
D_hie_firstcolumn = D_hie(:, 1);
y_center.D_histidine = 1000 * log((D_his_firstcolumn+D_hie_firstcolumn)/2);

%3-alanine
basefreq_ala3 = load('D:\project1\vib\3-alanine\0-T.txt');
isofreq1_ala3 = load('D:\project1\vib\3-alanine\3-T.txt');
isofreq2_ala3 = load('D:\project1\vib\3-alanine\4-T.txt');
Qre1_ala3 = UBMequation(basefreq_ala3, isofreq1_ala3, temp);
Qre2_ala3 = UBMequation(basefreq_ala3, isofreq2_ala3, temp);
ala3_1 = Qre1_ala3./ Qre_water;
ala3_2 = Qre2_ala3./ Qre_water;
ala3_1_firstcolumn = ala3_1(:, 1);
ala3_2_firstcolumn = ala3_2(:, 1);
y_center.ala3 = 1000 * log((ala3_1_firstcolumn+ala3_2_firstcolumn)/2);

%4-aminobutyricacid
basefreq_ami = load('D:\project1\vib\4-aminobutyricacid\0-T.txt');
isofreq1_ami = load('D:\project1\vib\4-aminobutyricacid\5-T.txt');
isofreq2_ami = load('D:\project1\vib\4-aminobutyricacid\6-T.txt');
Qre1_ami = UBMequation(basefreq_ami, isofreq1_ami, temp);
Qre2_ami = UBMequation(basefreq_ami, isofreq2_ami, temp);
ami_1 = Qre1_ami./ Qre_water;
ami_2 = Qre2_ami./ Qre_water;
ami_1_firstcolumn = ami_1(:, 1);
ami_2_firstcolumn = ami_2(:, 1);
y_center.ami = 1000 * log((ami_1_firstcolumn+ami_2_firstcolumn)/2);


