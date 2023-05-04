function makerois(varargin)


%% Parse inputs
P = inputParser;

% Temporal lobe segmentation, Temporal_Lobe_v3 SEG
addOptional(P,'tseg_niigz','../INPUTS/segmentation.nii.gz');

% Forward SPM deformation field from native to atlas, cat12 DEF_FWD
addOptional(P,'deffwd_niigz','../INPUTS/y_t1.nii.gz');

% Already-warped subject T1, cat12 BIAS_NORM
addOptional(P,'wt1_niigz','../INPUTS/wmt1.nii.gz');

% Output geometry ('avg152T1.nii' or 'TPM.nii')
addOptional(P,'mnigeom_nii','avg152T1.nii')

% Subject info if on XNAT
addOptional(P,'project','UNK_PROJ');
addOptional(P,'subject','UNK_SUBJ');
addOptional(P,'session','UNK_SESS');
addOptional(P,'scan','UNK_SCAN');

% Output location
addOptional(P,'out_dir','../OUTPUTS');


%% Parse and process
parse(P,varargin{:});
disp(P.Results)

makerois_main(P.Results)

