From: BERTRAND =?iso-8859-1?Q?Jo=EBl?= <mt1@systella.fr>
Subject: Re: ROUTE target and --continue
Date: Tue, 22 Feb 2005 16:33:03 +0100
Message-ID: <20050222153303.GB30350@rayleigh.systella.fr>
References: <20050222105012.GA16180@rayleigh.systella.fr>
	<1109082245.6098.7.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
In-Reply-To: <1109082245.6098.7.camel@hubcap.ljm.dom>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

On Tue, Feb 22, 2005 at 09:24:05AM -0500, Jason Opperisano wrote:
> On Tue, 2005-02-22 at 05:50, BERTRAND Jo=EBl wrote:
> > 	Hello,
> >=20
> > 	I'm trying to use ROUTE target with SNAT. For me, ROUTE works very
> > 	fine without --continue, but I need to add SNAT. Without SNAT, all
> > 	routed packets come from 192.168.0.130 and they have to come from
> > 	192.168.1.1...
> >=20
> > 	Without --continue, they are good routed. To do SNAT, I have added
> > 	--continue and I obtain :
> >=20
> > Root kant:[/var/lib/iptables] > iptables -t mangle -n -v -L | grep RO=
UTE
> >     7   280 ROUTE      tcp  --  *      *       192.168.0.130
> > 	0.0.0.0/0           tcp spts:3000:3001 ROUTE gw:192.168.1.254
> > 	continue
> >=20
> > Root kant:[/var/lib/iptables] > iptables -t nat -n -v -L | grep LOG =20
> >     0     0 LOG        tcp  --  *      *       192.168.0.130
> > 	0.0.0.0/0           tcp spts:3000:3001 LOG flags 0 level 4 prefix
> > 	`SNAT : '=20
> >=20
> > 	Look at "0" on the nat table... And without --continue, I can see my
> > 	packets on eth2 (192.168.1.1). With continue, no one packet... Where
> > 	is the mistake ?
>=20
> probably somewhere other than the two rules you showed us.  "-j ROUTE
> --continue" makes the ROUTE target a non-terminating match--so that
> packets will continue traversing rules *** in that chain ***.
>=20
> since your -j ROUTE rule is in -t mangle (somewhere), and the LOG rule
> is in -t nat POSTROUTING, the --continue won't have any effect on
> whether the packet traverses nat rules or not.
>=20
> again--you don't specify which chain of mangle your ROUTE rule is in,
> but if it's in POSTROUTING, even if it worked the way you are assuming,
> mangle POSTROUTING is *after* nat POSTROUTING.
>=20
> need more info--ideally:
>=20
>   iptables -t mangle -vnxL && iptables -t nat -vnxL && iptables -vnxL

	I have found the solution : ROUTE with --continue have to be in
	mangle/POSTROUTING chain.

	Regards,

	JKB

