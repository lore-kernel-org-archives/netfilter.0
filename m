From: Robert L Mathews <lists@tigertech.com>
Subject: Re: conntrack and RSTs received during CLOSE_WAIT
Date: Thu, 21 May 2009 11:07:14 -0700
Message-ID: <4A159852.8080609@tigertech.com>
References: <4A0DE859.7000209@tigertech.com>  <alpine.DEB.2.00.0905162348430.4156@blackhole.kfki.hu>  <4A0F7FEE.3010405@tigertech.com> <4A139222.2020505@tigertech.com>  <alpine.DEB.2.00.0905200904310.10018@blackhole.kfki.hu>  <4A1466F6.8070304@tigertech.com>  <alpine.DEB.2.00.0905202327240.11796@blackhole.kfki.hu> <38db14850905210117u762600abifae41ce448363644@mail.gmail.com> <alpine.DEB.2.00.0905211058160.12567@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.0905211058160.12567@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Jozsef Kadlecsik wrote:

> The TCP sequence numbers *are* tracked and checked - but with the limit of 
> a node being in the middle of the two communicating endpoints. That limit 
> is physical and cannot be discarded.

That said, would it be safe to say that if conntrack has already seen a 
certain sequence number in one direction, then a RST packet with less 
than sequence number + 1 is automatically invalid?

To take my original example, if the client sends a legitimate packet 
with sequence number 421, then sends a following RST packet that also 
has sequence number 421, the RST packet *must* be bogus, and will 
(hopefully) be ignored by the server.

I realize that in practice, when our node-in-the-middle forwards the two 
seq=421 packets to the server, the first ("real") packet could be lost. 
Or perhaps the two packets arrive at the server in the other order. 
Either case will cause the server to see the bogus RST packet before it 
sees the "real" packet, and the server will "incorrectly" accept the 
bogus RST. And I don't see a way for conntrack to detect whether this 
happened.

However, it seems much more likely that the server will "correctly" 
reject the RST. Perhaps conntrack should assume that, instead? It would 
be correct more often, and it's also less harmful if we're wrong: when 
we receive data that violates the TCP standard, it seems better for 
conntrack to decide that a connection is still open when it's not, than 
to decide that a connection is closed when it isn't.

-- 
Robert L Mathews, Tiger Technologies    http://www.tigertech.net/
