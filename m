From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Bridges
Date: Thu, 19 Aug 2010 10:29:07 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1008191027530.29534@obet.zrqbmnf.qr>
References: <4C6B10CA.4090604@abpni.co.uk> <4C6C55C8.5000905@riverviewtech.net> <4C6C65CD.6090707@plouf.fr.eu.org> <4C6C660F.9030400@abpni.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C6C660F.9030400@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@vger.kernel.org


On Thursday 2010-08-19 01:00, Jonathan Tripathy wrote:
>> It depends what "traffic" means. Ethernet frames, no. IP packets, yes if
>> the box also acts as an IP router between the bridges.
>>   
>Hmm for such to happen, the bridge where the traffic came in on
>would have to have an IP address, wouldn't it?

Routes are independent of assigned addresses. Though I guess it may 
obstruct ICMP "TTL outlived" replies if the router itself has no address 
to send with.
