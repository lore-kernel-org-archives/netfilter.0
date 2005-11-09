From: "Pablo Sanchez" <pablo@blueoakdb.com>
Subject: RE: SNAT vs MASQUERADE ... RE: ftp conntrack - nat problem
Date: Wed, 9 Nov 2005 10:57:24 -0500
Message-ID: <NEBBLLCNFOFHMALJMDDEGEABBFAB.pablo@blueoakdb.com>
References: <200511090951.31228.rob0@gmx.co.uk>
Reply-To: pablo@blueoakdb.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200511090951.31228.rob0@gmx.co.uk>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org



> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of /dev/rob0
> Sent: Wednesday, November 09, 2005 10:52 AM
> To: netfilter@lists.netfilter.org
> Subject: Re: SNAT vs MASQUERADE ... RE: ftp conntrack - nat problem
>=20
>=20
> On Wednesday 2005-November-09 09:23, Pablo Sanchez wrote:
> > When you say the SNAT target is better.  Can you quantify 'better?'=20
> > Are there any functional limitations overcome by SNAT over the
> > MASQUERADE target?
>=20
> Ooooh, I was afraid someone might ask that.=20

:)

> I think one benefit of SNAT is=20
> that a SNAT'ed TCP connection can survive a router reset. That's=20
> important to me, because sometimes I leave ssh sessions open for weeks =

> at a time.

I just switched from the SNAT to the MASQUERADE target and so far (knock =
on wood - my head in this case!) I haven't seen an issue with router =
resets.

I'm very curious to know if there are any differences (aside from =
knowing the IP ahead of time versus not).

Cheers,
-pablo


