From: Thomas Jacob <jacob@internet24.de>
Subject: experiences with ipt_ACCOUNT (was Re: ipt_account / iptables 1.3.8)
Date: Fri, 29 Jun 2007 10:53:12 +0200
Message-ID: <1183107192.19759.0.camel@localhost>
References: <1182962627.16585.6.camel@localhost>
	<4682A981.3090608@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4682A981.3090608@plouf.fr.eu.org>
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
To: netfilter@lists.netfilter.org

Oh well, thanks for the info. A pity, as in kernels up to 2.6.18
the module was doing its job nicely, but I've now tried it with 2.6.21.5
and
there it doesn't even compile anymore.

There's an alternative module called ipt_ACCOUNT however, where
the docs say that it does support 2.6.21.

=3D=3D> http://www.intra2net.com/de/produkte/opensource/ipt_account/

I wonder if anyone would like to share experiences with
that particular module in terms of performance and
stability in a 70-100kpps load scenario.

On Wed, 2007-06-27 at 20:16 +0200, Pascal Hambourg wrote:
> Hello,
>=20
> Thomas Jacob a =E9crit :
> >=20
> > It appears that ipt_account has vanished from
> > iptables 1.3.8 (it was still there in 1.3.7) could
> > someone please comment on the why?
> >=20
> > The changelogs do not mention anything about it
>=20
> They do, in a rather laconic way though :
>=20
> <quote>
> - Remove extensions for unmaintained/obsolete patchlets
> </quote>
>=20
> AFAIK, the concerned extensions are : fuzzy, nth, random (both=20
> superseded by statistic), ROUTE, account, BALANCE, childlevel,=20
> connlimit, dstlimit, FTOS, IPMARK, ipv4options, IPV4OPTSSTRIP, mport,=20
> NETLINK, osf, psd, record_rpc, rpc, TARPIT, TCPLAG, time, TRACE, u32, XOR.



