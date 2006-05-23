From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: Controlling an iptables-match from userspace
Date: Tue, 23 May 2006 14:04:23 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0605231402210.27281@mercury.sdinet.de>
References: <815d745e0605230442x24c596a2w6e97b7fb83dfeba@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <815d745e0605230442x24c596a2w6e97b7fb83dfeba@mail.gmail.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Manfred Stock <manfred.stock@gmail.com>
Cc: netfilter@lists.netfilter.org

On Tue, 23 May 2006, Manfred Stock wrote:

> I'm looking for a way to control an iptables-match from a
> c/c++-program. My goal is to
> have a simple match-module which can be told from userspace to either
> return 0 or 1
> in it's match-function (this would be useful for dynamically turning
> on/off several more
> complicated rules without inserting/removing them from the ip tables,
> i.e. without
> using libiptc (for which I haven't found an easy way on how to use it
> anyways...) or
> iptables itself).

Have a look at the "condition" patch-o-matic-ng extension. Some time ago 
is was in the pom-ng subversion repository, but I don't know where it is 
kept now.

c'ya
sven

-- 

The Internet treats censorship as a routing problem, and routes around it.
(John Gilmore on http://www.cygnus.com/~gnu/)

