function makerois_main(inp)


%% SPM init
spm_jobman('initcfg')


%% Get reference geometry
mnigeom_nii = which(inp.mnigeom_nii);


%% Copy files to working directory with consistent names and unzip
disp('File prep')
[tseg_nii,deffwd_nii] = prep_files(inp);


%% Warp/resample ROIs to MNI space
disp('Warping')
wtseg_nii = warp_images(tseg_nii,deffwd_nii,mnigeom_nii,0,inp.out_dir);


%% Combine desired ROIs into single image
roi_nii = combine_rois(wtseg_nii,inp.out_dir);


%% Make output PDF
system([ ...
        'OUTDIR='   inp.out_dir ' ' ...
        'PROJECT='  inp.project ' ' ...
        'SUBJECT='  inp.subject ' ' ...
        'SESSION='  inp.session ' ' ...
        'SCAN='     inp.scan ' ' ...
		'WSEG_NII=' roi_nii ' ' ...
        'WT1_NII='  inp.wt1_niigz ' ' ...
        'MNI_NII='  mnigeom_nii ' ' ...
        'make_pdf.sh' ...
        ]);


%% Zip output images
system(['gzip ' roi_nii]);


%% Exit
if isdeployed
	exit
end

