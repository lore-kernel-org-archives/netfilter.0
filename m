From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: nat no traffic returns
Date: Thu, 22 May 2003 08:52:49 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6C81@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

>You should add an SNAT rule, so your inside box is able to answer to =
the=20
>outside connection from privat IP (10.0.0.112).=20
This is not neccessary true, this isn't a requirement until the =
10.0.0.112 machine needs to make the first move and make an outgoing =
connection (SYN), only then you would need SNAT. DNAT connections should =
be handled fine with ip_conntrack.

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

=20

-----Original Message-----
From: Szabo Nandor [mailto:medve@wenetto.hu]
Sent: Wednesday, May 21, 2003 7:49 PM
To: netfilter@lists.netfilter.org
Subject: Re: nat no traffic returns


B. van Ouwerkerk writes:=20

> This one is really starting to get me.=20
>=20
> I have worked with iptables before without connections started from =
the=20
> outside. In this case I need to allow connection from the outside to =
go to=20
> a box on the inside.=20
>=20
> I was under the impression that a rule like:=20
>=20
> iptables -t nat -A PREROUTING -i eth0 -p tcp -d public_ip --dport 3389 =
-j=20
> DNAT --to 10.0.0.112:3389=20
>=20
> would send the incoming packets to the inside box. And that:=20
>=20
> iptables -A FORWARD -i eth1 -o eth0 -s 10.0.0.112 -j ACCEPT
> or
> iptables -A FORWARD -i eth1 -j ACCEPT=20
>=20
> Should send any reply from the inside box to the world.
> But it isn't happening :(

You should add an SNAT rule, so your inside box is able to answer to the =

outside connection from privat IP (10.0.0.112).=20

#iptables -A POSTROUTING -s 10.0.0.112 -o eth0 -j SNAT --to-source =
public_ip=20

Nandor Szabo=20


