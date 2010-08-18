From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: Re: Bridges
Date: Thu, 19 Aug 2010 00:07:18 +0100
Message-ID: <4C6C67A6.9010405@abpni.co.uk>
References: <4C6B10CA.4090604@abpni.co.uk> <4C6C55C8.5000905@riverviewtech.net> <4C6C5739.5040106@abpni.co.uk> <4C6C59E2.4080307@riverviewtech.net> <4C6C5B87.9070906@abpni.co.uk> <alpine.LSU.2.01.1008190025100.29243@obet.zrqbmnf.qr> <4C6C63EF.7060305@abpni.co.uk> <4C6C6731.50401@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C6C6731.50401@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@vger.kernel.org


> you could easily break very useful things such as ARP resolution
> (which uses broadcast) or IPv6 neighbour discovery (which uses multicast).
>    
And I did at first :)

Made an exception for ARP though

What is the best way to stop a linux host from becoming a router? I 
don't think disabling ip forwarding is possible in my case (As I'm doing 
a lot of forwarding in my bridges)

Thanks
