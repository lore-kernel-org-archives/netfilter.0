From: Thomas Creutz <thomas.creutz@gmx.de>
Subject: Re: multi-wan with conn-mark
Date: Tue, 20 Jan 2009 08:44:20 +0100
Message-ID: <497580D4.7000003@gmx.de>
References: <4974AE30.2000008@gmx.de> <4974F82F.4040309@standarduniversal.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4974F82F.4040309@standarduniversal.com.au>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Brian Austin - Standardknit <brian@standarduniversal.com.au>

Hello Brian

Brian Austin - Standardknit schrieb:
> see if this helps..
> 
> http://versa.net.au/index.php?option=com_content&task=view&id=21&Itemid=34
> 
thanks for your link :-)

the main problem for me is, that most howto's use external dsl-routers. 
But a main different think i see on this howto is, that the author make 
on some more points connmarks :-/ all other howto's i found make them 
only in the PREROUTING and POSTROUTING chains.

other question to this topic: when i switch to SNAT for the default 
gateway, have i also so connmark and SNAT the other routers in the local 
area network? i dont think so, while i dont need NAT on the lan.

But when I look over some snippets I see some think like this

http://209.85.129.132/search?q=cache:3hmyGB8Jr5QJ:www.thaiadmin.org/board/index.php%3Ftopic%3D84571.0+iptables+%2B%22conn-mark%22+SNAT+port+forwarding&hl=de&ct=clnk&cd=16&gl=de&client=firefox-a
http://www.workman-engineering.com/Files/S35firewall

Thomas

