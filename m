From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: Strange problem with iptables and ip ranges with leading 0's
 (wor ks sometimes, but not other times)
Date: Wed, 1 Oct 2003 15:32:48 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.58.0310011527210.16926@space.comunit.de>
References: <3FBEFB5CC5DB9C40A2D7E233E20563169CD2CA@sausyd201.corp.ncr.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FBEFB5CC5DB9C40A2D7E233E20563169CD2CA@sausyd201.corp.ncr.com>
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
To: "Fox, Michael" <MF180802@Exchange.Australia.NCR.COM>
Cc: netfilter@lists.netfilter.org, michael@heimic.net

On Wed, 1 Oct 2003, Fox, Michael wrote:

> Basically if we enter in a rule like so; (notice leading 0's 007.0xx.0/24)
[..]
works:
> springer:~# iptables -A mule -p tcp --dport 4661 -s 202.007.077.0/24 -j
> ACCEPT
error:
> springer:~# iptables -A mule -p tcp --dport 4661 -s 202.007.078.0/24 -j
> ACCEPT
> iptables v1.2.8: host/network `202.007.078.0' not found
> Try `iptables -h' or 'iptables --help' for more information.
[..]
> Why does the first few work (with leading 0's, and then the next few fail)
> it would appear some code in iptables evaluating the command line only works
> upto a certain range or values)

Leading zero means "octal instead of decimal"

and in octal notation there is no digit "8", it only goes from 0 to 7

your "077" is 63 decimal.

c'ya
sven

-- 

The Internet treats censorship as a routing problem, and routes around it.
(John Gilmore on http://www.cygnus.com/~gnu/)

