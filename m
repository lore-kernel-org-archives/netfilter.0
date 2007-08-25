From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: netfilter optimization.
Date: Sat, 25 Aug 2007 16:29:29 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE5829024F4BB@pxtbenexd01.pxt.primeexalia.com>
References: <57F9959B46E0FA4D8BA88AEDFBE5829024F4B7@pxtbenexd01.pxt.primeexalia.com><46D06DA0.1010706@solutti.com.br><57F9959B46E0FA4D8BA88AEDFBE5829024F4B9@pxtbenexd01.pxt.primeexalia.com><20070825225837.GA26251@internet24.de>
	<20070825232124.GA26316@internet24.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
In-Reply-To: <20070825232124.GA26316@internet24.de>
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
To: Thomas Jacob <jacob@internet24.de>, netfilter@lists.netfilter.org

> Ehm, you're original question was about
> setting conntrack values :-)
>=20
> Originally you couldn't change the hash bucket number after the
> ipt_conntrack module had been loaded, you needed to do that at load
> time (for instance through /etc/sysctl.cnf), but I gather that current
> netfilter versions allow changing the number of hash buckets at
runtime
> through:
>=20
> /sys/module/ip_conntrack/parameters/hashsize
>=20
> Setting #hash buckets=3Dconntrack max should be fine that's what we do
as
> well.
>=20
> Maybe you want to carefully reduce some of the
> /proc/sys/net/ipv4/netfilter/ip_conntrack_*timeout* parameters to
> reduce the number of entries in the connection tracking hash.
>=20

This is what I was looking for.  I'll play around with it.  I just 1)
needed to know where to start and 2) wanted to know what people who
handle this type of traffic currently do.

Thanks,=20

Gary

