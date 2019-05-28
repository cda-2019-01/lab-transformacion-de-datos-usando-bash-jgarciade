# Escriba su código aquí
for file in *.csv;
do
    # Deletes empty lines
    sed '/^$/d' $file | \
    # Splits by comma
    awk -F ' ' '{print $1,$2}' | \
    # iterates and splits again by comma, adding the line index
    awk -v j=1 '{ split($2, splitted, ","); for (i in splitted) print j, $1, splitted[i]; j+=1 }' | \
    # adds the file name
    awk -v f="$file" '{print f,$0}' | \
    # replaces blank space with comma
    sed 's/ /,/g';
done