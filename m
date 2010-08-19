From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: Re: Bridges
Date: Thu, 19 Aug 2010 19:47:30 +0100
Message-ID: <4C6D7C42.9060409@abpni.co.uk>
References: <4C6B10CA.4090604@abpni.co.uk> <4C6C55C8.5000905@riverviewtech.net> <4C6C5739.5040106@abpni.co.uk> <4C6C59E2.4080307@riverviewtech.net> <4C6C5B87.9070906@abpni.co.uk> <alpine.LSU.2.01.1008190025100.29243@obet.zrqbmnf.qr> <4C6C63EF.7060305@abpni.co.uk> <4C6C6731.50401@plouf.fr.eu.org> <4C6C67A6.9010405@abpni.co.uk> <4C6C6AED.3090008@plouf.fr.eu.org> <4C6C70B6.7050200@abpni.co.uk> <4C6CDC91.6060804@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C6CDC91.6060804@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@vger.kernel.org

>
>>> Disable global IP forwarding.
>>>        
>> I just ran "cat /proc/sys/net/ipv4/ip_forward" and it returned 0. Does
>> this mean that I have "global IP forwarding" off?
>>      
> Yes. So unless you enable /proc/sys/net/ipv4/conf/<interface>/forwarding
> for a bridge, packets won't jump from that bridge to another interface.
>    
Ok so it's all 0. However, in the /proc/sys/net/ipv4/conf folder, I 
don't see my "public" bridge, only the private one. Incidently, the 
private one is the only bridge in my system that has an IP address 
asigned to it...
