#! /bin/bash

clients=('4' '4')
in_root='.'
home="$HOME"
dropbox="${home}/Dropbox"
out_roots=("$dropbox/EPL-Backup" "$dropbox/MAP")
quadri=4
name="LINMA1702-exercices.pdf"

read_th() {
  IFS=' ' read -ra array
  echo "${array[0]}"
}

same () {
  local sign_1=`md5sum $1 | read_th 1`
  local sign_2=`md5sum $2 | read_th 1`
  echo [ "$sign_1" == "$sign_2" ]
}

for i in ${!out_roots[*]}; do
  out_root=${out_roots[$i]}
  in="$in_root/LINMA1702-exercices.pdf"
  out_d="$out_root/Q$quadri/OPTIMISATION/APE"
  out="$out_d/LINMA1702-exercices.pdf"
  if [ -f "$in" ]; then
    if [ ! -d "$out_d" ]; then
      echo "Missing directory: $out_d"
      exit 1
    fi
    echo "Do I copy $in to $out?"
    if [ ! -f "$out" ] || ! `same $in $out`; then
      echo "cp $in $out"
      cp $in $out
    else
      echo "No, their md5sum are the same"
    fi
  fi
done
