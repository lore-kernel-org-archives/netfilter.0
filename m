From: nullv@gmx.com
Subject: wan ip forwarding
Date: Sat, 18 Feb 2012 14:46:16 -0500
Message-ID: <20120218194620.300960@gmx.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

 Hi, =C2=A0I'm hoping that you can point out what i'm missing here. I h=
ave a server (router0) with a public ip 41.123.234.74/29 that's using a=
n internet modem 41.123.234.73/29 as a gateway. the server (router0) al=
so has a second card used for lan comms where it has ip address 10.0.0.=
1/8. addresses are broadcast via dhcp along with DNS and gateway settin=
gs and everything works perfectly when i MASQUERADE the local ips to th=
e wan address with iptables.=C2=A0 =C2=A0The issue is this: i'm trying =
to set up another server (db0) behind router0 on the lan side and want =
to have it's packets go the my router0 gateway and be forwarded to the =
internet side and vice versa. db0 has an address 41.123.234.75/29 with =
=2E74 set as the gateway. if i set up my addressing on db0 using lan ad=
dresses and 10.0.0.1 my db0 server can connect and everything but if i =
use the wan address i can't connect even to the 41.123.234.74/29 router=
0 address. i had inserted the following rule to my tables forward chain=
:=C2=A0 iptables -I FORWARD -s 41.123.234.72/29 -j ACCEPT=C2=A0 to allo=
w public packets from either side to be forwarded to both sides but i c=
an't seem to get the boxes to through to each other. =C2=A0Can anyone t=
ell me were i'm getting it wrong? =C2=A0Thanks in advance
