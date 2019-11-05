# FRTDataProcessing
Codes used to process data for my dissertation

1. BiomechanicsProcessing: folder containing all softwares for biomechanics processing. 

  Collection softwares: data during training are collected with Qualisys camera system, using a project automation framework (PAF)           project specific to the collection.
  
    *See PAF settings file: Settings.paf
    *See pipeline: combine_outputs.v3s
      Note: pipeline should be put into the templates folder of the project 
  
  V3D data processing softwares: data processed in Visual 3D using a custom pipeline
    
    *See pipeline (still need from kaitlyn)
    
  Postprocessing softwares: Pipeline outputs individual files for each walking trial. A custom matlab script compiles all of these data       (from each subject, session, and trial) into a single spreadsheet

    *See MATLAB script: FRTV3DDataCompile.m

...



