From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Problem with rdate and iptables
Date: Mon, 26 Apr 2010 15:06:44 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1004261505330.9302@obet.zrqbmnf.qr>
References: <hqstu1$7hm$1@dough.gmane.org> <4BD42D81.1000501@plouf.fr.eu.org> <4BD562D8.9080408@livejournal.dk> <4BD578E0.4040606@plouf.fr.eu.org> <4BD58F00.5090102@livejournal.dk>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BD58F00.5090102@livejournal.dk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Bauman <baumane@livejournal.dk>
Cc: netfilter@vger.kernel.org

On Monday 2010-04-26 15:02, Eric Bauman wrote:
> On 26/04/2010 21:28, Pascal Hambourg wrote:
>> Could you capture the time query and reply packets (port 37) with a
>> packet sniffer such as tcpdump or wireshark ?
>
> Yes, I just tried that, and I think it shows the problem. It turns out that a
> TIME request is being made to IP A, but the response is coming from IP B! So
> I'm not surprised iptables isn't matching it as established or related.
>
> That leads me to ask, who is in the wrong? Should iptables be matching the
> response, should the TIME server be responding with the address from which it
> receives a query, or is it my fault for not knowing that a request/response IP
> mismatch is legal behaviour and crafting an appropriate rule?

RFC 868 does not specify any addresses for UDP. I guess someone 
exploited that in a bogus implementation already ...

Use NTP instead? :-)
