From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Bridges
Date: Sat, 21 Aug 2010 16:44:02 -0500
Message-ID: <4C7048A2.1080408@riverviewtech.net>
References: <4C6B10CA.4090604@abpni.co.uk> <4C6C55C8.5000905@riverviewtech.net> <4C6C5739.5040106@abpni.co.uk> <4C6C59E2.4080307@riverviewtech.net> <4C6C5B87.9070906@abpni.co.uk> <alpine.LSU.2.01.1008190025100.29243@obet.zrqbmnf.qr> <4C6C63EF.7060305@abpni.co.uk> <4C6C6731.50401@plouf.fr.eu.org> <4C6C67A6.9010405@abpni.co.uk> <4C6C6AED.3090008@plouf.fr.eu.org> <4C6C70B6.7050200@abpni.co.uk> <4C6CDC91.6060804@plouf.fr.eu.org> <4C6D7C42.9060409@abpni.co.uk> <4C6D857B.1070906@plouf.fr.eu.org> <4C6D87E3.9080207@abpni.co.uk> <4C6D9E9F.3080507@plouf.fr.eu.org> <4C6DA0F1.80909@abpni.co.uk> <4C6DAA53.70702@plouf.fr.eu.org> <alpine.LSU.2.01.1008201038140.16356@obet.zrqbmnf.qr> <4C6E4550.1020808@plouf.fr.eu.org> <alpine.LSU.2.01.1008201107550.18181@obet.zrqbmnf.qr> <4C6E583D.7070706@plouf.fr.eu.org>
  <4C6EA72E.9050501@riverviewtech.net> <4C6FCB0A.9030402@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C6FCB0A.9030402@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Pascal Hambourg wrote:
> Ethernet does not carry only IP and ARP. There are other protocols in
> use out there. One may want to do MAC-based filtering and mangling on
> normal ethernet interfaces.

Agreed.

However I do think (my opinion is) that IP is by far the simple majority 
of traffic.  Other protocols are less common and closer to the special 
use scenario than they are away from it.

> IMO restricting ebtables to bridges would be like restricting iptables
> to routers.

I in no way was implying that EBTables should be restricted.  Rather I 
was commenting on what I believe the use scenario is, /now/ any form of 
restriction.



Grant. . . .
