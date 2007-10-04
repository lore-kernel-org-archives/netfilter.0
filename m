From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: "DNAT" w/o changing source address?
Date: Thu, 04 Oct 2007 09:09:52 -0500
Message-ID: <4704F430.4070907@riverviewtech.net>
References: <1191424890.25752.27.camel@localhost.localdomain>	 <47042728.1060508@riverviewtech.net> <1191503642.13379.12.camel@localhost.localdomain>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1191503642.13379.12.camel@localhost.localdomain>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/04/07 08:14, John Madden wrote:
> Hmm, well here are the rules I'm running.  The port forward:
> 
> echo "1" > /proc/sys/net/ipv4/ip_forward

*nod*

> iptables -t nat -A PREROUTING -d $EXTIP -p tcp --dport 25 -j DNAT 
> --to $MAILSERVER:25

*nod*

> And the SNAT for return traffic:
> 
> iptables -t nat -A POSTROUTING -d $MAILSERVER -j SNAT --to $EXTIP

Um, here in lies the rub.

> ...At least, I found that traffic wouldn't flow without this 
> additional rule.  Have I gotten something else fundamentally wrong 
> here?

That is very odd.  Do you have other rules in place that could be 
interfering with what you are doing?

Normally with a server behind a NAT all I need to do is DNAT the traffic 
and allow the returning traffic to pass back out through the same NATing 
system and allow it's outbound MASQUERADEing / SNAT to hide the internal 
source IP address.

If you do not have this type of scenario but rather both the redirecting 
IP and the real mail server's IP are both globally routable, then you 
may need to do something else.  Is this possibly the case?



Grant. . . .
