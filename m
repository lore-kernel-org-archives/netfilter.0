From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: too many INVALID packets
Date: Thu, 19 Jun 2008 12:54:13 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0806191253360.14231@fbirervta.pbzchgretzou.qr>
References: <200806181415.00808.vladislav.kurz@webstep.net> <Pine.LNX.4.64.0806181446100.10175@blackhole.kfki.hu> <200806191231.56317.vladislav.kurz@webstep.net> <alpine.LNX.1.10.0806191249310.14231@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0806191249310.14231@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladislav Kurz <vladislav.kurz@webstep.net>
Cc: netfilter@vger.kernel.org


On Thursday 2008-06-19 12:50, Jan Engelhardt wrote:
>>>
>>> Yes, it's a (well known) feature of netfilter. This way we can catch up
>>> connections already established. If you do not want to support it, use
>>> the last rule you wrote.
>>
>>I thought it might be useful to block some weird portscans (e.g. nmap xmas 
>>scan).
>
>Xmas scans can be matched much more easily - using INVALID, see
>http://jengelh.medozas.de/projects/chaostables/
Correction, http://jengelh.medozas.de/documents/Chaostables.pdf
chapter 2.
