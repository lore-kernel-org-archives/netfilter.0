From: "Paul" <andnicky@myrealbox.com>
Subject: Re: RE: Can iptables create alias IP for another box?
Date: Sun, 22 Dec 2002 23:24:51 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1040617491.c2706ec0andnicky@myrealbox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: rsterenborg@xs4all.nl
Cc: netfilter@lists.netfilter.org

Thank you, Rob.  I'll try this tomorrow at the office. =20

Then may try to see whether it can work for most (or all?) IP traffic.  Som=
etimes I've wanted to give a server a "virtual alias" IP without having t=
o touch the server itself.

> Port 80 : webserver ?
> Port 8080 : web-proxy ?

Don't need 8080 if iptables on B can do:

  client(tcp/80)--> boxB--> boxA--> boxB--> client

A & B have one interface each, on different subnets routed to each other.

> I was trying to do something like this on box B (from=20
> error-prone memory, with B's address 10.5.6.7):
>=20
> > iptables -t nat -A PREROUTING -d 10.5.6.7 -p tcp --dport=20
> 8080 -j DNAT --to 1.2.3.4:80
>=20
> > iptables -t nat -A POSTROUTING -d 1.2.3.4 -p tcp --dport=20
> 80 -j SNAT --to 10.5.6.7


Do you have a default FORWARD policy of DROP ?
If so, you also need a FORWARD ACCEPT rule.

**** I didn't know it, but probably did have a default FORWARD policy of DR=
OP.  Had only followed the NAT part of Rusty's docs.******


I'd try :
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -d 1.2.3.4 -p tcp --dport 80 -j ACCEPT
iptables -t nat -A PREROUTING -d 10.5.6.7 -p tcp --dport 8080 -j DNAT --to-=
destination 1.2.3.4:80

I don't know what you are trying to do with your second rule.
If it's meant as a reverse rule of the first,****YES**** then you maybe bet=
ter use RELATED,ESTABLISHED.

But if you want to SNAT 1.2.3.4 to (public ?) 10.5.6.7 :
iptables -A FORWARD -s 1.2.3.4 -j ACCEPT
iptables -t nat -A POSTROUTING -s 1.2.3.4 -j SNAT --to-source 10.5.6.7


Rob






