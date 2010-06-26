From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: ebtables & VLAN redirect
Date: Sat, 26 Jun 2010 11:41:06 -0500
Message-ID: <4C262DA2.1040103@riverviewtech.net>
References: <AANLkTilVkFmW0SL3t6ESUN72On5y52OvxYBUz2ZZdAWc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTilVkFmW0SL3t6ESUN72On5y52OvxYBUz2ZZdAWc@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Anatoly Muliarski wrote:
> I have a lot of VLANs( eth1.100-eth1.200) and I need to redirect
> specific IP frames arrived on them to VLAN eth1.9 on L2 level( as I
> cannot use routing for them ). The simple way is to create a bridge
> from all VLANs and filter out redirections to
> unwanted(eth1.100-eth1.200) VLANs.

That will work.

Do you need to do so for all your VLANs, or just some of them?

> But this may cause preformance issues. Is there a finer solution?

Could you get proxy ARP to work?

In other words, why selectively extend your broadcast domains in to the 
other when you might be able to extend individual systems in to multiple 
broadcast domains (in a manner of speaking).

If you aren't modifying frames as they pass through your bridge, and the 
only real thing that takes time to look through is your EBTables rules, 
I don't think you will have a problem.  -  I've run multiple older 
slower systems (P-II 233) doing similar things (and bi-directional 
NATing of source and destination MAC addresses) for a multi-megabit DSL 
connection with out any problems.  -  If you are worried about speed, 
pick up a current low end workstation computer with with a decent 
network card.

I'd say try it and see if the problem you are thinking about will even 
have any impact on the equipment you are using.

Depending on the amount of traffic you are working with, I'd suggest 
gigabit connections to the switch.  If it's really a lot of traffic, 
multiple connections to segregate the traffic.



Grant. . . .
