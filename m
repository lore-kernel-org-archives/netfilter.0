From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Bridges
Date: Thu, 19 Aug 2010 23:14:07 +0200
Message-ID: <4C6D9E9F.3080507@plouf.fr.eu.org>
References: <4C6B10CA.4090604@abpni.co.uk> <4C6C55C8.5000905@riverviewtech.net> <4C6C5739.5040106@abpni.co.uk> <4C6C59E2.4080307@riverviewtech.net> <4C6C5B87.9070906@abpni.co.uk> <alpine.LSU.2.01.1008190025100.29243@obet.zrqbmnf.qr> <4C6C63EF.7060305@abpni.co.uk> <4C6C6731.50401@plouf.fr.eu.org> <4C6C67A6.9010405@abpni.co.uk> <4C6C6AED.3090008@plouf.fr.eu.org> <4C6C70B6.7050200@abpni.co.uk> <4C6CDC91.6060804@plouf.fr.eu.org> <4C6D7C42.9060409@abpni.co.uk> <4C6D857B.1070906@plouf.fr.eu.org> <4C6D87E3.9080207@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C6D87E3.9080207@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: netfilter@vger.kernel.org

Jonathan Tripathy a =E9crit :
>>>       =20
>>> However, in the /proc/sys/net/ipv4/conf folder, I
>>> don't see my "public" bridge, only the private one. Incidently, the
>>> private one is the only bridge in my system that has an IP address
>>> asigned to it...
>>>     =20
>> Ok. May I ask what is your kernel version ? Older than 2.6.21 ?
>>   =20
> Linux xx.xx.xx.xx 2.6.18-194.8.1.el5xen #1 SMP Thu Jul 1 19:41:05 EDT=
=20
> 2010 x86_64 x86_64 x86_64 GNU/Linux

As I expected. A change occured in 2.6.21, recent kernels automatically
link interfaces to the IP stack.
