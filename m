From: Eric Bauman <baumane@livejournal.dk>
Subject: Re: Problem with rdate and iptables
Date: Mon, 26 Apr 2010 23:02:56 +1000
Message-ID: <4BD58F00.5090102@livejournal.dk>
References: <hqstu1$7hm$1@dough.gmane.org> <4BD42D81.1000501@plouf.fr.eu.org> <4BD562D8.9080408@livejournal.dk> <4BD578E0.4040606@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BD578E0.4040606@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 26/04/2010 21:28, Pascal Hambourg wrote:

> Could you capture the time query and reply packets (port 37) with a
> packet sniffer such as tcpdump or wireshark ?

Yes, I just tried that, and I think it shows the problem. It turns out 
that a TIME request is being made to IP A, but the response is coming 
from IP B! So I'm not surprised iptables isn't matching it as 
established or related.

That leads me to ask, who is in the wrong? Should iptables be matching 
the response, should the TIME server be responding with the address from 
which it receives a query, or is it my fault for not knowing that a 
request/response IP mismatch is legal behaviour and crafting an 
appropriate rule?

Cheers,
Eric

