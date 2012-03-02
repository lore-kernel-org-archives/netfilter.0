From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Private IP getting past IPTables NAT
Date: Fri, 02 Mar 2012 11:12:20 +0100
Message-ID: <4F509D04.4020009@freemail.hu>
References: <SNT143-ds16D3D97D04EB6A5DC9E540C26D0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <SNT143-ds16D3D97D04EB6A5DC9E540C26D0@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Lesley Kimmel <ljkimmel99@hotmail.com>
Cc: netfilter@vger.kernel.org

Hi,

2012-03-02 04:53 keltez=E9ssel, Lesley Kimmel =EDrta:
> I apologize if this is a duplicate email.  I have sent several times=20
> as I was having issues with the spam filter.
>
> All;
>
> We have a Linux virtual server which we use as a NAT/Router (running=20
> IPTables 1.2.11) to front-end a set of virtual machines on a private=20
> (192.168.0.x) network.  In this private network are two web servers=20
> and a few other application servers.  Our intent is to utilize two=20
> public IP addresses on the NAT server to NAT to each back-end web ser=
ver:
>
> External Interfaces:
> eth1 =3D abc.abc.abc.1 =3D> 192.168.0.1 (webserver #1)
> eth1:0 =3D abc.abc.abc.2 =3D> 192.168.0.2 (webserver #2)
> Internal Interface:
> eth0 =3D 192.168.0.3
>
> We had accomplished this with the following IPTables configuration
> Table: nat
> Chain PREROUTING (policy DROP)
Please do not filter in the nat table. It is used only for address=20
rewriting and therefore is sees only the first packet in a connection!!=
!

> target    prot    in    out    source        destination
> DNAT        tcp    eth1    any    anywhere        abc.abc.abc.1=20
> to:192.168.0.1
> DNAT        tcp    eth1    any    anywhere        abc.abc.abc.2=20
> to:192.168.0.2
If these are only webservers then use the --dport 80 option...

> ACCEPT    all    eth0    any    192.168.0.0/24    anywhere    #(to=20
> allow all outgoing traffic)
Again! Do not filter in nat!

>
> Chain POSTROUTING (policy DROP)
> target    prot    in    out    source        destination
> SNAT        all    any    eth1    192.168.0.1    anywhere=20
> to:abc.abc.abc.1
(You do not really need this here, because you have a redundant rule=20
(192.168.0.0/24 -> abc.abc.abc.1). But you can keep it :D )

> SNAT        all    any    eth1    192.168.0.2    anywhere=20
> to:abc.abc.abc.2
> SNAT        all    any    eth1    192.168.0.0/24    anywhere=20
> to:abc.abc.abc.1   #SNAT all other traffic to ip #1
Again! Do not filter in nat!

> Chain OUTPUT (policy ACCEPT)
>
> Table: filter
> Chain Input (policy ACCEPT)
> target    prot    in    out    source        destination
Set up here the enabled services... and use here the drop policy for an=
y=20
non enabled service
iptables -t filter -A INPUT -j ACCEPT -i lo
iptables -t filter -A INPUT -j ACCEPT -m conntrack --state=20
ESTABLISHED,RELATED

> Chain FORWARD (policy ACCEPT)
> target    prot    in    out    source        destination
Set up here the forwarded services... and drop policy again... be aware=
=20
that here you can filter the in_to_out and the out_to_in connections to=
o..
iptables -t filter -A FORWARD -j ACCEPT -m conntrack --state=20
ESTABLISHED,RELATED
iptables -t filter -A FORWARD -j ACCEPT -i eth0 -s 192.168.0.0/24
iptables -t filter -A FORWARD -j ACCEPT -o eth0 -d 192.168.0.1 --dport =
80
iptables -t filter -A FORWARD -j ACCEPT -o eth0 -d 192.168.0.2 --dport =
80

> Chain OUTPUT (policy ACCEPT)
> target    prot    in    out    source        destination
You can ignore this chain, but mainly this is the place for to filter=20
all outgoing connections...
iptables -t filter -A OUTPUT -j ACCEPT -o lo

> Everything APPEARS to work correctly with this configuration. =20
> However, several times a day network monitoring tools on the public=20
> side of the NAT server see packets with source addresses from the=20
> private network (e.g. 192.168.0.4).  In order to troubleshoot we=20
> minimized our configuration to try to isolate the problem.  We took=20
> out the NATing for the second IP:
Yes. It should work correctly... :-\

> With this configuration the 'leaking' of the private IP addresses=20
> seems to stop.  However, we need to have the functionality of the=20
> second IP address. Any insight into why the 'leak' is happening and=20
> how we can add the second IP back in?
>
> Also, I have monitored the traffic across the NAT box with tcpdump. =20
> The majority of traffic is NAT'd as expected.  Only occasionally do=20
> packets 'escape'.  These packets have always been either FIN or RST=20
> packets.
tcpdump is a very interesting tool... it sees packets on the line even=20
before the iptables does...

AFAIK: RST and FIN packets are not considered as part of the=20
connection... so maybe they do not hit the nat table anyhow... but this=
=20
is very odd...
Two more things:
  1. your iptables version is VERY VERY VERY old...
  2. maybe there is a problem with your "virtual server" setup...

Swifty


