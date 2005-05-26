From: =?ISO-8859-1?Q?Martin_Schi=F8tz?= <malinux@gmail.com>
Subject: Re: iptables performance
Date: Thu, 26 May 2005 11:22:40 +0200
Message-ID: <e208f5d1050526022231390100@mail.gmail.com>
References: <e208f5d1050525122040c9003a@mail.gmail.com>
	<20050525212523.GA18093@bender.817west.com>
Reply-To: =?ISO-8859-1?Q?Martin_Schi=F8tz?= <malinux@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050525212523.GA18093@bender.817west.com>
Content-Disposition: inline
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
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

Yes - This looks like the right thing. Thanks :-)=20

On 5/25/05, Jason Opperisano <opie@817west.com> wrote:
> On Wed, May 25, 2005 at 07:20:53PM +0000, Martin Schi=F8tz wrote:
> > Hi
> >
> > I'm planning to set up a bridge running iptables on an uplink of a lot
> > of internet user. The uplink is on maximum at about 30 mbit/s. There
> > are about 1800 * /29 ip nets - some /29 nets needs to be stopped be
> > the bridge and some can pass. I'm wondering about the performance of
> > iptables when having 1800*2 rules worst case (PREROUTING rules on src
> > and dst nets).
>=20
> sounds like a job for ipset [1].  if you have 1800 nets that fall into 2
> categories, you'd have 2 rules, 1 for set 1 and 1 for set 2.  depending
> how the nets break down on CIDR boundaries, you could auto-summarize the
> nets that have the same rules to be applied to them.
>=20
> -j
>=20
> [1] - http://people.netfilter.org/kadlec/ipset/
>=20
> --
> "Quagmire: Don't look at me like that. Fat chicks need love too... but
>  they got to pay."
>         --Family Guy
>=20
>

