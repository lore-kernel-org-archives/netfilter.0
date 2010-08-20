From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Bridges
Date: Fri, 20 Aug 2010 11:09:17 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1008201107550.18181@obet.zrqbmnf.qr>
References: <4C6B10CA.4090604@abpni.co.uk> <4C6C55C8.5000905@riverviewtech.net> <4C6C5739.5040106@abpni.co.uk> <4C6C59E2.4080307@riverviewtech.net> <4C6C5B87.9070906@abpni.co.uk> <alpine.LSU.2.01.1008190025100.29243@obet.zrqbmnf.qr> <4C6C63EF.7060305@abpni.co.uk>
 <4C6C6731.50401@plouf.fr.eu.org> <4C6C67A6.9010405@abpni.co.uk> <4C6C6AED.3090008@plouf.fr.eu.org> <4C6C70B6.7050200@abpni.co.uk> <4C6CDC91.6060804@plouf.fr.eu.org> <4C6D7C42.9060409@abpni.co.uk> <4C6D857B.1070906@plouf.fr.eu.org> <4C6D87E3.9080207@abpni.co.uk>
 <4C6D9E9F.3080507@plouf.fr.eu.org> <4C6DA0F1.80909@abpni.co.uk> <4C6DAA53.70702@plouf.fr.eu.org> <alpine.LSU.2.01.1008201038140.16356@obet.zrqbmnf.qr> <4C6E4550.1020808@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C6E4550.1020808@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: Jonathan Tripathy <jonnyt@abpni.co.uk>, netfilter@vger.kernel.org

On Friday 2010-08-20 11:05, Pascal Hambourg wrote:
>>>>>    
>>>> So in my case, am I at a disadvantage
>>> On the contrary, the old behaviour is an advantage if you don't want an
>>> interface to participate in IP operation.
>> 
>> Well not really, there is always iptables and ebtables.
>
>Ebtables is available only on bridge interfaces.

Which makes sense.

>Here the interface is a
>bridge, but what if you don't want IP on a normal interface ?

You still use iptables to filter potential traffic that goes from br0 to 
br1 or vice versa.

