From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: netfilter optimization.
Date: Sat, 25 Aug 2007 17:03:58 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE5829024F4BC@pxtbenexd01.pxt.primeexalia.com>
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

> Originally you couldn't change the hash bucket number after the
> ipt_conntrack module had been loaded, you needed to do that at load
> time (for instance through /etc/sysctl.cnf), but I gather that current
> netfilter versions allow changing the number of hash buckets at
runtime
> through:

So this *should* work:

net.netfilter.nf_conntrack_max=3D1048576
net.netfilter.nf_conntrack_buckets=3D1048576

But it only does for nf_conntrack_max.  I did overwrite it by going to
/sys/modules/nf_conntrack/parameters/hashsize and it did take it on the
second try.  The first time it complained about file descriptors.  The
second time it seemed to set it, which I verified by looking at
/proc/sys/net/netfilter/nf_conntrack_buckets.

Is there a way to set this on startup? =20

