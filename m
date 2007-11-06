From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Problem with DNAT of UDP packets getting undone
Date: Tue, 06 Nov 2007 12:54:51 -0600
Message-ID: <4730B87B.10901@riverviewtech.net>
References: <54395395F049BD4E8C97CC924B45A7A6062E227D@brexc47p> <32559.217.166.60.19.1194368615.squirrel@ma.rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <32559.217.166.60.19.1194368615.squirrel@ma.rtij.nl>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/06/07 11:03, Martijn Lievaart wrote:
> This is expected. A nat mapping is set up on the first packet of a 
> "connection" and a reverse NAT is done automagically on all return 
> packets. Exactly what you are seeing.

I'll agree to the NATing part.  However the fact that the OP is 
successfully using the loopback interface surprises me.  It was my 
(mis)understanding that the loopback interface was holly and would not 
talk to traffic that did not originate or terminate on the loopback 
interface as well.  Or is the a side effect that the NATing code is 
sending the traffic out the loopback interface destined to the loopback 
interface as well, thus NATing is bridging the security barrier?  I am 
almost positive that the same could not be done with routing.

> This cannot easily be solved with current Linux kernels. Current 
> kernels only do connection oriented NAT. You could insert a Cisco 
> device or something similar to do the kind of NAT you require.

Would it be possible to use stateless NATing via IP Route 2 rather than 
IPTables to achieve this?

> But......, the loadbalancer does DNAT, so it shoud do the 
> corresponding SNAT on the return packets. If it does not do this, it 
> is seriously broken, imnsho.

Remember that the OP said "... The DNS servers are supposed to send 
their responses directly to the client via an internet connection that 
is not behind the load balancer. ...".  Thus the reply traffic is not 
passing back out through the load balancer and as such the load balancer 
never sees the traffic to undo the NATing in place.

My recommendation to the OP is to set up the LVS in 'Direct Routing' 
mode with the VIP bound to an additional non-ARPing interface other than 
the loopback interface on all the real nodes.  This way the LVS 
Director(s) will initially receive the traffic to the VIP and then 
re-route the traffic on to the real server node.  The real server node 
will then receive the traffic destined to the VIP with the DNS server 
running on it.  This way all the traffic is really to and from the VIP 
address(s).  This scenario will allow the real server(s) to use a 
different route for the returning traffic than the original traffic used.



Grant. . . .
