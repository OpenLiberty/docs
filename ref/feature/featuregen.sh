#!/bin/bash

for file in ./gen/*.gendoc; do
    f1=${file%.gendoc}
    f1=${f1#.*\/gen\/}
    newFile=${f1}.adoc

    echo $newFile

    if [[ ! -f "$newFile" ]]; then
        header=$(head -n 5 $file)
        cat <<EOM >>$newFile
${header}

include::${file}[tag=description]

include::${file}[tag=enable]

include::${file}[tag=config]

include::${file}[tag=apis]

include::${file}[tag=requirements]

include::${file}[tag=java-versions]

include::${file}[tag=dependencies]

include::${file}[tag=feature-require]

include::${file}[tag=spi]
EOM
    fi
done
