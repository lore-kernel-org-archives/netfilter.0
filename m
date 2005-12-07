From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: NAT through transfer-LAN
Date: Wed, 7 Dec 2005 22:26:00 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0512072224270.21749@mercury.sdinet.de>
References: <24570.1133960834@www69.gmx.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <24570.1133960834@www69.gmx.net>
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
To: hellion@gmx.net
Cc: netfilter@lists.netfilter.org

On Wed, 7 Dec 2005, hellion@gmx.net wrote:

> Problem: Nothing in the public network or the internet is reachable from the
> private network. Since i can ping as well the public as the private network
> from the RedHat-Box, i assume that NAT isn't working.
>
> Question: What did I forget or do wrong?

Just a quick suggestion, without looking at your rules too closely:

echo 1 >/proc/sys/net/ipv4/ip_forward

c'ya
sven

-- 

The Internet treats censorship as a routing problem, and routes around it.
(John Gilmore on http://www.cygnus.com/~gnu/)

