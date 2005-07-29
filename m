From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Howo to get IP_NF_NAT_LOCAL behavior back after kernel 2.6.10 ?
Date: Fri, 29 Jul 2005 13:26:04 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507291325440.10775@yvahk01.tjqt.qr>
References: <4a9dfdec0507270408427a9e20@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4a9dfdec0507270408427a9e20@mail.gmail.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Djalel Chefrour <cdjalel@gmail.com>
Cc: netfilter@lists.netfilter.org


>I want to redirect local http traffic to a transparent squid porxy
>running on the NAT box itself.
>
>I've used :
># iptables -t nat -A OUTPUT -p tcp -m owner --uid-owner squid -j ACCEPT 
># iptables -t nat -A OUTPUT -p tcp --dport 80 -j REDIRECT --to-ports 3128 
>
>But this works no more with kernel 2.6.11 & later.

> pkts bytes target     prot opt in     out     source               destination 
>    0     0 ACCEPT     tcp  --  any    any     anywhere            
>anywhere            OWNER UID match squid

Looks like squid doesnot send any packets at all.



Jan Engelhardt
-- 

