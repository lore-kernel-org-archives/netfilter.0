From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Bridges
Date: Fri, 20 Aug 2010 11:25:36 -0500
Message-ID: <4C6EAC80.1030209@riverviewtech.net>
References: <4C6B10CA.4090604@abpni.co.uk> <4C6C55C8.5000905@riverviewtech.net> <4C6C5739.5040106@abpni.co.uk> <4C6C59E2.4080307@riverviewtech.net> <4C6C5B87.9070906@abpni.co.uk> <alpine.LSU.2.01.1008190025100.29243@obet.zrqbmnf.qr> <4C6C63EF.7060305@abpni.co.uk> <4C6C6731.50401@plouf.fr.eu.org> <4C6C67A6.9010405@abpni.co.uk> <4C6C6AED.3090008@plouf.fr.eu.org> <4C6C70B6.7050200@abpni.co.uk> <4C6CDC91.6060804@plouf.fr.eu.org> <4C6D7C42.9060409@abpni.co.uk> <4C6D857B.1070906@plouf.fr.eu.org> <4C6D87E3.9080207@abpni.co.uk> <4C6D9E9F.3080507@plouf.fr.eu.org> <4C6DA0F1.80909@abpni.co.uk> <4C6DAA53.70702@plouf.fr.eu.org> <alpine.LSU.2.01.1008201038140.16356@obet.zrqbmnf.qr> <4C6E4550.1020808@plouf.fr.eu.org> <alpine.LSU.2.01.1008201107550.18181@obet.zrqbmnf.qr> <4C6E583D.7070706@plouf.fr.eu.org>
  <4C6EA72E.9050501@riverviewtech.net> <alpine.LSU.2.01.1008201817560.7497@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1008201817560.7497@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 08/20/10 11:18, Jan Engelhardt wrote:
> ARP proxying with ebtables, basically. (Though there is also a 
> routing-level arp proxy, but somehow it does not feel as steady.)

ARP proxying with EBTables?  Would you mind providing an example use?

The only thing that I can think of that would come close to this would 
be to use EBTables to modify the source and destination MAC addresses of 
ethernet frames so that two end stations on the same segment are talking 
to each other via the bridge performing a man-in-the-middle type operation.

I agree that is a use, I just don't understand it or the motivation 
behind it as well as I'd like to.  -  Said another way, just my morbid 
curiosity.



Grant. . . .
