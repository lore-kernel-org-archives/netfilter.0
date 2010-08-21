From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Bridges
Date: Sun, 22 Aug 2010 01:25:05 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1008220122410.30882@obet.zrqbmnf.qr>
References: <4C6B10CA.4090604@abpni.co.uk> <4C6C55C8.5000905@riverviewtech.net> <4C6C5739.5040106@abpni.co.uk> <4C6C59E2.4080307@riverviewtech.net> <4C6C5B87.9070906@abpni.co.uk> <alpine.LSU.2.01.1008190025100.29243@obet.zrqbmnf.qr> <4C6C63EF.7060305@abpni.co.uk>
 <4C6C6731.50401@plouf.fr.eu.org> <4C6C67A6.9010405@abpni.co.uk> <4C6C6AED.3090008@plouf.fr.eu.org> <4C6C70B6.7050200@abpni.co.uk> <4C6CDC91.6060804@plouf.fr.eu.org> <4C6D7C42.9060409@abpni.co.uk> <4C6D857B.1070906@plouf.fr.eu.org> <4C6D87E3.9080207@abpni.co.uk>
 <4C6D9E9F.3080507@plouf.fr.eu.org> <4C6DA0F1.80909@abpni.co.uk> <4C6DAA53.70702@plouf.fr.eu.org> <4C6DB5FD.8030607@abpni.co.uk> <4C6E42A6.9080308@plouf.fr.eu.org> <4C704924.3080909@abpni.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C704924.3080909@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@vger.kernel.org


On Saturday 2010-08-21 23:46, Jonathan Tripathy wrote:
>>>     
>> Setting net.ipv4.conf.<interface>.forwarding=0 will disable forwarding
>> of IP packets received on<interface>. But I'm afraid it won't disable
>> all IP operation on it (ARP resolution, accept IP packets for local
>> delivery...)
>
>Just out of interest, if routing was enabled on the Dom0, how would
>the guests be able to use it,

Well, by means of `ebtables -t broute -j DROP` which causes packets
to be routed instead of bridged.

>if the bridge that they were connected
>to didn't have an IP address?

Because routing won't happen with brX, but with vifX.

>Assuming that all IPs for the other
>interfaces on the Dom0 were on a different subnet..
