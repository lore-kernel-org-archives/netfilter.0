From: "Wilbert J. Rojas O." <sysadmin@ideay.net.ni>
Subject: MASQUERADE MAIL SERVER
Date: Thu, 23 Jul 2009 11:02:53 -0600
Message-ID: <4A6897BD.8000805@ideay.net.ni>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

  Hello,

My Network configuration is that:


ISP
|
|
|
|  *eth0 200.9.190.20* *eth0:1* 200.9.190.21 *eth0:2* 200.9.190.23=20
*eth0:3* 200.9.190.24 *eth0:4* 200.9.190.25
LINUX BOX
|  *eth1 10.24.54.1/32*
|
|
LAN  10.24.54.0/24  gw 10.24.54.1
|
|
MAIL SERVER 10.54.24.96/32  gw 10.24.54.1



All machines to get out to INTERNET through my LINUX BOX included my=20
MAIL SERVER but i want that MAIL SERVER to get out to INTERNET with IP=20
Public Address different like 200.9.190.25 and my all rest network get=20
out through 200.9.190.20

The rules i have applied like this but i don't know how to do that:

/sbin/iptables -t nat -A PREROUTING -i eth1 -s 10.24.54.0/255.255.255.0=
=20
-d 0/0 -p tcp --dport 80 -j REDIRECT --to-port 8080
/sbin/iptables -t nat -A PREROUTING -i eth1 -s 10.24.54.0/255.255.255.0=
=20
-d 0/0 -p tcp --dport 8080 -j REDIRECT --to-port 8080

/sbin/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

/sbin/iptables -t nat -A PREROUTING -p tcp -i eth0 -d 200.9.190.20=20
--dport 25 -j DNAT --to-destination 10.24.54.96:25
/sbin/iptables -t nat -A PREROUTING -p tcp -i eth0 -d 200.9.190.20=20
--dport 110 -j DNAT --to-destination 10.24.54.96:110
/sbin/iptables -t nat -A PREROUTING -p tcp -i eth0 -d 200.9.190.20=20
--dport 143 -j DNAT --to-destination 10.24.54.96:143


Any help or suggestions ??

Regards.



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
Ing. Wilbert Jos=E9 Rojas Ochoa.
Administrador de Sistemas
Ideay ~ Equipos y Sistemas.
Managua, Nicaragua.
Telf. +(505) 2277-4000 Ext: 115.
=46ax   +(505) 2277-4411.
USA:  +(305) 735-8364.
Cel.  +(505) 8883-2877.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D



--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
Ing. Wilbert Jos=E9 Rojas Ochoa.
Administrador de Sistemas
Ideay ~ Equipos y Sistemas.
Managua, Nicaragua.
Telf. +(505) 2277-4000 Ext: 115.
=46ax   +(505) 2277-4411.
USA:  +(305) 735-8364.
Cel.  +(505) 8883-2877.
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D

