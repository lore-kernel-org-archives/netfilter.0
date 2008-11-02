From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Weird NAT problem
Date: Sun, 02 Nov 2008 12:50:28 -0600
Message-ID: <490DF674.5020705@riverviewtech.net>
References: <200811012307.18305.bero@linux.cd> <490CDCC2.3070202@riverviewtech.net> <490CDDA9.90200@riverviewtech.net> <490D8A25.6020506@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <490D8A25.6020506@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/2/2008 5:08 AM, Pascal Hambourg wrote:
> Or with the ICMP error not being generated at all, because of the MTU 
> mismatch not occuring at an IP device. This is quite common with a DSL 
> modem acting as transparent bridge : as it works only at the link layer, 
> when it receives a PPPoE frame bigger than 1500 bytes from the ISP, it 
> cannot either forward it on the ethernet link, fragment it or send an 
> ICMP error.

Interesting point.  I had not considered a layer 2 device having to do 
some ""conversion and it not being able to.  This just further 
exasperates the problem.

> The ISP routers should be responsible for doing the fragmentation and 
> sending ICMP errors. But unfortunately they don't always do it. 
> Sometimes the ISP don't even know the customer uses PPPoE, for example 
> when it uses a third-party DSL carrier which deals with the PPPoX stuff 
> and delivers user sessions to the ISP in L2TP tunnels.

Do you ever wonder where the out sourcing will stop?  It seems like 
despite the best intentions of outsourcing, problems always seem to come up.

> Be aware that this workaround only works for TCP, not for other IP 
> protocols such as UDP, ICMP (big pings), GRE, IPSec (AH, ESP), IPIP, 
> 6in4...

Very good points.  /Fortunately/ I've not run in to them yet but I can 
see how it would certainly be possible.



Grant. . . .
