From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: next topic:  --limit and --burst-limit
Date: 31 Oct 2002 14:51:05 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1036072265.21852.20.camel@elendil>
References: <Pine.LNX.4.44.0210310553200.29866-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0210310553200.29866-100000@localhost.localdomain>
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
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: netfilter mailing list <netfilter@lists.netfilter.org>

Le jeu 31/10/2002 =E0 12:00, Robert P. J. Day a =E9crit :
> this suggests that, if you add a rule incorporating a limit,
> a match would imply that you *haven't* exceeded the limit and
> that you don't necessarily want to take any countermeasures.

Yes it is. You match packets that are _below_ the limit. When filtering,
you usually specifiy things that are acceptable.
=20
>   from one tutorial, here's the lines that deal with=20
> syn-flooding protection:
>=20
>   iptables -N syn-flood
>   iptables -A INPUT -i $IFACE -p tcp --syn -j syn-flood
>   iptables -A syn-flood -m limit --limit 1/s --limit-burst 4 -j RETURN
>   iptables -A syn-flood -j DROP
>  =20
> this seems to match the man page -- in the "syn-flood" user-defined
> chain, if you match the limit rule, you're still fine and you return.
> otherwise, you drop the packet that forced you to exceed the limit.

That's true. If you don't return, then you're over the limit anbd get
logged.

>   so, have i understood this correctly?  thanks for your patience.

On these two points, you're right.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

