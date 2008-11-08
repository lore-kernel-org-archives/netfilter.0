From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Altering firewall rules to enable NAT Reflection
Date: Sat, 08 Nov 2008 12:52:42 -0600
Message-ID: <4915DFFA.3050904@riverviewtech.net>
References: <5bdb1aa70811061525h36988a9cr3db531232e4422d5@mail.gmail.com> <49149060.70100@riverviewtech.net> <49157629.2020104@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49157629.2020104@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/8/2008 5:21 AM, Pascal Hambourg wrote:
> And make sure that traffic forwarded from eth1 to eth1 is ACCEPTed in 
> the filter/FORWARD chain.

*nod*

> Note both SNAT and MASQUERADE hide the real source address from the 
> server, which may be annoying for logging or access control purposes. 
> Source NAT is not required to avoid the "routing triangle" if the server 
> itself can route the return traffic to the NAT router. This can be 
> achieved with advanced routing on Linux. Alternatively, the router may 
> use the NETMAP target instead of SNAT or MASQUERADE to do a 1-to-1 
> mapping of the source address range into another range, so the original 
> source address can be retrieved.

Interesting points.

First, I'd make sure to note that I would SNAT / MASQUERADE / <what 
ever> /only/ the traffic from the local LAN (same subnet) and not /all/ 
the traffic that is being DNATed.  So... when the target server receives 
traffic it can know that any traffic coming from the NATing device's IP 
that the traffic is from said NATing device or the local LAN (same 
subnet).  This does not completely negate the negative impact on 
logging, but IMHO it does greatly reduce it.

I had not considered using advanced routing to cause the server to 
direct ""reply traffic to the local LAN by way of the NATing device. 
What / how would you go about doing this?  (I ask because I have not 
thought about it for more than 15 seconds.)  I suppose you could choose 
the alternate routing table based on a combination of the source port(s) 
and the destination IP address of the reply packets.  I.e. if the reply 
is coming from a service that has been DNATed and is going back to the 
local LAN then go ahead and send it by way of the NATing device.



Grant. . . .
