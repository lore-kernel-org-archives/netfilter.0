From: "Pablo Sanchez" <pablo@blueoakdb.com>
Subject: RE: Problem compiling iptables 1.3.3 w/kernel 2.6.13-15
Date: Tue, 25 Oct 2005 12:50:15 -0400
Message-ID: <NEBBLLCNFOFHMALJMDDEKEHABCAB.pablo@blueoakdb.com>
References: <Pine.LNX.4.61.0510201849110.27782@filer.marasystems.com>
Reply-To: pablo@blueoakdb.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0510201849110.27782@filer.marasystems.com>
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
> From: Henrik Nordstrom [mailto:hno@marasystems.com]
> Sent: Thursday, October 20, 2005 12:50 PM
> To: Pablo Sanchez
> Cc: netfilter@lists.netfilter.org
> Subject: RE: Problem compiling iptables 1.3.3 w/kernel 2.6.13-15
>=20
>=20
> On Thu, 20 Oct 2005, Pablo Sanchez wrote:
>=20
> > I haven't had any follow ups to the above post.  I'm wondering if =
it's=20
> > because it's such a silly question or whether it's out of the scope =
of=20
> > the list.
>=20
> Try with a standard kernel source tree from kernel.org.

Hi Henrik,

Thank you for the excellent tip.  Sometimes the obvious eludes me. =20

Indeed, the stock Suse 10.0 bits were the issue.  I downloaded the =
standard kernel source per your recommendation, compiled, installed and =
booted. =20

Once running with the stock kernel, IPTABLES compiled without a hitch.

Cheers,
---
Pablo Sanchez - Blueoak Database Engineering, Inc
Ph:    819.459.1926          Toll free:  888.459.1926
Cell:  819.664.9118                Pgr:  pablo_p@blueoakdb.com
Fax:   603.720.7723 (US)           Fax:  514.371.1255 (Canada)


