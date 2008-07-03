From: "Elison Niven" <Elison.Niven@Matrixtelesol.com>
Subject: Re : iptables resources consumed
Date: Thu, 3 Jul 2008 19:10:36 +0530
Message-ID: <VPOP31.4.0e.20080703190948.093.30.1.00149acd@matrixindia>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

Hi,

Comments inline.

> Ok... Now it is starting to sound like you want any and all traffic to 
> / from the DSPs to go through the bridge (eth0 & eth2) like normal 
> *except* for traffic to / from the control port.  Now you are wanting to 
>  send the control port traffic somewhere other than though eth0.  Do I 
> have this correct?

I just want to send the control port traffic to a local process on the CPU.

> At first glance this would seem nice.  However I've dealt with software 
> that believes that any traffic coming in on a port is from a specific 
> source and as such there has to be multiple different ports to identify 
> multiple different sources.  Just make sure that you are not dealing 
> with any thing like there here.

Yes, I will surely check this.

> I don't see how the DSP would even know what IP it would need to fake 
> as, much less believe that it would do it. 

This is actually quite simple. The DSP has the ability to fake its source IP
address. The DSP can be configured to output packets with a different source
IP.

> Besides, if it did, it would tend to break the IP routing / NATing that is
being done (same > > subnet on multiple interfaces).

I didn't actually get this. Can you possibly throw some light on this?

I take it that both eth0 and eth2 will be in different subnets. The DSPs
will have their IP addresses in the same subnet as that of eth2.

If the DSP sends packets with a fake source IP - that of eth0, how would it
break the IP routing / NATing being done? The default gateway of the DSPs is
eth2. Because the DSPs send packets to the *outer world addresses*, the
packets reach eth2. The rule on eth2 is to send them as it is out from eth0.

Regarding the DSP control packets: Such packets will be directed to IP =
eth2. All other packets (that are routed out through eth0) will have a
different destination IP. So that should make the rule simpler on eth2.

Best Regards,
Elison


