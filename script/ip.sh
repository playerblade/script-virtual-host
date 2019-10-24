#!/bin/bash
printf "+++++++++++++++++++++++++++++++++++++++++++++\n"
    printf "|           pulsa 1-9  para entrar o        |\n"
    printf "|               0 para Cancelar:            |\n" 
printf "+++++++++++++++++++++++++++++++++++++++++++++\n"
read -p "-> " s
if [ $s -eq 0 ]
then
    echo "adios";
else
    while true
    do
        echo "1.- Cambiar IP Ubuntu";
        echo "2.- Cambiar IP Windows";
        read option;
        case "$option" in
            1)
                while true
                do
                    echo "1.- Mostrar IP actual";
                    echo "2.- Ingresar nueva IP";
                    echo "3.- Verificar";
                    echo "4.- Ve puertos abiertos";
                    read ubuntu;
                    case "$ubuntu" in
                        1)
                            ifconfig
                            ;; 
                        2)
                            read -p "Interfaz:" i;
                            read -p "Nueva IP:" ni;
                            read -p "Mascara:" m;
                            sudo ifconfig $i $ni netmask $m
                            ;;
                        3)
                            ifconfig
                            ;;
                        4)
                            sudo netstat -ltup
                            ;;
                    esac
                done    
                ;;
            2)
                while true
                do
                    echo "1.- Mostrar IP e Interfaz";
                    echo "2.- Ingresar nueva IP";
                    echo "3.- Poner IP dinamica";
                    echo "4.- Verificar";
                    read windows;
                    case "$windows" in
                        1)
                            netsh interface ipv4 show config
                            ;; 
                        2)
                            read -p "Interfaz: " i;
                            read -p "Nueva IP: " ni;
                            read -p "Mascara: " m;
                            read -p "Gateway: " g;
                            netsh interface ipv4 set address name="$i" static $ni $m $g
                            ;;
                        3)
                            read -p "Interfaz: " inter;
                            netsh interface ip set address "$inter" dhcp
                            ;;
                        4)
                            netsh interface ipv4 show config
                            ;;
                    esac
                done    
                ;;
        esac
    done
fi

            