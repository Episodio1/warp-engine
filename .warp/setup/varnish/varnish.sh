#!/bin/bash +x

warp_message ""
warp_message_info "Configuring Varnish Service"

while : ; do
    respuesta_varnish=$( warp_question_ask_default "Do you want to use varnish service? $(warp_message_info [y/N]) " "N" )

    if [ "$respuesta_varnish" = "Y" ] || [ "$respuesta_varnish" = "y" ] || [ "$respuesta_varnish" = "N" ] || [ "$respuesta_varnish" = "n" ] ; then
        break
    else
        warp_message_warn "wrong answer, you must select between two options: $(warp_message_info [Y/n]) "
    fi
done

echo "" >> $ENVIRONMENTVARIABLESFILESAMPLE
echo "# VARNISH Configuration" >> $ENVIRONMENTVARIABLESFILESAMPLE
echo "USE_VARNISH=$respuesta_varnish" >> $ENVIRONMENTVARIABLESFILESAMPLE
echo "" >> $ENVIRONMENTVARIABLESFILESAMPLE    

if [ "$respuesta_varnish" = "Y" ] || [ "$respuesta_varnish" = "y" ]
then
    
    if [ ! -f $CONFIGFOLDER/varnish ]
    then
        cp -R $PROJECTPATH/.warp/setup/varnish/config/varnish $CONFIGFOLDER/varnish
    fi;

    cat $PROJECTPATH/.warp/setup/varnish/tpl/varnish.yml >> $DOCKERCOMPOSEFILESAMPLE
fi; 