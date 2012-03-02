From: "Lesley Kimmel" <ljkimmel99@hotmail.com>
Subject: Re: Private IP getting past IPTables NAT
Date: Fri, 2 Mar 2012 07:16:32 -0600
Message-ID: <SNT143-ds157334A0BBDD2F3467801CC26D0@phx.gbl>
References: <SNT143-ds16D3D97D04EB6A5DC9E540C26D0@phx.gbl> <4F509D04.4020009@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4F509D04.4020009@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed	reply-type=response"
To: =?iso-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: netfilter@vger.kernel.org

Swifty;

Thanks for the input.  In truth I have done much of what you said.  I h=
ad=20
most of the filtering and forwarding in the filter table as you describ=
ed.=20
However, once we saw the problem we attempted to remove as much as we=20
possibly could from the table and slowly add it back to see where the i=
ssue=20
was.

We do in fact only preroute port 443 on the PREROUTING chain.  I'm sorr=
y=20
that I forgot to include that.

Do you see any issue that both of the public IP addresses are on the sa=
me=20
subnet?

You bring up a good point that I was also trying to understand (rather=20
unrelated to my problem).  It seems that even though connection trackin=
g=20
arguments (ESTABLISHED/RELATED) are allowed in the NAT table they don't=
=20
really affect the outcome as only the first packet is seen as you said.=
  Is=20
that accurate?  I had some ESTABLISHED/RELATED rules in my PREROUTING c=
hain=20
before and they never saw packets.  That must be the explanation.

-----Original Message-----=20
=46rom: G=E1sp=E1r Lajos
Sent: Friday, March 02, 2012 4:12 AM
To: Lesley Kimmel
Cc: netfilter@vger.kernel.org
Subject: Re: Private IP getting past IPTables NAT

Hi,

2012-03-02 04:53 keltez=E9ssel, Lesley Kimmel =EDrta:
> I apologize if this is a duplicate email.  I have sent several times =
as I=20
> was having issues with the spam filter.
>
> All;
>
> We have a Linux virtual server which we use as a NAT/Router (running=20
> IPTables 1.2.11) to front-end a set of virtual machines on a private=20
> (192.168.0.x) network.  In this private network are two web servers a=
nd a=20
> few other application servers.  Our intent is to utilize two public I=
P=20
> addresses on the NAT server to NAT to each back-end web server:
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
Please do not filter in the nat table. It is used only for address
rewriting and therefore is sees only the first packet in a connection!!=
!

> target    prot    in    out    source        destination
> DNAT        tcp    eth1    any    anywhere        abc.abc.abc.1=20
> to:192.168.0.1
> DNAT        tcp    eth1    any    anywhere        abc.abc.abc.2=20
> to:192.168.0.2
If these are only webservers then use the --dport 80 option...

> ACCEPT    all    eth0    any    192.168.0.0/24    anywhere    #(to al=
low=20
> all outgoing traffic)
Again! Do not filter in nat!

>
> Chain POSTROUTING (policy DROP)
> target    prot    in    out    source        destination
> SNAT        all    any    eth1    192.168.0.1    anywhere to:abc.abc.=
abc.1
(You do not really need this here, because you have a redundant rule
(192.168.0.0/24 -> abc.abc.abc.1). But you can keep it :D )

> SNAT        all    any    eth1    192.168.0.2    anywhere to:abc.abc.=
abc.2
> SNAT        all    any    eth1    192.168.0.0/24    anywhere=20
> to:abc.abc.abc.1   #SNAT all other traffic to ip #1
Again! Do not filter in nat!

> Chain OUTPUT (policy ACCEPT)
>
> Table: filter
> Chain Input (policy ACCEPT)
> target    prot    in    out    source        destination
Set up here the enabled services... and use here the drop policy for an=
y
non enabled service
iptables -t filter -A INPUT -j ACCEPT -i lo
iptables -t filter -A INPUT -j ACCEPT -m conntrack --state
ESTABLISHED,RELATED

> Chain FORWARD (policy ACCEPT)
> target    prot    in    out    source        destination
Set up here the forwarded services... and drop policy again... be aware
that here you can filter the in_to_out and the out_to_in connections to=
o..
iptables -t filter -A FORWARD -j ACCEPT -m conntrack --state
ESTABLISHED,RELATED
iptables -t filter -A FORWARD -j ACCEPT -i eth0 -s 192.168.0.0/24
iptables -t filter -A FORWARD -j ACCEPT -o eth0 -d 192.168.0.1 --dport =
80
iptables -t filter -A FORWARD -j ACCEPT -o eth0 -d 192.168.0.2 --dport =
80

> Chain OUTPUT (policy ACCEPT)
> target    prot    in    out    source        destination
You can ignore this chain, but mainly this is the place for to filter
all outgoing connections...
iptables -t filter -A OUTPUT -j ACCEPT -o lo

> Everything APPEARS to work correctly with this configuration.  Howeve=
r,=20
> several times a day network monitoring tools on the public side of th=
e NAT=20
> server see packets with source addresses from the private network (e.=
g.=20
> 192.168.0.4).  In order to troubleshoot we minimized our configuratio=
n to=20
> try to isolate the problem.  We took out the NATing for the second IP=
:
Yes. It should work correctly... :-\

> With this configuration the 'leaking' of the private IP addresses see=
ms to=20
> stop.  However, we need to have the functionality of the second IP=20
> address. Any insight into why the 'leak' is happening and how we can =
add=20
> the second IP back in?
>
> Also, I have monitored the traffic across the NAT box with tcpdump.  =
The=20
> majority of traffic is NAT'd as expected.  Only occasionally do packe=
ts=20
> 'escape'.  These packets have always been either FIN or RST packets.
tcpdump is a very interesting tool... it sees packets on the line even
before the iptables does...

AFAIK: RST and FIN packets are not considered as part of the
connection... so maybe they do not hit the nat table anyhow... but this
is very odd...
Two more things:
  1. your iptables version is VERY VERY VERY old...
  2. maybe there is a problem with your "virtual server" setup...

Swifty


--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html=20

