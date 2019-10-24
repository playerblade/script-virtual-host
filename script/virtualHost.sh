menu()
{   
    # clear
    echo "1.- Status apache2";
    echo "2.- Listar usuarios";
    echo "3.- Eliminar usuarios";
    echo "5.- Crear Sitio Web Virtual-Hosts";
}
clear
# /10/09/2019/ 5 pts => Servidores => asitencia 5 pts => por el ejecicio de virtual host

# 1.- enjaulamiento sftp-ssh
# 2.- web virtual host
# 3.- web 1 pagina web y juez virtual=> dino- voca
# 4.- DNS local

# option=1
while true
do 
    menu
    read -p "->" op;
    case "$op" in
        1)
            sudo systemctl status apache2
        ;;
        2)
            tail /etc/passwd
        ;;
        3)
            read -p "User: " u;
            sudo userdel $u
        ;;
        5)
            # read -p "User: " ur;
            # sudo adduser $ur
            read -p "Page: " pa;
            sudo mkdir /var/www/$pa
            ls /var/www
            touch /var/www/$pa/index.html
            cat /var/www/root.com/index.html >> /var/www/$pa/index.html
            sudo chown -R $USER.$USER /var/www/$pa 
            sudo cd /etc/apache2/sites-avaliable/
            sudo cp 000-default.conf $pa.conf

            sudo nano $pa
            sudo nano /etc/hosts
            cd /etc/apache2/sites-avaliable
            sudo a2dissite 000-default.conf
            sudo systemctl reload apache2.service
            sudo a2ensite $pa
            sudo systemctl reload apache2.service
        ;;
        0)
            echo "exiting";
        ;;
    esac 
done   