From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Help! NAT unable to routing
Date: Fri, 31 Oct 2003 14:16:29 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031031191629.GD30565@cannon.eng.us.uu.net>
References: <BEA73FB6B8F62545A5B2818724D0DF2902E70848@u.library.Arizona.EDU>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <BEA73FB6B8F62545A5B2818724D0DF2902E70848@u.library.Arizona.EDU>
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
To: "Han, Yan" <hany@u.library.arizona.edu>
Cc: =?iso-8859-1?Q?'J=F6rg_Sch=FCtter'?= <netfilter@schuetter.org>, netfilter@lists.netfilter.org

What abou the FORWARD chain?

On Fri, Oct 31, 2003 at 11:59:25AM -0700, Han, Yan wrote:

>=20
> > # what is wrong ??
> > iptables -t nat -A PREROUTING -i eth0 -p tcp -d 150.135.44.245 --dpor=
t 80
> -j
> > DNAT --to 150.135.45.96
>=20
> >> what does "iptables -t nat -L -n -v" show? Is the counter (first col=
umn)
> increased every time you try to connect your webserver?
>=20
> Yes! It does. The "pkts" increases once I try to connect the address
> 150.135.44.245. I think it is correct that destination "150.135.44.245
> tcp dpt:80  to:150.135.45.96". Any idea?
>=20
> -------------------------------
> Chain PREROUTING (policy ACCEPT 512K packets, 78M bytes)
>  pkts bytes target     prot opt in     out     source
> destination        =20
>     3   144 DNAT       tcp  --  eth0   *       0.0.0.0/0
> 150.135.44.245     tcp dpt:80 to:150.135.45.96=20
>=20
> Chain POSTROUTING (policy ACCEPT 46739 packets, 2972K bytes)
>  pkts bytes target     prot opt in     out     source
> destination        =20
>=20
> Chain OUTPUT (policy ACCEPT 46752 packets, 2973K bytes)
>  pkts bytes target     prot opt in     out     source
> destination        =20
>=20
> >> What does "cat /proc/sys/net/ipv4/ip_forward" show?
> 1
> (so the ipv4-forward is opened).
>=20
>=20
>=20
>=20
>   J=F6rg
>=20
> --=20
> J=F6rg Sch=FCtter           http://www.lug-untermain.de/
> joerg@schuetter.org     http://www.schuetter.org/joerg/
> ICQ: 298982789          http://mypenguin.bei.t-online.de/
>=20
>=20

