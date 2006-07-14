From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: uid-owner
Date: Fri, 14 Jul 2006 16:49:03 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0607141645350.15850@mercury.sdinet.de>
References: <12ec50350607140522p40cc8a86jd5b08fa88a555900@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <12ec50350607140522p40cc8a86jd5b08fa88a555900@mail.gmail.com>
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
To: "Fabio S. Silva" <fabiofoz@gmail.com>
Cc: netfilter@lists.netfilter.org

On Fri, 14 Jul 2006, Fabio S. Silva wrote:

> Hi all, i want to know how to work with uid-owner i 've tried to use
> with this rule
>
> iptables -A OUTPUT -m owner --uid-owner fabio -j DROP
>
> but all packets created by this user pass the firewall
> if i create the rule in the machine of user fabio its works, but i
> need to create the rule in my firewall gateway, in the firewall i can
> see user fabio with the command id fabio, its returns ok to me, i've
> tried to use with the user id but didnt work.

1.
User user-id/name of the "person" sending the data is not transfered onto 
the network, so if the firewall is on a different machine it won't see 
which user does the traffic - only which source ip it uses.

2.
OUTPUT rules are only used for traffic directly from the machine to 
somewhere, not routed through the machine. So in your firewall it means 
traffic generated directly by the firewall machine, not received from some 
other box and then passed on - such packets use the FORWARD chain.

c'ya
sven

-- 

The Internet treats censorship as a routing problem, and routes around it.
(John Gilmore on http://www.cygnus.com/~gnu/)

