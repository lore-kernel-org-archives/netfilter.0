From: "Martijn Lievaart" <m@rtij.nl>
Subject: Re: load balancing by source IP address
Date: Mon, 21 Aug 2006 17:29:16 +0200 (CEST)
Message-ID: <40337.8592724495$1156174588@news.gmane.org>
References: <451eaded0608210616y1c7752e2r18e30dbd1879e50c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <451eaded0608210616y1c7752e2r18e30dbd1879e50c@mail.gmail.com>
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
To: Gavin White <white.gavin@gmail.com>
Cc: netfilter@lists.netfilter.org

<citaat van="Gavin White">
> Hello,
>
> I would like to use iptables SNAT/DNAT to provide load balancing for
> an inbound web service. The service is sticky, that is to say, users
> must be redirected to the same machine during a user session, which
> can span several TCP sessions.
>
> One simple way to do this would be by redirecting incoming connections
> based on their source IP address. Since addresses might not be evenly
> distributed through the address space, and many customers might be
> concentrated in particular regions, I would like to specify a filter
> using the last octet, ie. *.*.*.0-127 redirects to server A, and
> *.*.*.128-255 redirects to server B. I would also be happy creating
> 255 rules if a last - octet range is not possible.

I think this will do the trick.

-i $EXT -s 0.0.0.0/0.0.0.128 -j SNAT $A
-i $EXT -j SNAT $B

> Does anyone have any suggestions on how to do this, or other, more
> sensible approaches to sticky load balancling?

I think you could the same with the nth and recent matches to achieve
better load balancing, but it would be tricky (and not persistent across
firewall reloads). Something along these  lines:

-i $EXT -j LOADBALANCE

LOADBALANCE chain:
-m recent -name loadbalA -rcheck -update -j SNAT $A
-m recent -name loadbalB -rcheck -update -j SNAT $B
-m nth --every 2 -m recent -name loadbalA -set -j SNAT $A
-m recent -name loadbalB -set -j SNAT $B


For true load balancing (taking the load of the webservers into account)
you'll need something else, iptables alone cannot do that.

HTH,
M4


