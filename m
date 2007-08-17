From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: packet replication
Date: Fri, 17 Aug 2007 10:08:16 -0500
Message-ID: <46C5B9E0.2090706@riverviewtech.net>
References: <ab82fd6c0708162214w64bf1b00pabc4e456de734b52@mail.gmail.com>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <ab82fd6c0708162214w64bf1b00pabc4e456de734b52@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 08/17/07 00:14, Ben Carbery wrote:
> However I have multiple servers that want to receive the same (udp) 
> traffic stream. This is partly to achieve redundancy, partly because 
> there are limitation in how many destinations can be set on the 
> device sending the traffic.

(See below.)

> SO, iptables can handle the forwarding and NAT, but can I forward a 
> udp stream to more than one device?

To my knowledge, IPTables its self does not have this capability.

> Secondly - and this is a big ask but I am mainly looking for ideas 
> about how I might achieve this - I would like the status or 
> reachability of the end device to be tracked by the packet forwarder, 
> such that if the device becomes unreachable the traffic is disk 
> cached on the gateway until it becomes reachable again, or storage 
> limits are reached.

(See below.)

> Is there an application/feature/tool that can handle this?

Not per say, at least not as far as I'm aware of.  There is nothing that
I'm aware of that will duplicate traffic to multiple destinations like
you are wanting to nor is there any thing that will queue your traffic
in the event that the endpoint can not be reached.

However there are a couple of different options you may want to
investigate.  Namely, the ULOG target and the method that allows you to
send packets from kernel space to user space (and then back if so
desired) to decide how to process the packets.  The intent being to
intercept packets in their path, hand them off to a user space process
that will do the duplication and queuing that you are talking about.  If
it were me, I'd queue everything and then have another process that
empties the queue by transferring the traffic to your end point
system(s).  This will make the process that diverts the traffic simpler.

Have the kernel divert the traffic, have a user space process log the
traffic, have one or more user space processes send the traffic to an
end point, have a final user space process remove the previously
transmitted traffic from the queue.  This type of structure will allow
you to send the traffic to as many places as you would like also with
out the concern of the kernel or the logging process having to know any
thing about the end points.  This system would be very modular and
probably fairly scalable.  The only potential problem that I see is that
as stated above, is that if there are multiple end points over the same
WAN link you may end up transferring the same data across the WAN link
multiple times.  However if the logging process speaks the same (to be
defined) protocol as the sending process you could in theory put another
logging process at the remote end and transfer the data one time from
one log to another log and then duplicate it from there.  Hence saleability.

> Would appreciate any info or pointers in the right direction.

If you would like to discuss details drop me a line.



Grant. . . .

