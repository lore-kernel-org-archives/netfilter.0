From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: tarpitting?
Date: Mon, 23 Oct 2006 11:44:05 +0200 (CEST)
Message-ID: <62608.193.173.147.3.1161596645.squirrel@webmail.sterenborg.info>
References: <ehi0pq$sbj$1@saturn.local.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <ehi0pq$sbj$1@saturn.local.net>
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

On Mon, October 23, 2006 11:08, Per Jessen wrote:
> I'm using iptables 1.3.6 on a SUSE 10.1 box with 2.6.16 - and I just
> cannot get tarpitting to work.
>
> # iptables -A INPUT -p tcp -m tcp --dport 135  -j TARPIT
> iptables: No chain/target/match by that name
>
>
> Can someone guide me in the right direction, please?
>
>
> When I asked this on another mailing list it was suggested I need to
> install/run patch-o-matic to get the latest kernel-patches, but when I =
tried
> that nothing got applied.

I don't know exactly what you've tried and if TARPIT is already in kernel
2.6.16, but, if you want to patch your kernel then do it like this:

KERNEL_DIR=3D/path/to/kernel_src \
IPTABLES_DIR=3D/path/to/iptables_src \
./runme extra

Next, you have to configure your kernel for the TARPIT extension and
compile/install it.


Grts,
Rob



