From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IPTables Flow Chart
Date: Wed, 10 Mar 2004 19:08:37 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403101908.37569.Antony@Soft-Solutions.co.uk>
References: <404E7C72.3040500@ynsgroup.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <404E7C72.3040500@ynsgroup.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wednesday 10 March 2004 2:24 am, Jim Cliver wrote:

> Hello All,
>
> Attached is a drawing that I thought might be useful to the list, it is
> intended to help visualize the traffic flows on a routing host
> configured with Netfilter.
>
> I have checked it carefully for errors, but can't warrant their
> non-existance.  I welcome comments and suggestions for improving or
> correcting the drawing.

My first comment is that the very centre element of the diagram, labelled 
"Routing Process", suggests that IP_Forwarding needs to be = 1 for packets to 
successfully enter the INPUT chain.   This is not the case - it might be 
better if the red and green lines bypassed this box, and only the blue lines 
(which are the "routed" packets) actually go through it.

I then got slightly confused trying to follow the path of a blue packet; after 
entering the logical interface and passing through PREROUTING, it arrives at 
the routing process, but then appears to have a choice of two FORWARD chains 
(one at the top of the diagram, one at the bottom) through which it could 
pass.   I'm not sure this is a helpful representation of netfilter, as there 
is only one FORWARD chain, and all packets, no matter where they are being 
routed to, go through it.

I appreciate that you have used the dotted outline of these boxes to indicate 
"part of", however I think it would be clearer to show simply a single 
netfilter FORWARD chain, followed by a routing decision which leads to the 
two different interfaces?

Regards,

Antony.

-- 
This email was created using 100% recycled electrons.

                                                     Please reply to the list;
                                                           please don't CC me.


