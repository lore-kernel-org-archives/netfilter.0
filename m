From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: remove old conntrack entries
Date: 04 Feb 2005 21:12:06 +0100
Message-ID: <1107547924.24666.8.camel@nostromo.bgsecm.com>
References: <0140CEDD3075ED428813B1F2A659081212C7FE@p001ex02.porta.local>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-cKXIWev+NghC8z4B32cY"
In-Reply-To: <0140CEDD3075ED428813B1F2A659081212C7FE@p001ex02.porta.local>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
To: "Baake, Matthias" <m.baake@porta.de>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>


--=-cKXIWev+NghC8z4B32cY
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

El vie, 04 de 02 de 2005 a las 09:30, Baake, Matthias escribi=C3=B3:
> Hi,
>=20
> i'm having problems with my conntrack table. A few days ago i scanned a=
 subnet, thru the problem iptable box, which is not existing. Now about 4=
 days after that scan these connections are still in the connection track=
ing. how do i remove them,=20
> or where is the mistake with the configuration at all?
>=20
> Sorry for the poor english.
>=20
> Best regards

Included in our GPL bastion-firewall firewall it's the script
I attach to this message. It does just what you want.
--=20
Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPA=C3=91A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"

--=-cKXIWev+NghC8z4B32cY
Content-Disposition: attachment; filename=bsf_clearconntrack
Content-Type: text/x-sh; name=bsf_clearconntrack; charset=UTF-8
Content-Transfer-Encoding: 7bit

#!/bin/bash


#########################################################################
## bastion-firewall GPL (www.bgsec.com)                                 #
#########################################################################
## Este archivo es parte de la version GPL de bastion-firewall, un      #
## firewall completo basado en Netfilter e iptables y desarrollado por  #
## bgSEC (www.bgsec.com). La licencia de bastion-firewall se            #
## encuentra en el archivo: /etc/bastion-firewall/LICENCIA.txt          #
##                                                                      #
## bastion-firewall es copyright de Jose Maria Lopez Hernandez          #
## (jkerouac@bgsec.com) y bgSEC (www.bgsec.com)                         #
#########################################################################


# Quitar todas las conexiones de la tabla de conntrack para una
# determinada IP o borrar la tabla completamente.

# Forma de usarlo: bsf_clearconntrack [-a] [IP]

# Comprobamos que se ha tecleado bien el comando
if [ "$#" != "1" ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo 
    echo " Ayuda de bsf_clearconntrack:"
    echo "   bsf_clearconntrack direccionip (xxx.xxx.xxx.xxx)"
    echo "   bsf_clearconntrack -a : Borra todas las entradas de la tabla" 
    echo "   bsf_clearconntrack [-h] [--help]: Muestra esta ayuda" 
    echo " Borrar todas la conexiones TCP de la tabla de conntrack para una"
    echo " direccion IP o borrar la tabla completamente. Se cortan las"
    echo " sesiones mandando un RST."
    echo " ES TOTALMENTE NORMAL QUE APAREZCAN ERRORES INDICANDO QUE SE HA"
    echo " TERMINADO hping2. SE LO EJECUTA Y LUEGO SE LO MATA PARA NO TENER"
    echo " QUE ESPERAR LAS RESPUESTAS A LOS RESET."
    echo " SOLO SIRVE PARA TCP."
    echo
    echo " Licencia de bastion-firewall en /etc/bastion-firewall/LICENCIA.txt"
    echo 
    exit 1
fi

if [ "$MYTAIL" = "" ]; then
   source /etc/bastion-firewall/firewall.conf
   source /usr/lib/bastion-firewall/bsf/functions.bsf
fi



# Puede cambiar la ubicacion de estos
CONNTRACKFILE=/proc/net/ip_conntrack
HPING2=$(which hping2 2>/dev/null)


if [ "$HPING2" = "" ]; then
    echo 
    echo " Error: Este programa necesita hping2 para funcionar"
    echo
fi

RESETIP=$1
DIDIT=0

if [ "$RESETIP" = "-a" ]; then
  $MYCAT $CONNTRACKFILE|$MYGREP -E "^tcp .{10,25}ESTABLISHED"| \
   while read TMPCONN ; do
     echo $TMPCONN
  
     # Sacamos los datos de cada conexion
     SRCIP=$(echo $TMPCONN|$MYCUT -d '=' -f 2|$MYCUT -d ' ' -f 1)
     DSTIP=$(echo $TMPCONN|$MYCUT -d '=' -f 3|$MYCUT -d ' ' -f 1)
     SRCPORT=$(echo $TMPCONN|$MYCUT -d '=' -f 4|$MYCUT -d ' ' -f 1)
     DSTPORT=$(echo $TMPCONN|$MYCUT -d '=' -f 5|$MYCUT -d ' ' -f 1)

     # Mandamos el reset a la IP de destino y al puerto de destino, como si
     # fueramos la conexion verdadera
     echo hping2 $DSTIP -R -s $SRCPORT -p $DSTPORT -a $SRCIP -k -c 1 -n
     hping2 $DSTIP -R -s $SRCPORT -p $DSTPORT -a $SRCIP -k -c 1 -n &
     usleep 100000
     killall -9 hping2

     # Mandamos tambien el reset al lado contrario
     echo hping2 $SRCIP -R -s $DSTPORT -p $SRCPORT -a $DSTIP -k -c 1 -n
     hping2 $SRCIP -R -s $DSTPORT -p $SRCPORT -a $DSTIP -k -c 1 -n &
     usleep 100000
     killall -9 hping2
  done
else
  $MYCAT $CONNTRACKFILE|$MYGREP -E "^tcp .{10,25}ESTABLISHED src=$RESETIP"| \
   while read TMPCONN ; do
     echo $TMPCONN
  
     # Sacamos los datos de cada conexion
     SRCIP=$(echo $TMPCONN|$MYCUT -d '=' -f 2|$MYCUT -d ' ' -f 1)
     DSTIP=$(echo $TMPCONN|$MYCUT -d '=' -f 3|$MYCUT -d ' ' -f 1)
     SRCPORT=$(echo $TMPCONN|$MYCUT -d '=' -f 4|$MYCUT -d ' ' -f 1)
     DSTPORT=$(echo $TMPCONN|$MYCUT -d '=' -f 5|$MYCUT -d ' ' -f 1)

     # Mandamos el reset a la IP de destino y al puerto de destino, como si
     # fueramos la conexion verdadera
     echo hping2 $DSTIP -R -s $SRCPORT -p $DSTPORT -a $SRCIP -k -c 1 -n
     hping2 $DSTIP -R -s $SRCPORT -p $DSTPORT -a $SRCIP -k -c 1 -n &
     usleep 100000
     killall -9 hping2

     # Mandamos tambien el reset al lado contrario
     echo hping2 $SRCIP -R -s $DSTPORT -p $SRCPORT -a $DSTIP -k -c 1 -n
     hping2 $SRCIP -R -s $DSTPORT -p $SRCPORT -a $DSTIP -k -c 1 -n &
     usleep 100000
     killall -9 hping2
  done
fi

# bsf_clearconntrack end

--=-cKXIWev+NghC8z4B32cY--


