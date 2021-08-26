#!/bin/bash
#
#################################
# PDF Unprotect by SoulInferno  #
#################################
# WIP/Unfinished/Not working yet#
#################################
#Base script (c)by Alfcx (THX!) #
#################################
#
file="$1" ;
dirname=`dirname "$file"` ;
basename=`basename "$file"` ;
#
# Get settings from config.ini
scriptdir=`dirname "$0"` ;
source "$scriptdir/config.ini" ;
#
# Set your language (Make sure it is supported, if not write a translation first manually)
lang="de" ;
#
# If there's no translation for your language, import the english one.
langdir="$scriptdir/lang" ;
if [ -f "$langdir/$lang.ini" ] 
   then source "$langdir/$lang.ini" ;
   else source "$langdir/de.ini" ;
fi ;
#
# Ask for the Name of the output file
if ! ASKPWD=$(zenity --entry \
  --title="$output_title" \
  --text="$output_text" \
  --width=300) ; then
  exit;
fi ;
# 
# Unprotect the file
#pdftk '$dirname/$basename' input_pw $ASKPWD output cat output '$dirname/$basename''-unprotected.pdf';
#
# Example of what the finished line should do:
#pdftk '$PATH_TO_FILE/$FILENAME.pdf' input_pw $ASKPWD output '$PATH_TO_FILE/$FILENAME''-unprotected.pdf';
#
# Delete input files (only if set to true in config.ini)
if [[ "$delinput" = "true" ]] 
   then rm $inputfiles ;
fi ;
