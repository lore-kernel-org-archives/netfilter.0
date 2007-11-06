From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Problem with DNAT of UDP packets getting undone
Date: Tue, 06 Nov 2007 15:04:43 -0600
Message-ID: <4730D6EB.9020209@riverviewtech.net>
References: <54395395F049BD4E8C97CC924B45A7A6062E227D@brexc47p> <32559.217.166.60.19.1194368615.squirrel@ma.rtij.nl> <4730B87B.10901@riverviewtech.net> <4730CD6F.7040400@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4730CD6F.7040400@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/06/07 14:24, Pascal Hambourg wrote:
> You may confuse with the restriction from some RFCs stating that 
> 127.0.0.0/8 addresses are reserved for internal host use, i.e. the 
> loopback interface. There is no such restriction for other addresses 
> that may be configured on the loopback interface. Also, the Linux IP 
> stack follows the "weak" model by default, so any unicast address 
> (except 127.0.0.0/8) configured on any interface  can be used for 
> communications on any other interface. So any non-127.0.0.0/8 address 
> configured on the loopback interface can be used for communications on 
> any other interface.

Ok.  I did not know for sure as I have not tried this my self and can't 
say for sure one way or another.

> Nope, NAT has nothing to do with this, and the loopback interface is not 
> involved.

In light of the above, agreed.

> The old stateless NAT in the routing code controlled with iproute2 is 
> considered broken and all references to it were removed from kernel 
> 2.6.9. But a new stateless NAT is coming with the next kernel release 
> 2.6.24.

...

> For now, an ugly workaround may be to use the NOTRACK target in the 
> 'raw' table on the (supposedly) return packets, to skip the connection 
> tracking and the automagic reverse DNAT. I think this will work for DNS 
> over UDP, maybe not so well for TCP.

Yes, "Ugly!".



Grant. . . .
