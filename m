From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: Are IP ALIASES supported by iptables?
Date: Tue, 29 Jul 2003 11:39:18 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.56.0307291137010.23286@space.comunit.de>
References: <008301c3558f$22b075e0$080a0a0a@medannic>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <008301c3558f$22b075e0$080a0a0a@medannic>
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
To: HTB <kerasakti@nusa.net.id>
Cc: netfilter@lists.netfilter.org

On Tue, 29 Jul 2003, HTB wrote:

> When i want to active nat using iptable on eth0:0 (aliasing) "error appear"
> # /sbin/iptables -A POSTROUTING -j MASQUERADE -t nat -s 192.168.0.0/24 -o eth0:0
> Warning: wierd character in interface `eth0:0' (No aliases, :, ! or *).
>
> Are IP ALIASES supported by iptables?

Ip Aliases practically don't exist anymore, they are just one other ip
address on eth0 marked with a compatibility flag for the old ifconfig.
(Use ip/iproute2 and you see what I mean).

So don't use MASQUERADE and eth0:0, but instead use SNAT and the second ip
of eth0 (aka the one on your eth0:0)

c'ya
sven

-- 

The Internet treats censorship as a routing problem, and routes around it.
(John Gilmore on http://www.cygnus.com/~gnu/)

