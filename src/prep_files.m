function [tseg_nii,deffwd_nii] = prep_files(inp)

% MNI space deformation field
copyfile(inp.deffwd_niigz,[inp.out_dir '/y_deffwd.nii.gz']);
system(['gunzip -f ' inp.out_dir '/y_deffwd.nii.gz']);
deffwd_nii = [inp.out_dir '/y_deffwd.nii'];

% Temporal lobe
copyfile(inp.tseg_niigz,[inp.out_dir '/tseg.nii.gz']);
system(['gunzip -f ' inp.out_dir '/tseg.nii.gz']);
tseg_nii = [inp.out_dir '/tseg.nii'];
