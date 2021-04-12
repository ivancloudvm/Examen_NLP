#Script para extraer los datos descargados de http://ai.stanford.edu/~amaas/data/sentiment/ y crear 2 archivos con todos los datos en train y test
#!/bin/bash

# unzip y unpack el archivo tar:
gunzip -c aclImdb_v1.tar.gz | tar xopf -

cd aclImdb

#creamos directorio donde estarán los archivos de train y test
mkdir movie_data

# Creamos los archivos donde estarán todos los datos de train y test, el orden es importante ya que las primeras 12.5k filas tendrán label positiva y las siguientes negativas
# full_train.txt, full_test.txt:
for split in train test;
do

  for sentiment in pos neg;
  do 
    
    for file in $split/$sentiment/*; 
    do
              cat $file >> movie_data/full_${split}.txt; 
              echo >> movie_data/full_${split}.txt; 

	    
    done;
  done;
done;
