From: "Martijn Lievaart" <m@rtij.nl>
Subject: Re: REJECT --reject-with icmp-host-unreachable vs DROP
Date: Mon, 27 Mar 2006 11:21:31 +0200 (CEST)
Message-ID: <25781.217.166.60.19.1143451291.squirrel@ma.rtij.nl>
References: <4427A69D.6010702@eccotours.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4427A69D.6010702@eccotours.co.za>
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
To: bclark@eccotours.co.za
Cc: netfilter@lists.netfilter.org

Brent Clark zei:
> Hi all
>
> Just something I would like to pick someones brain with.
>
> If I use the default policy of drop, BUT at the end of the chain use the
> following
>
> $IPT -t filter -A FORWARD -j REJECT --reject-with icmp-host-unreachable
>
> Would that be ok, or does is another ICMP message I can reply back with.

If tcp, use tcp-reset instead. Different stacks can and do react
differently to an icmp-*-unreachable message. Sending back a tcp reset is
the correct thing to do according to the RFCs, and indeed all tcp/ip
stacks(1) understand this.

> Reason I ask this is because I find that by using the default policy
> (DROP), some applications keep retrying to make a connection etc.
> Where as this approach, seems to slow things down (I stand to correction
> on this).

Absolutely right. I personaly drop on the outside and reject on the
inside. Precisely for this reason.

HTH,
M4

(1) Except possibly some very broken stacks such as found in some embedded
machines. I recently had a chance to fight with the Zebra printserver
stack. Ugly.



