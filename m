From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Total traffic
Date: Mon, 6 Oct 2003 10:30:46 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E5C@alderaan.smgtec.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: "Anderson, Ray" <rsa@prideindustries.com>, Mario Ohnewald <mario.Ohnewald@gmx.de>
Cc: netfilter@lists.netfilter.org


This would be better done if you could feed a rule text into a program =
and have it spit out the byte count, but until I get libiptc to build =
properly, this is what I do:

iptables:
$IPTABLES -t mangle -A PREROUTING -i ${ifname}
$IPTABLES -t mangle -A POSTROUTING -o ${ifname}

Counter into RRDTOOL:
TRAFFIC=3D`/sbin/iptables -nxvL -t mangle | grep  "\*      ${ifname} " | =
awk '{ print $2 }'`
OUTBOUND=3D${TRAFFIC}

TRAFFIC=3D`/sbin/iptables -nxvL -t mangle | grep  "${ifname}[\ ]*\*" | =
awk '{ print $2 }'`
INBOUND=3D${TRAFFIC}

This is based on a per-interface byte counter, which I believe is what =
you are looking for. If you try to make the counters much finer grained, =
you will eventually run into the problem of parsing the lines without =
redundancies. My only easy solution to this would be one of two things:

1. Write a program designed to extract the byte counts of any rule where =
its rule text is fed back into the program.
2. Write a simple extension that all it does is print something like =
'ATOM eth0_inbound' or 'ATOM inet_http_in' or whatever. Then from user =
land, you can always filter to a single line by knowing the special =
atomic string.

-----Original Message-----
From: Anderson, Ray [mailto:rsa@prideindustries.com]=20
Sent: Monday, October 06, 2003 8:56 AM
To: Daniel Chemko; Mario Ohnewald
Cc: netfilter@lists.netfilter.org
Subject: RE: Total traffic

Could you give us "noobs" an example ruleset?=20
Thanks!=20
-=3DRay=20
---------------------------------------=20

> -----Original Message-----=20
> From: Daniel Chemko [mailto:dchemko@smgtec.com]=20
> Sent: Monday, October 06, 2003 1:37 AM=20
> To: Mario Ohnewald=20
> Cc: netfilter@lists.netfilter.org=20
> Subject: Re: Total traffic=20
>=20
>=20
> I just insert blank rules to mangle,pre & post.=20
>=20
> Mario Ohnewald wrote:=20
>=20
> >Hello!=20
> >I am running the SuSI Firewall2, and i want to find out my=20
> total traffic,=20
> >which i need for my traffic script.=20
> >I have 2 questions about it:=20
> >Will: iptables=A0 -L -vnx | grep "state NEW,RELATED,ESTABLISHED" | =
grep=20
> >"ACCEPT=A0=A0=A0=A0 all"=20
> >=20
> >Give me the toal traffic? If yes, why does iptraf log about=20
> twice as much=20
> >traffic than my iptables??=20
> >=20
> >Should it not be the same, or am i looking at the wrong=20
> iptables line?=20
> >=20
> >=20
> >Cheers, Mario=20
> >=20
> >=A0=20
> >=20
>=20
>=20

