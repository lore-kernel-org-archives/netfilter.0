From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: "ip_conntrack_core: Frag of proto 17." error and memory leak?
Date: Tue, 16 Sep 2003 10:19:08 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0309161003230.13452@dns.toxicfilms.tv>
References: <3F65EC33.2060906@wp.pl>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F65EC33.2060906@wp.pl>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: c0g <c0g@wp.pl>
Cc: netfilter@lists.netfilter.org

Hello,

On Mon, 15 Sep 2003, c0g wrote:
> I made rule that blocks fragments, but it doesn't stop messages (perhaps
> because the check is performed before rules are evaluated).
How about investigating why are you getting fragments ? Maybe you can
eliminate the problem by avoiding fragmentation.

Anyway, as I remember the conntrack mechanism assembles fragments for
connection tracking purposes, thus it's denoted as /* Never happen */
Maybe you are being flooded, and the conntrack mechanism sees, something
like new fragmented UDP packets that cannot be assembled. Run iptraf,
tcpdump, snort or whatever you wish.

This could explain the memleak: conntrack reserves memory for each udp
fragment and hopes to assemble it, which never happens. I guess that
this should be free'd at some point, after failing to assemble the data,
but I am not sure.

If I am correct, we have a problem in the conntrack mechanism.
And a Netfilter DoS.

> Could it be caused by failed "Frag of proto" assertion?
If I am correct, or at least close, it might.

> Is there someone who had this problem? And solved it?
I never heard of such problems.

Regards,
Maciej


