#!/usr/bin/env bash

# Initialize defaults
export label_info=
export out_dir=/OUTPUTS

# Parse input options
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in      
        --tseg_niigz)    export tseg_niigz="$2";    shift; shift ;;
        --deffwd_niigz)  export deffwd_niigz="$2";  shift; shift ;;
        --wt1_niigz)     export wt1_niigz="$2";     shift; shift ;;
        --mnigeom_nii)   export mnigeom_nii="$2";   shift; shift ;;
        --project)       export project="$2";       shift; shift ;;
        --subject)       export subject="$2";       shift; shift ;;
        --session)       export session="$2";       shift; shift ;;
        --scan)          export scan="$2";          shift; shift ;;
        --out_dir)       export out_dir="$2";       shift; shift ;;
        *) echo "Input ${1} not recognized"; shift ;;
    esac
done

# Prep files
cp "${tseg_niigz}" "${outdir}"/tseg.nii.gz
cp "${deffwd_niigz}" "${outdir}"/y_deffwd.nii.gz
cp "${wt1_niigz}" "${outdir}"/wt1.nii.gz
gunzip "${out_dir}"/*.nii.gz

# Matlab part
run_spm12.sh ${MATLAB_RUNTIME} function makerois \
    wt1_nii "${outdir}"/wt1.nii \
    tseg_nii "${outdir}"/tseg.nii. \
    deffwd_nii "${outdir}"/y_deffwd.nii \
    mnigeom_nii avg152T1.nii \
    out_dir "${out_dir}"

# PDF
make_pdf.sh
