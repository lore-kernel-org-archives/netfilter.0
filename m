From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: iptables resources consumed
Date: Thu, 03 Jul 2008 04:34:33 -0500
Message-ID: <486C9D29.804@riverviewtech.net>
References: <VPOP31.4.0e.20080703103819.796.18.1.00149acd@matrixindia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <VPOP31.4.0e.20080703103819.796.18.1.00149acd@matrixindia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 7/3/2008 12:09 AM, Elison Niven wrote:
> Grant - Thanks a lot for your reply.

You are welcome.

> I would just like to discard them.

Ok.  Then a default of DROP (somewhere) will probably suffice.

> Yes, I would be using a custom built kernel for PowerPc. It is now 
> clear that I will have a maximum of 256 (may be 256*2 or 3 !) rules 
> on eth0 and just 1 rule on eth2.

Um, there is a big difference in 256, 512, and 768 rules.  IMHO, even if 
it is 256, you still want to do some optimization to reduce the number 
of rule checks that are needed.

> To make things complex, the PowerPc communicates with the DSPs 
> through ethernet on eth2. Each DSP has a control Port number and the 
> PowerPc controls the DSPs through packets sent at this port number on 
> the DSP. The DSPs respond to these commands through ethernet packets 
> (that are received on eth2).
> 
> Such packets need to be sent to a process on the PowerPc and not 
> forwarded out on eth0.

Ok... Now it is starting to sound like you want any and all traffic to 
/ from the DSPs to go through the bridge (eth0 & eth2) like normal 
*except* for traffic to / from the control port.  Now you are wanting to 
  send the control port traffic somewhere other than though eth0.  Do I 
have this correct?

> The rule on eth2 will be :  If source port of the packet is not a DSP 
> control Port Number , send the packet out from eth0 and replace 
> source IP with ip = eth0.

Ok... The last part about the source IP can easily be handled by a 
simple MASQUERADE / SNAT rule on eth0.  The redirection may be a bit 
more interesting.

> If all the DSPs have different control port numbers that would 
> increase the checking - Source IP and Source Port per packet, So I 
> prefer to have the same control port numbers on all the DSPs.

At first glance this would seem nice.  However I've dealt with software 
that believes that any traffic coming in on a port is from a specific 
source and as such there has to be multiple different ports to identify 
multiple different sources.  Just make sure that you are not dealing 
with any thing like there here.

> Now If the DSP itself *fakes* the source IP of the packets it 
> generates, then may be the rule can be simpler : Check the source 
> port of the packet. If it is not equal to the control port number 
> just send it out *as it is* from eth0. If source port is equal to the 
> control port number, send it to a local process.

I don't see how the DSP would even know what IP it would need to fake 
as, much less believe that it would do it.  Besides, if it did, it would 
tend to break the IP routing / NATing that is being done (same subnet on 
multiple interfaces).

> Yeah, the mere thought of it puts me in panic! I do not have any 
> prior experience with iptables. As from your experience, Do you a 
> think a custom powerc kernel running at 400 MHx, 256 MB DDR2 RAM 
> should be able to perform this task well.

Sorry.  I have no idea on the performance metrics.  The only thing I 
have a (4+ year old) clue on is connection state and the conntrack 
table.  I don't even know how much of a problem that will be for you. 
If this is a problem, it may be a rather large one as there is a 
specific amount of memory that is needed per connection state.  I guess 
it will depend if each packet every 20 ms is considered a new connection 
or not.

Like G.W. Haywood said, test it (or some smaller test) and see.

> Best Regards,

Likewise.



Grant. . . .
