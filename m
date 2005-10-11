From: "Jorge I. Davila L." <davila@cablenet.com.ni>
Subject: Re: iprange match
Date: Tue, 11 Oct 2005 15:16:27 -0600
Message-ID: <1129065387.2415.110.camel@vyatka-39.cablenet.com.ni>
References: <1129043668.2415.12.camel@vyatka-39.cablenet.com.ni>
	<200510111506.03998.rob0@gmx.co.uk>
	<1129062410.2415.103.camel@vyatka-39.cablenet.com.ni>
	<200510111540.49675.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510111540.49675.rob0@gmx.co.uk>
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
To: /dev/rob0 <rob0@gmx.co.uk>
Cc: netfilter@lists.netfilter.org

# make CC=3Dgcc33 KERNEL_DIR=3D/downloads/kernels/xen-2.0/linux-2.4.30-xenU
IPTABLES_DIR=3D/download/iptables-1.3.3 ./runme base
make: Nothing to be done for `runme'.
make: *** No rule to make target `base'.  Stop.

this is the same result for=20

./runme pending
./runme extras=20



El mar, 11-10-2005 a las 15:40 -0500, /dev/rob0 escribi=F3:
> On Tuesday 2005-October-11 15:26, Jorge I. Davila L. wrote:
> > Can you give me some light about how to solve this issue?
>=20
> I already did! Fix your kernel. Maybe it's not in 2.4.30!
>=20
> http://www.netfilter.org/patch-o-matic/pom-base.html#pom-base-iprange
--=20
Jorge Isaac Davila Lopez


