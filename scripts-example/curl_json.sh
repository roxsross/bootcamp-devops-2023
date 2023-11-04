#!/bin/bash
#Autor:RoxsRoss
#Para ejecutar el Script usar argumentos por ejemplo sh curl_json.sh GET


echo "CURL ejemplo y a jugar con json y JQ :)"


if [ $# -eq 0 ]
then
    echo "No ha Seleccionado el metodo, Porfavor seleccione alguna de estas opciones 'GET', 'POST', 'PUT', y 'DELETE'."
    exit
fi

for argument in $@
do
    if [ "$argument" == "GET" ]
    then
        # GET
        echo "Ejecutando GET..."
        GET=$(curl -s -X GET https://jsonplaceholder.typicode.com/users)
        echo $GET | jq '. | map({id: .id, name: .name, email: .email, company: .company.name})'
    elif [ "$argument" == "POST" ]
    then
        # POST
        echo "Ejecutando POST..."
        POST=$(curl -s -X POST https://jsonplaceholder.typicode.com/posts -H 'Content-Type: application/json' -d '{"title":"My new post", "body":"Lorem ipsom style beat", "userId": 1}')
        echo $POST | jq '. | {"message":"success", "id": .id, "title": .title, "body": .body}'
    elif [ "$argument" == "PUT" ]
    then
        # PUT
        echo "Ejecutando PUT..."
        PUT=$(curl -s -X PUT https://jsonplaceholder.typicode.com/posts/1 -H 'Content-Type: application/json' -d '{"title":"My new post", "body":"Lorem ipsom style beat", "userId": 2, "id": 1}')
        echo $PUT | jq '. | {"message":"success", "id": .id, "title": .title, "body": .body}'
    elif [ "$argument" == "DELETE" ]
    then
        # DELETE
        echo "Ejecutanto DELETE..."
        echo "Que ID vas a Borrar? 1-10"
        read id
        if [[ $id =~ ^[0-9]+$ ]]
        then
            DELETE=$(curl -s -w "%{http_code}" -o /dev/null -X DELETE 'https://jsonplaceholder.typicode.com/posts/$id')
            #echo \{\"status_code\"\:$DELETE\,\"status\"\:\"$([[ $DELETE == 200 ]] && echo "success" || echo "failed")\"\} | jq '.'
            echo "status_code: $DELETE, status: $([[ $DELETE == 200 ]] && echo "success" || echo "failed")"
        else
            echo "No es valido el ID, tiene que ser un numero!"
        fi
    else
        echo "Opciones Incorrectas, Porfavor Seleccione algun de estos metodos 'GET', 'POST', 'PUT', and 'DELETE'."
    fi
done
#@roxsross
