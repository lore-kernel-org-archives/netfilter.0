From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: Kernel panic - not syncing
Date: Sun, 8 Jan 2006 10:14:42 -0800
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE582900B5A71@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: "Michael D. Berger" <m.d.berger@ieee.org>, netfilter <netfilter@lists.netfilter.org>

Michael,=20

This may or may not help but I know there were some spinlock issues
prior to the RHEL 4 update 2 kernels.  I don't have the links to the
patches offhand.  In my case, I ran into the spinlock bug when using
ipsec and netfilter.

Gary

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Michael D. Berger
> Sent: Sunday, January 08, 2006 10:04 AM
> To: netfilter
> Subject: Kernel panic - not syncing
>=20
> On:
>    Red Hat Enterprise Linux WS release 4(Nahant)
>    Kernel 2.6.9-5.EL on an i686
> I get:
>    Kernel panic - not syncing: net/ipv4/tcp_timer.c:yyy:
>    spin_lock(net/ipv4/tcp_minisocks.c:xxxxxxxx) already locked by
>    net/ipv4/tcp_ipv4.c/1790
>=20
>                      previous         now
> yyy                  211              422
> xxxxxxxx             f5fee080         f62db080
>=20

