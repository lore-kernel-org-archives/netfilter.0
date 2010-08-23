From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Forced lladdr change with bridge - or not?
Date: Mon, 23 Aug 2010 13:23:45 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1008231323080.17348@obet.zrqbmnf.qr>
References: <alpine.LSU.2.01.1008221812200.22261@obet.zrqbmnf.qr> <4C715667.9070008@pandora.be> <alpine.LSU.2.01.1008221927430.3855@obet.zrqbmnf.qr> <4C718E30.1090908@plouf.fr.eu.org> <alpine.LSU.2.01.1008222321290.21206@obet.zrqbmnf.qr>
 <4C722F84.1080606@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C722F84.1080606@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: Bart De Schuymer <bdschuym@pandora.be>, netfilter@vger.kernel.org


On Monday 2010-08-23 10:21, Pascal Hambourg wrote:
>> On Sunday 2010-08-22 22:53, Pascal Hambourg wrote:
>>>>  
>>>>> I don't understand your question,
>>> Me neither : according to your output, the MAC address of neither port
>>> has changed.
>> 
>> Well.. rerun `ip a` before enslaving tap to br and you see.
>
>Sorry to insist heavily, but I still don't get your point.
>
>> Is this behavior normal that the lladdrs of all but the first brport
>> remain unchanged? If so, what is the purpose of changing the lladdr on the
>> first brport?
>
>from which I understand that tap1's MAC address changed when it was
>added to the bridge.

Yes, because br0 apparently had a lower lladdr than tap1.
Let it rest now.
