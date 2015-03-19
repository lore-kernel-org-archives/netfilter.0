From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: DROP policy, serious vulnerability?
Date: Thu, 19 Mar 2015 02:43:43 -0400
Message-ID: <201503190243.44018.neal.p.murphy@alum.wpi.edu>
References: <550A63F0.2030400@gmail.com>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <550A63F0.2030400@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Thursday, March 19, 2015 01:51:44 AM dE wrote:
> Hi!
> 
> I'm using the drop policy for iptables using the following --
> 
> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
> iptables -P FORWARD DROP
> iptables -A INPUT -p tcp -j ACCEPT
> iptables -A INPUT -p udp -j ACCEPT
> iptables -A INPUT -p tcp ! -i lo -m multiport --dports 0:79,81:65535 -m
> state --state NEW -j DROP
> 
> Unfortunately, in this configuration, none of the ports get blocks.
> 
> This implies that after an ACCEPT, further rules are not matched. Is
> this a bug or intended by design?
> 
> If this is by design, how am I supposed to use modules like connlimit
> with DROP policy.

By design. Once a packet is accepted, no more rules are processed. To do 
otherwise would be akin to continuing to execute a program after an exit() 
statement.

In a mathmetical sense, netfilter rules are not commutative. Nor are they 
sorted into a most-specific to most-general order.

Rules are processed in the order in which they are added. Because you added a 
rule that ACCEPTS all TCP packets before the rule that REJECTs certain TCP 
packets, the prior rule always fires on TCP packets and the latter rule never 
fires.

If you want to affect specific packets, you must add such rules before you add 
the broader-reaching rules. Or you must insert such rules ahead of the broader 
rules.
