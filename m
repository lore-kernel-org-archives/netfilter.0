From: "Thomas Hilgert" <Thomas.Hilgert@hilgert.de>
Subject: AW: snat dnat question
Date: Sat, 6 Jul 2002 11:11:35 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <8C14C590A51EB74285ADCA3DAD1A9DD705C283@hilgert-srv1.internal.hilgert.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: George Vieira <GeorgeV@citadelcomputer.com.au>
Cc: netfilter@lists.samba.org

Hi George,
What I do is a telnet mail.mailwatch.com 25 to emulate a smtp =
connection. When I do this from my Firewall directly it works fine. If I =
try this from my LAN (10.1.0.0/24) it works. But if I try the same thing =
from my DMZ (10.2.0.0/24) if doesn't answer. The Problem is that it is =
just the mail.mailwatch.com system if i try this with mail.hotmail.com =
it works.
I know this is not a secure iptable configuration. This is just for =
problem fixing and localizing.


Thank in advance


Here are the iptables statements

iptables -L -v -n -x

Chain INPUT (policy ACCEPT 3107 packets, 538340 bytes)
    pkts      bytes target     prot opt in     out     source            =
   destination

Chain FORWARD (policy ACCEPT 5961 packets, 1172509 bytes)
    pkts      bytes target     prot opt in     out     source            =
   destination

Chain OUTPUT (policy ACCEPT 1421 packets, 109590 bytes)
    pkts      bytes target     prot opt in     out     source            =
   destination

iptables -L -v -n -x

Chain INPUT (policy ACCEPT 2862 packets, 513218 bytes)
    pkts      bytes target     prot opt in     out     source            =
   destination

Chain FORWARD (policy ACCEPT 5430 packets, 1122831 bytes)
    pkts      bytes target     prot opt in     out     source            =
   destination

Chain OUTPUT (policy ACCEPT 1116 packets, 89126 bytes)
    pkts      bytes target     prot opt in     out     source            =
   destination
[root@gw1 root]# iptables -L -v -n -x -t nat
Chain PREROUTING (policy ACCEPT 2284 packets, 340072 bytes)
    pkts      bytes target     prot opt in     out     source            =
   destination
     325    20397 DNAT       all  --  eth1   *       0.0.0.0/0           =
 0.0.0.0/0          to:10.2.0.2
       0        0 DNAT       all  --  eth1   *       0.0.0.0/0           =
 0.0.0.0/0          to:10.2.0.2

Chain POSTROUTING (policy ACCEPT 841 packets, 50330 bytes)
    pkts      bytes target     prot opt in     out     source            =
   destination
      17     1122 SNAT       all  --  *      eth1    0.0.0.0/0           =
 0.0.0.0/0          to:212.23.129.186

Chain OUTPUT (policy ACCEPT 129 packets, 5999 bytes)
    pkts      bytes target     prot opt in     out     source            =
   destination


> -----Urspr=FCngliche Nachricht-----
> Von: George Vieira [mailto:GeorgeV@citadelcomputer.com.au]
> Gesendet: Samstag, 6. Juli 2002 03:56
> An: Thomas Hilgert; netfilter@lists.samba.org
> Betreff: RE: snat dnat question
>=20
> Can you tell more about where your testing the telnet.. from outside =
or
> LAN
> etc..
>=20
> Can you list it more verbosely
>=20
> iptables -L -v -n -x
> iptables -L -v -n -x -t nat
>=20
> I usually don't POSTROUTE anywhere to anywhere.. dunno about you but I =
at
> least specify a source address so it doesn't snat something your not =
aware
> of...
>=20
> -----Original Message-----
> From: Thomas Hilgert [mailto:Thomas.Hilgert@hilgert.de]
> Sent: Saturday, 06 July 2002 8:57 AM
> To: netfilter@lists.samba.org
> Subject: snat dnat question
>=20
>=20
> Hi guys,
>=20
> I have some question regarding snat / dnat witch iptables. Here is =
what
> I do
> 1. setup a packetfilter linuxbox with 3 interfaces.
>    ETH0: Connected to the internet (public ip)
>    ETH1: DMZ with stmp server 10.2.0.0/24
>    ETH2: Internal LAN with ip address 10.1.0.0/24
>=20
>    Snat all to the official ip address
>    Dnat all incoming to the smtp server
> See the and of mail for a iptables -t nat -L
> And now the question :-)
> If I do a telnet to mail.mailwatch.com 25 (simulating smtp) is all I =
get
> SYN_SENT and that is no connection from the DMZ. The packet filter has
> no problem to establish a connection.
> PLEASE explain me why
>=20
> Thanks in advance
>=20
> Thomas Hilgert
> -----------------
> Here are the rules to play:
> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination
> DNAT       all  --  anywhere             anywhere           =
to:10.2.0.2
>=20
> Chain POSTROUTING (policy ACCEPT)
> target     prot opt source               destination
> SNAT       all  --  anywhere             anywhere
> to:212.23.129.186
>=20
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
> [root@gw1 iproute2]# iptables -t nat -L
> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination
> DNAT       all  --  anywhere             anywhere           =
to:10.2.0.2
>=20
> Chain POSTROUTING (policy ACCEPT)
> target     prot opt source               destination
> SNAT       all  --  anywhere             anywhere
> to:212.23.129.186
>=20
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
>=20


