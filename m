From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Re : iptables resources consumed
Date: Thu, 03 Jul 2008 13:05:24 -0500
Message-ID: <486D14E4.5070408@riverviewtech.net>
References: <VPOP31.4.0e.20080703190948.093.30.1.00149acd@matrixindia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <VPOP31.4.0e.20080703190948.093.30.1.00149acd@matrixindia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 7/3/2008 8:40 AM, Elison Niven wrote:
> I just want to send the control port traffic to a local process on 
> the CPU.

Ok, that's a simple "REDIRECT" target.  Redirect effectively takes any 
traffic coming in (through) and interface and changes the destination IP 
to be that of the interface that the packet came in on.

> Yes, I will surely check this.

*nod*

> This is actually quite simple. The DSP has the ability to fake its 
> source IP address. The DSP can be configured to output packets with a 
> different source IP.

Ok...  Is this spoofing for all traffic or just for specific traffic?  I 
can see how this could severally effect things.

> I didn't actually get this. Can you possibly throw some light on 
> this?

If you have a router connected to two different networks with the same 
subnet (i.e. 192.168.1.0/24) on both interfaces and IPs assigned to them 
the kernel will get confused because it can not differentiate which 
interface it is suppose to use when it is told to connect (or send 
traffic to) a given address.  In short, you are left with a question of 
"which interface is suppose to be used".

So, if the DSP spoofs the the IP on eth0, then things are no longer 
standard routing and you have to allow for it.  I *strongly* recommend 
that you not have the same subnet on multiple different (not connected) 
interfaces unless you are bridging.  It /can/ be done, but it makes 
things much more complicated.

> I take it that both eth0 and eth2 will be in different subnets. The 
> DSPs will have their IP addresses in the same subnet as that of eth2.

This is what I expected.

> If the DSP sends packets with a fake source IP - that of eth0, how 
> would it break the IP routing / NATing being done? The default 
> gateway of the DSPs is eth2. Because the DSPs send packets to the 
> *outer world addresses*, the packets reach eth2. The rule on eth2 is 
> to send them as it is out from eth0.

I'm concerned about traffic coming in eth0 going to the DSP connected to 
eth2.  What IP do you send it to, the one being spoofed or the internal 
one?  When the client send this traffic, will the reply come from the 
same IP or will it be a different IP?  I see too much that could go 
wrong in this that should not happen in normal traffic.

*OR* is the IP spoofing not for the source IP of the packets leaving the 
DSP but rather for an IP that is included as a value with in the payload 
in the packet from the DSP, much like FTP packets include the port 
number that they want to use or how you sometimes have to specify an 
external IP for SIP VoIP devices behind a NAT.

> Regarding the DSP control packets: Such packets will be directed to 
> IP = eth2. All other packets (that are routed out through eth0) will 
> have a different destination IP. So that should make the rule simpler 
> on eth2.

Ok, what is the difference in the "control packet(s)" and "all other 
packets that do not match the rules" (from my question last time that 
you just answered)?



Grant. . . .
