From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: re : iptables resources consumed
Date: Sat, 05 Jul 2008 18:46:56 -0500
Message-ID: <487007F0.8080704@riverviewtech.net>
References: <VPOP31.4.0e.20080704105216.765.b.1.00149acd@matrixindia>	<486DC28B.2080303@riverviewtech.net> <VPOP31.4.0e.20080704144214.906.2.1.00149acd@matrixindia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <VPOP31.4.0e.20080704144214.906.2.1.00149acd@matrixindia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 7/4/2008 4:12 AM, Elison Niven wrote:
> Well, this is not a problem at all. The source IP that the DSP puts 
> in the *RTP packets* it generates can be changed dynamically at 
> runtime. And it can be different for different RTP sessions as well, 
> not that I would need to do it. That apart, this is allowed only for 
> *RTP packets* (this traffic has to forwarded out from eth0). All 
> other packets (the only ones that remain are the DSP control packets 
> directed towards my system) use the source IP as the actual DSP IP 
> address.

Ok.  The, I suppose you can spoof the source IP if you want to.

> Ok, but all the packets that I need to send to the DSPs will reach my 
> system and will have destination IP belonging to my system. They are 
> not needed to be processed by my system but are to be sent to the 
> DSPs. How do I do that?

Right, this is why you DNAT them to the DSPs inside.

> Well, actually this list is dynamic and can change at runtime. The 
> actual port numbers and IP addresses depend on the SIP/SDP 
> negotiation.

Uh, this could make for a bit of fun.  It is trivial to write an 
IPTables rule to match based on static source / destination IP and / or 
source / destination port or any combination there of.  However to match 
the dynamic ports, you will need may need a helper to find what is 
negotiated.

Question:  Is filtering out packets from the DSPs other than what you 
have mentioned a must or is it ok if packets leak out.  In other words, 
do they have to be filtered (prevent them from going) out as long as the 
RTP packets go where they are suppose to go?

> Thanks a lot for helping me out.

*nod*  You are welcome.



Grant. . . .
