# Create study-specific ROI image in MNI space

Hippocampus resting state connectivity study.


## Inputs:

All should be matched to the same T1 image.

- T1 image in atlas space (typically BIAS_NORM resource of cat12 assessor)
- Deformation from T1 subject space to atlas space (typically DEF_FWD resource of cat12 assessor)
- Temporal lobe segmentation (typically SEG resource of Temporal_Lobe assessor)


## Outputs

    rois_hipp.nii.gz            Region of interest image
    rois_hipp-labels.csv        Region labels and volumes
	makerois-hipp.pdf           Visual report of final ROI image


## Regions of interest

### Hippocampus

Left and right whole hippocampus built from Temporal_Lobe assessor hippocampus subregions.

