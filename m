From: "Jon Anderson" <jon-anderson@rogers.com>
Subject: Re: iptables can protect syn-flooding?
Date: Wed, 6 Nov 2002 10:06:23 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001f01c285a6$1246f260$0300000a@hypnos>
References: <F124l1k7ZDGRLvoD6ax0001857d@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: SB CH <chulmin2@hotmail.com>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

Can't guarantee that I'm right about the following, or that it's even
relevant, but based on my experience, the following might help...

SB CH (chulmin2@hotmail.com) wrote:
> I saw that we can protect syn-flooding using iptables like this.
>
> $IPTABLES -N syn-flood
> $IPTABLES -A INPUT -p tcp --syn -j syn-flood
> $IPTABLES -A syn-flood -m limit --limit 1/s --limit-burst 4 -j RETURN
> $IPTABLES -A syn-flood -j DROP

Of course one could achieve the same thing by using only two rules:

iptables -A INPUT -p tcp --syn -m limit --limit 1/s --limit-burst 4 -j
ACCEPT
iptables -A INPUT -p tcp --syn -j DROP

But that's just so I can simplify things below...

> But I think that anyone can't protect syn-flooding attack completely using
> this rule, just some legal client can't connect the server because the
rate
> limit rule in busy system.

Ran into the same thing trying to intercept (syn) port scans - makes it real
easy to DoS a machine when the above "flood protection" rules are in effect,
thus making it useless (and even worse than nothing), especially when you
have an HTTP server that will get a few concurrent connections from the same
host (each sending a SYN packet) requesting images, or html pages in an html
frameset. That said, I found a few solutions, none are really perfect, but
are better than the above:

1) Accept served ports, then apply the syn flood protection.

iptables -A INPUT -p tcp --syn --dport 25 -j ACCEPT        <-- A Mail server
iptables -A INPUT -p tcp --syn --dport 80 -j ACCEPT        <-- Or a web
server, for example.
iptables -A INPUT -p tcp --syn -m limit --limit 1/s --limit-burst 4 -j
ACCEPT
iptables -A INPUT -p tcp --syn -j DROP

Add ports as necessary. This of course doesn't work if an attacker is SYN
flooding a particular port you're serving.

2) IPLimit extension (May not be available if you're using an old
distro...?)

iptables -A INPUT -p tcp --syn -m iplimit --iplimit-above 5 -j REJECT

That would allow 5 SYN packets from any given host, then reject any others.
This doesn't work if you're getting flooded by many fake hosts. This is
where your ISP could enable TCP Intercept on their router for you.

3) If by SYN flood, you're trying to block a SYN scan, you could use the PSD
extension, but that's not in the latest stable kernel - only in
patch-o-matic. Works really well though (cheers to the guy who wrote it!).

> I guess that any firewall can't protect syn-flooding except tcp intercept
> method.right?
> (but tcp intercept requires so much memory)

Maybe I'm not clear on what tcp intercept is, but I don't think it's
relevant in your case. Seems you're trying to prevent SYN flooding on the
INPUT chain...It would be relevant if it were a router, and were using the
FORWARD chain. I don't even know of a TCP Intercept implementation for
linux - only for routers (e.g. cisco).

Hope that helps,

jon anderson



