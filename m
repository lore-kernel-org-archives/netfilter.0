From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: newbie: forward rule to itself
Date: Wed, 27 Oct 2010 22:00:52 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010272157440.23548@obet.zrqbmnf.qr>
References: <4CC8774C.1070908@gmail.com> <alpine.LNX.2.01.1010272116580.19157@obet.zrqbmnf.qr> <4CC881D8.3060408@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CC881D8.3060408@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauricio Tavares <raubvogel@gmail.com>
Cc: netfilter@vger.kernel.org


On Wednesday 2010-10-27 21:47, Mauricio Tavares wrote:
>>>
>>> I have the following rules to forward port 6969 coming on eth0 on server1 to
>>> port 6969 on server2's eth0:
>>>
>>> iptables -A PREROUTING -t nat -p tcp --dport 6969 -j DNAT --to
>>> 192.168.1.server2:6969
>>> iptables -A INPUT -d 192.168.4.server1 -p tcp -m tcp -m state --state NEW
>>> --dport 6969 -j ACCEPT
>>> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>>
>> That prerouting only applies to packets coming from devices connected to
>> the machine.
>
> 	How would the prerouting that applies to packets coming from the
>machine itself look like?

Mean to say it without "that". The entire PREROUTING chain won't be considered
for nat.
Usually, you just directly connect to the proper address preferably
ith a DNS name if available. Alternate and rather redundant 
communication ways are rinetd.

