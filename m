From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: "DNAT" w/o changing source address?
Date: Thu, 04 Oct 2007 14:12:51 -0500
Message-ID: <47053B33.6090003@riverviewtech.net>
References: <1191424890.25752.27.camel@localhost.localdomain>	 <47042728.1060508@riverviewtech.net>	 <1191503642.13379.12.camel@localhost.localdomain>	 <4704F5F5.7010601@plouf.fr.eu.org> <1191507779.13379.50.camel@localhost.localdomain> <4704FFD6.8050304@plouf.fr.eu.org> <47050570.7010609@riverviewtech.net> <47050C2B.8020607@plouf.fr.eu.org>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47050C2B.8020607@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/04/07 10:52, Pascal Hambourg wrote:
> It does matter. Granted, maybe should I say "broadcast domain" instead 
> of "subnet" but they usually overlap. A router can be used as a gateway 
> in a route only if it is directly reachable, which implies it is in the 
> same subnet/broadcast domain. You mentionned bridging, which also 
> implies the same broadcast domain.

You are correct.  However I should have been a bit more specific in that 
I don't think that it will matter either way as I think a solution for 
either config can be developed.  Thus it does not matter what it is 
because both can probably be solved.  As far as what the solution is, 
yes it does matter.

I have done more and more with bridging and VLANs to provide very custom 
solutions for a lot of my clients.  I have spanned a single subnet 
across 25+ broadcast domains using bridging and EBTables.  As such the 
lines tend to bluer a lot.  ;)

> PS : thanks for the explanation about LVS.

You're welcome.  I hope that I did an adequate job at explaining it 
based on the fact that I have never used it my self (no call for it 
/yet/), just done a lot of reading.



Grant. . . .
