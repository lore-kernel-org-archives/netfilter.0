From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: netfilter optimization.
Date: Sat, 25 Aug 2007 16:27:44 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE5829024F4BA@pxtbenexd01.pxt.primeexalia.com>
References: <57F9959B46E0FA4D8BA88AEDFBE5829024F4B7@pxtbenexd01.pxt.primeexalia.com><46D06DA0.1010706@solutti.com.br><57F9959B46E0FA4D8BA88AEDFBE5829024F4B9@pxtbenexd01.pxt.primeexalia.com>
	<20070825225837.GA26251@internet24.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
In-Reply-To: <20070825225837.GA26251@internet24.de>
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

> Unless you have a lot of traffic between the dmz and the internal
> network, and assuming 100MB means 100Mbps, and that you have some

Thomas,

The internal network pulls backups from the DMZ.  DMZ and Internal
network are on a dual 1GB nic (Intel).  That works fine since it's
pretty much direct router. =20

> Harald Welte gave a talk once about selecting hardware for netfilter
> firewalls, the notes are available online, maybe it's helpful to you:

We're not really seeing any hardware problems per say, but rather
limitations to the number of active connections tracked through
netfilter.  We've bumped up the value, but as per the original email, I
see recommendations that we should also increase the buckets for
performance reasons.  This is a problem as NF_CONNTRACK_BUCKETS is read
only.

So the question is should I just increase the NF_CONNTRACK_MAX to
something like 1M since this is a dedicated machine, OR will I run into
some other gotcha.

Overall everything else runs pretty nicely and we're happy with the
performance, we just don't want to lose connections because of a full
conntrack.

Gary

