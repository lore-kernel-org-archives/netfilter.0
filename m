From: Jose Maria Lopez <jkerouac@bgsec.com>
Subject: Re: Flush connection tracking
Date: 18 Jan 2005 03:08:23 +0100
Message-ID: <1106014102.29660.2.camel@nostromo.bgsecm.com>
References: <1105976357.4262.3.camel@WLESS>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1105976357.4262.3.camel@WLESS>
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
Content-Type: text/plain; charset="utf-8"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El lun, 17 de 01 de 2005 a las 16:39, Mpourtounis Dimitris escribi=C3=B3:
> Hi All,
>=20
> Is there a way i can flush(delete) all my ip_conntrack connections ?
> I need to do it without having to rmmod,insmod any modules (static
> compiled into kernel 2.4.26)
>=20
> Thanks,
> DB=20

We have a script for doing this (closing all the connections and
clearing the conntrack entries) in our GPL bastion-firewall. Sorry
the comments are yet only in Spanish. The file uses hping2 and is:


#!/bin/bash


#########################################################################
## bastion-firewall GPL (www.bgsec.com)                               =20
#
#########################################################################
## Este archivo es parte de la version GPL de bastion-firewall, un    =20
#
## firewall completo basado en Netfilter e iptables y desarrollado por=20
#
## bgSEC (www.bgsec.com). La licencia de bastion-firewall se          =20
#
## encuentra en el archivo: /etc/bastion-firewall/LICENCIA.txt        =20
#
##                                                                    =20
#
## bastion-firewall es copyright de Jose Maria Lopez Hernandez        =20
#
## (jkerouac@bgsec.com) y bgSEC (www.bgsec.com)                       =20
#
#########################################################################


# Quitar todas las conexiones de la tabla de conntrack para una
# determinada IP o borrar la tabla completamente.

# Forma de usarlo: bsf_clearconntrack [-a] [IP]

# Comprobamos que se ha tecleado bien el comando
if [ "$#" !=3D "1" ] || [ "$1" =3D "-h" ] || [ "$1" =3D "--help" ]; then
    echo=20
    echo " Ayuda de bsf_clearconntrack:"
    echo "   bsf_clearconntrack direccionip (xxx.xxx.xxx.xxx)"
    echo "   bsf_clearconntrack -a : Borra todas las entradas de la
tabla"=20
    echo "   bsf_clearconntrack [-h] [--help]: Muestra esta ayuda"=20
    echo " Borrar todas la conexiones TCP de la tabla de conntrack para
una"
    echo " direccion IP o borrar la tabla completamente. Se cortan las"
    echo " sesiones mandando un RST."
    echo " ES TOTALMENTE NORMAL QUE APAREZCAN ERRORES INDICANDO QUE SE
HA"
    echo " TERMINADO hping2. SE LO EJECUTA Y LUEGO SE LO MATA PARA NO
TENER"
    echo " QUE ESPERAR LAS RESPUESTAS A LOS RESET."
    echo " SOLO SIRVE PARA TCP."
    echo
    echo " Licencia de bastion-firewall en
/etc/bastion-firewall/LICENCIA.txt"
    echo=20
    exit 1
fi

if [ "$MYTAIL" =3D "" ]; then
   source /etc/bastion-firewall/firewall.conf
   source /usr/lib/bastion-firewall/bsf/functions.bsf
fi



# Puede cambiar la ubicacion de estos
CONNTRACKFILE=3D/proc/net/ip_conntrack
HPING2=3D$(which hping2 2>/dev/null)


if [ "$HPING2" =3D "" ]; then
    echo=20
    echo " Error: Este programa necesita hping2 para funcionar"
    echo
fi

RESETIP=3D$1
DIDIT=3D0

if [ "$RESETIP" =3D "-a" ]; then
  $MYCAT $CONNTRACKFILE|$MYGREP -E "^tcp .{10,25}ESTABLISHED"| \
   while read TMPCONN ; do
     echo $TMPCONN
 =20
     # Sacamos los datos de cada conexion
     SRCIP=3D$(echo $TMPCONN|$MYCUT -d '=3D' -f 2|$MYCUT -d ' ' -f 1)
     DSTIP=3D$(echo $TMPCONN|$MYCUT -d '=3D' -f 3|$MYCUT -d ' ' -f 1)
     SRCPORT=3D$(echo $TMPCONN|$MYCUT -d '=3D' -f 4|$MYCUT -d ' ' -f 1)
     DSTPORT=3D$(echo $TMPCONN|$MYCUT -d '=3D' -f 5|$MYCUT -d ' ' -f 1)

     # Mandamos el reset a la IP de destino y al puerto de destino, como
si
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
  $MYCAT $CONNTRACKFILE|$MYGREP -E "^tcp .{10,25}ESTABLISHED
src=3D$RESETIP"| \
   while read TMPCONN ; do
     echo $TMPCONN
 =20
     # Sacamos los datos de cada conexion
     SRCIP=3D$(echo $TMPCONN|$MYCUT -d '=3D' -f 2|$MYCUT -d ' ' -f 1)
     DSTIP=3D$(echo $TMPCONN|$MYCUT -d '=3D' -f 3|$MYCUT -d ' ' -f 1)
     SRCPORT=3D$(echo $TMPCONN|$MYCUT -d '=3D' -f 4|$MYCUT -d ' ' -f 1)
     DSTPORT=3D$(echo $TMPCONN|$MYCUT -d '=3D' -f 5|$MYCUT -d ' ' -f 1)

     # Mandamos el reset a la IP de destino y al puerto de destino, como
si
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


