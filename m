From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Two identical ips connected
Date: Mon, 16 Oct 2006 13:04:33 +0200
Message-ID: <45336741.5060508@freemail.hu>
References: <20061016095557.058bbde3@vmm1.chaosbringer.de>	<49542.193.173.147.3.1160991666.squirrel@webmail.sterenborg.info>
	<20061016120211.6ab1d49b@vmm1.chaosbringer.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20061016120211.6ab1d49b@vmm1.chaosbringer.de>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Julian Hagenauer <chaosbringer@gmx.de>
Cc: Rob Sterenborg <rob@sterenborg.info>, netfilter@lists.netfilter.org

Julian Hagenauer =EDrta:
> Hi
>
>  =20
>> If you packet would make it to the router and the router had this conf=
iguration:
>> - eth0: 192.168.1.0/24
>> - eth1: 192.168.1.0/24
>> the router cannot distinguish the subnets.
>>
>>    =20
>
> Why so complicated.
> eth0: 192.168.1.4
> eth1: 192.168.1.4
>
>  =20

You can not assign the same ip to both servers.
How would the router route the packets???
If the servers are on the SAME PHYSICAL network then you get an IP=20
collision and they would deny to talk to the net... (Try this with 2=20
Winsucks computers... :) )

The routing is based on IP and not on MAC !!!

> (Hostbased routing) would be enough. Sure the router can not distinguis=
h between the IPs, but he could distinguish between the MACs, so would it=
 be possible to do Masquerading based on MAC-Adresses?
>
>  =20
>> But you'd not even get that far.
>> When you send a packet from a client to the server and this server has=
 same IP
>> as the client (thus src and dst IP are the same), then the packet woul=
dn't
>> even make it to the router: it would be sent to itself.
>>    =20
>
> Mhm, i don't understand that. Let me explain my setup in greater detail=
:
>
> 	Server1---------|
> 			|
> 			|
> 			|
> 	Server2-------Router-------Client
> 			|
> 			|
> 			DB
>
>  =20

Well for this scenario you can set up some load-balancing...

1. With DNS-balancing.
This is not that list ... :)

2. With iptables balancing.

iptables man pages:

"
   BALANCE
       This allows you to DNAT connections in a round-robin way over a=20
given range of destination addresses.

       --to-destination ipaddr-ipaddr
              Address range to round-robin over.
"

"
   DNAT
       This target is only valid in the nat table, in the PREROUTING and=20
OUTPUT chains, and user-defined chains which are only called from those=20
chains.  It specifies that the
       destination  address of the packet should be modified (and all=20
future packets in this connection will also be mangled), and rules=20
should cease being examined.  It takes
       one type of option:

       --to-destination [ipaddr][-ipaddr][:port-port]
              which can specify a single new destination IP address, an=20
inclusive range of IP addresses, and optionally, a port range (which is=20
only valid  if  the  rule  also
              specifies -p tcp or -p udp).  If no port range is=20
specified, then the destination port will never be modified. If no IP=20
address is specified then only the desti-
              nation port will be modified.

              In Kernels up to 2.6.10 you can add several=20
--to-destination options.  For those kernels, if you specify more than=20
one destination address, either via an address
              range  or multiple --to-destination options, a simple=20
round-robin (one after another in cycle) load balancing takes place=20
between these addresses.  Later Kernels
              (>=3D 2.6.11-rc1) don't have the ability to NAT to multiple=
=20
ranges anymore.
"

Let assume these settings:

c (client)
            192.168.1.52
s (virtual server)
            192.168.1.4
s1 (server)
            10.0.0.1
s2 (server)
            10.0.0.2

	     s1---------\
			|
			|
			|
	     s2-------Router-------c
                        |
			|
			DB

iptables -t nat -A PREROUTING -j BALANCE -d 192.168.1.4 --to-destination =
10.0.0.1-10.0.0.2

iptables -t nat -A POSTROUTING -j SNAT -s 10.0.0.1 --to-source 192.168.1.=
4
iptables -t nat -A POSTROUTING -j SNAT -s 10.0.0.2 --to-source 192.168.1.=
4


Maybe this script is useful...
But maybe not... :)

You did not told us what kind of services will be on the servers...
Unfortunately with ftp these rules are not working... :)


> I want that Server 1 and Server2 have the same IP, although only Server=
1 should be accessible for clients.
> The reason for that is, that i want do some kind of load-balancing.
> The problem is, that both Servers need permanent access to the db, so t=
he router should somehow translate/masquerade the ip of the server2, so t=
hat both servers can access the db at the same time.
>
> I know it sound weird :-)
>
>  =20

Just a little bit... :)

> Sincerely,
> Julian
>  =20

Swifty

