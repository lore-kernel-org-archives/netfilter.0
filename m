From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: FORWARD rules
Date: Mon, 15 Sep 2003 18:32:05 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030915183205.2f109f6f.arnt@c2i.net>
References: <20030910175253.GA2752@linux.local>
	<1063260568.26703.1.camel@risingsun.penguindia.com>
	<20030912100957.GA3360@linux.local>
	<1063363533.879.52.camel@elendil.intranet.cartel-securite.net>
	<20030912163656.19b9fb66.arnt@c2i.net>
	<1063378301.888.66.camel@elendil.intranet.cartel-securite.net>
	<20030912201425.25ca0ab4.arnt@c2i.net>
	<20030913022658.GD1667@linux.local>
	<20030913084256.73dc4a3d.arnt@c2i.net>
	<1063612582.928.17.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1063612582.928.17.camel@elendil.intranet.cartel-securite.net>
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
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

On Mon, 15 Sep 2003 09:56:22 +0200,=20
Cedric Blancher <blancher@cartel-securite.fr> wrote in message=20
<1063612582.928.17.camel@elendil.intranet.cartel-securite.net>:

> Le sam 13/09/2003 =E0 08:42, Arnt Karlsen a =E9crit :
> > ..wrong snippet.  ;-)  Reread the thread, and you'll see both I=20
> > and Cedric weren't to clear on that we meant to say, we _implied_=20
> > things instead of actually _saying_ them
>=20
> So, for the things to get clear, the whole script should be[1] :
>=20
>=20
> $IPTABLES -P FORWARD DROP
> $IPTABLES -P INPUT DROP
>=20
> $IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A FORWARD -m state --state NEW -s 125.125.125.0/32 -p tcp \
>         -m tcp --dport 53 -j ACCEPT
> $IPTABLES -A FORWARD -m state --state NEW -s 125.125.125.0/32 -p udp \
>         -m tcp --dport 53 -j ACCEPT
> $IPTABLES -A FORWARD  -m state --state NEW -s 125.125.125.0/32 -p tcp
> \        -m tcp --dport 80 -j ACCEPT
> $IPTABLES -A FORWARD  -m state --state NEW -s 125.125.125.0/32 -p tcp
> \        -m tcp --dport 110 -j ACCEPT
>=20
> $IPTABLES -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>=20
> echo "1" > /proc/sys/net/ipv4/ip_forward
>=20
>=20
> A -m state --state NEW,ESTABLISHED,RELATED _should not_ be used, as
> it's an quasi-generic full match (i.e. nearly matches all packets).
>=20
>=20
> [1] Note I did a typo in my
> <1063363533.879.52.camel@elendil.intranet.cartel-securite.net> post,
> it's FORWARD, not INPUT...

..me too, ;-)  I ofcourse meant we "weren't too clear on what=20
we meant to say"...  ;-)

--=20
..med vennlig hilsen =3D with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three:=20
  best case, worst case, and just in case.


