From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Check for rule existence
Date: Mon, 14 Jun 2010 13:22:26 -0500
Message-ID: <4C167362.1030201@riverviewtech.net>
References: <AANLkTim0fkO6mhQqBlhAsW-I2blxkP36ld0Hk-W3kF42@mail.gmail.com> <AANLkTimA4wYL8mouRjiygbldj9rLui_vhh1zemVRcmQK@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTimA4wYL8mouRjiygbldj9rLui_vhh1zemVRcmQK@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 06/14/10 12:23, Curby wrote:
> Just a quick note that you might want to look at iptables-save
> instead of vanilla iptables if you aren't already.  The former
> command gives the rules in a sort of canonical form that is used for
> restoring rulesets.  You'll have fewer spacing issues and such.
> Hopefully others will have more to add. =)

(iptables-save) Agreed.

I'd also recommend that you apply your rule and see how iptables-save 
will regurgitate the same rule back at you.  Especially if you are doing 
a textual comparison of the rule.

If you aren't doing a textual comparison of the rule and are actually 
breaking it out in to its individual elements (like command line 
argument processing) you will have a better chance of matching the rule 
on more systems.  Something as simple as a different interface name will 
throw off your textual match.  I.e. "eth0" is actually "eth1".

Depending on how system agnostic you are trying to bee, processing the 
rule as if it were a command line (looking for individual pieces) will 
probably be the easiest to do.



Grant. . . .
