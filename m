From: "Elison Niven" <elison.niven@matrixtelesol.com>
Subject: re : iptables resources consumed
Date: Fri, 4 Jul 2008 14:42:03 +0530
Message-ID: <VPOP31.4.0e.20080704144214.906.2.1.00149acd@matrixindia>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

Hi,

Comments inline.

> You can do the source IP spoofing here, but I would not recommend it for 
> multiple reasons.
>   - You will have to (re)configure all the DSPs with the IP of eth0 if 
> it ever changes.
>   - This could conflict with reverse path filtering on your system.
>   - IMHO this is bad form.
>   - If the DSP wants to communicate with your system it will have to use 
> a different source IP, or other trickery will have to be done to allow 
> your system to communicate with the DSP.
>   - SNATing is not going to be that much of a load.

Well, this is not a problem at all. The source IP that the DSP puts in the
*RTP packets* it generates can be changed dynamically at runtime. And it can
be different for different RTP sessions as well, not that I would need to do
it. That apart, this is allowed only for *RTP packets* (this traffic has to
forwarded out from eth0). All other packets (the only ones that remain are
the DSP control packets directed towards my system) use the source IP as the
actual DSP IP address.

> This is not a rule.  This is standard routing / forwarding.  If a packet 
> coming in to an interface has a destination IP belonging to the system, 
> it will be processed by the system.  If a packet coming in to an 
> interface has a destination that does not belong to the system it will 
> be forwarded as long as forwarding is enabled.

Ok, but all the packets that I need to send to the DSPs will reach my system
and will have destination IP belonging to my system. They are not needed to
be processed by my system but are to be sent to the DSPs. How do I do that?

> Can you provide a list of source / destination IPs and ports or a 
> pattern there of?  I'll look at it and see how many rules I think would 
> be needed (with and with out the optimizations that I spoke of).

Well, actually this list is dynamic and can change at runtime. The actual
port numbers and IP addresses depend on the SIP/SDP negotiation.

Thanks a lot for helping me out.

Best regards,
Elison


