From: "Pablo Sanchez" <pablo@blueoakdb.com>
Subject: RE: Allowing ping
Date: Wed, 26 Oct 2005 11:59:46 -0400
Message-ID: <NEBBLLCNFOFHMALJMDDEIEKCBCAB.pablo@blueoakdb.com>
References: <200510261055.48199.rob0@gmx.co.uk>
Reply-To: pablo@blueoakdb.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510261055.48199.rob0@gmx.co.uk>
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
To: /dev/rob0 <rob0@gmx.co.uk>, netfilter@lists.netfilter.org



> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of /dev/rob0
> Sent: Wednesday, October 26, 2005 11:56 AM
> To: netfilter@lists.netfilter.org
> Subject: Re: Allowing ping
>=20
> I think a reasonable --limit is not a bad idea, but there is no=20
> objective measurement of "better". I use a --limit on incoming ping=20
> requests. It might help in the event of a flood ping attack, and you=20
> can still ping to verify your connectivity when you need it.

I believe it marginally helps during an attack.  If you're DDOS, the =
packets are still reaching your NIC so you're kinda hosed anyway.
---
Pablo Sanchez - Blueoak Database Engineering, Inc
Ph:    819.459.1926          Toll free:  888.459.1926
Cell:  819.664.9118                Pgr:  pablo_p@blueoakdb.com
Fax:   603.720.7723 (US)           Fax:  514.371.1255 (Canada)


