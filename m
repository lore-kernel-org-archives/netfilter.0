From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: extreme rDNS lag with iptables
Date: Wed, 5 Nov 2003 01:41:15 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.58.0311050136530.11032@mercury.sdinet.de>
References: <E1AH7km-00008y-AB@aphex.cyberpixels.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E1AH7km-00008y-AB@aphex.cyberpixels.com>
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
To: Ben <nigma@nigma.info>
Cc: netfilter@lists.netfilter.org

On Tue, 4 Nov 2003, Ben wrote:

> The problem I am having that when I turn on iptables, I see rDNS lag to
> about 30 seconds.  I see this happen with two programs I am using, proftpd
> and uwimap.  Both work fine with flush tables, but when I run the following

[rules removed]

> I see login request spike from almost instant to upwards of 30 seconds.
> This of course causes timeouts with most client software.
>
> Has anyone run into this before? Does anyone know how I might go about
> fixing it?

How about allowing answers for outgoing connections from your box back
in? As your rules are now everything connecting FROM your box is dropped
from your default policy.

Your box does at least outbound dns queries from a random source port, and
most likely ident too (your ftp-daemon or more).

a simple

	iptables -A INPUT -m state --state ESTABLISHED,RELATED

should help a lot.

And adding a
	iptables -A INPUT -j LOG
as the very last rule helps while debugging, this way you can see what
your default policy drops.

c'ya
sven

-- 

The Internet treats censorship as a routing problem, and routes around it.
(John Gilmore on http://www.cygnus.com/~gnu/)

