From: =?UTF-8?B?U8KOw6liYXN0aWVuIENyYW1hdHRl?= 
	<scramatte@zensoluciones.com>
Subject: CLASSIFY vs MARK ?
Date: Thu, 28 Aug 2008 09:41:22 +0200
Message-ID: <48B656A2.8060904@zensoluciones.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

I would like to know how what is the diference between MARK and CLASSIF=
Y=20
target ? =C2=BF Whichone give better performance with lot's of traffic =
/ rules ?
Seems that the LARTC doesn't works anymore ? ...

I understand that MARK + Connmark module is able set  a connection stat=
e=20
to  "related" and put the mark automaticaly on each packet ... isn't it=
 ?
As I can test use CLASSIFY target is fare easy ...
My twice example works,  traffic is matched/shaped properly (I'm using =
a=20
bridge).

Do CLASSIFY target use CONNTRACK  module ?
Does it exists a way to use CLASSIFY in the same way as MARK ... I mean=
=20
CLASSIFY the first packet and set the connection state to "related"  to=
=20
automaticaly put
other packets in the proper tc class ?

CLASSIFY is a feature of 2.6.x kernel  and most of QoS scripts I've=20
found are for 2.4.x

I need to filter lot of P2P with Ipp2p  and l7filter this is why I'm=20
searching  to optimize my rules for better performance.
Seems that with Ipp2p you must use MARK  but for other kind of traffic=20
like VoIP, Ftp  or Web ?

Any comments, tips or help is welcome :)

Regards


--- Connmark / MARK version ---
#!/bin/sh

TC=3D/sbin/tc
IPT=3D/sbin/iptables


${IPT} -t mangle -F
${IPT} -t mangle -X

${TC} qdisc del dev eth0 root

${TC} qdisc add dev eth0 handle 1: root htb default 1
${IPT} -t mangle -N postrouting_eth0

${IPT} -t mangle -A POSTROUTING -m physdev --physdev-out eth0 -j=20
postrouting_eth0

${TC} class add dev eth0 parent 1: classid 1:1 htb rate 2048Kbit ceil=20
2048Kbit
${TC} class add dev eth0 parent 1:1 classid 1:10 htb rate 64Kbit ceil=20
2048Kbit prio 0
${TC} filter add dev eth0 protocol ip pref 2 parent 1: handle 10 fw=20
classid 1:10

${IPT} -A postrouting_eth0 -t mangle -j CONNMARK --restore-mark
${IPT} -A postrouting_eth0 -t mangle -m mark ! --mark 0 -j RETURN
${IPT} -A postrouting_eth0 -t mangle -p tcp --sport 80 -j MARK=20
--set-mark 0xa

${IPT} -A postrouting_eth0 -t mangle -j CONNMARK --save-mark
${IPT} -A postrouting_eth0 -t mangle -j RETURN


--- CLASSIFY version ---
#!/bin/sh

TC=3D/sbin/tc
IPT=3D/sbin/iptables

${IPT} -t mangle -F
${IPT} -t mangle -X

${TC} qdisc del dev eth0 root

${TC} qdisc add dev eth0 handle 1: root htb default 1
${IPT} -t mangle -N postrouting_eth0

${IPT} -t mangle -A POSTROUTING -m physdev --physdev-out eth0 -j=20
postrouting_eth0

${TC} class add dev eth0 parent 1: classid 1:1 htb rate 2048Kbit ceil=20
2048Kbit
${TC} class add dev eth0 parent 1:1 classid 1:10 htb rate 64Kbit ceil=20
2048Kbit prio 0

${IPT} -A postrouting_eth0 -t mangle -p tcp --sport 80 -j CLASSIFY=20
--set-class 1:10


