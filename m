From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: iptables resources consumed
Date: Mon, 07 Jul 2008 10:49:36 -0500
Message-ID: <48723B10.5010806@riverviewtech.net>
References: <VPOP31.4.0e.20080704105216.765.b.1.00149acd@matrixindia>	<486DC28B.2080303@riverviewtech.net>	<VPOP31.4.0e.20080704144214.906.2.1.00149acd@matrixindia>	<487007F0.8080704@riverviewtech.net> <VPOP31.4.0e.20080707110152.031.c.1.00149acd@matrixindia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <VPOP31.4.0e.20080707110152.031.c.1.00149acd@matrixindia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 07/07/08 00:32, Elison Niven wrote:
> My main application will know these IP addresses and port numbers 
> through the negotiation. Once the negotiation is done actual RTP data 
> will flow to and from the DSPs and this data has to sent from eth0 to 
> eth2 and from eth2 to eth0.

Ok.  So let's think about this with the forwarding of RTP packets 
prohibited (DROPed) until your application allows (sets up DNATing) of 
the packets.  What will happen, how will things respond, if the first 
(few?) RTP packets get dropped / rejected before the DNATing is enabled?

Presuming that the possibility of the first (few) RTP packets being 
dropped is ok, I would do the following:
  - All only the inbound traffic that you want (SSH, HTTP, NTP, etc.).
  - Block all inbound to be processed traffic by default.
  - Block all inbound to be forwarded traffic by default.
  - Block all outbound to be forwarded traffic by default.
  - Have your control program dynamically update the NATing rules to 
forward traffic you want.
  - Have your control program dynamically update the forwarding rules to 
allow the NATed traffic to be forwarded.

> After the call is over, my main application will do another call to 
> iptables to remove the above added rule.

*nod*

> No, packets that the DSPs send are not to be prevented from going out 
> on eth0.

Ok.

This sounds like it will be much easier to set things up to block (DROP) 
all forwarded traffic by default and set up exceptions for what you do 
want forwarded and / or allow inbound for (local) processing.

iptables -t filter -P INPUT DROP
iptables -t filter -A INPUT -i eth2 -j ACCEPT
iptables -t filter -A INPUT -i eth0 -p tcp --dport 22 -j ACCEPT
iptables -t filter -A INPUT -i eth0 -p tcp --dport 80 -j ACCEPT
...

iptables -t filter -P FORWARD DROP
iptables -t filter -A FORWARD -i eth0 -o eth2 -d <DSP1> -p udp --dport 
8000 -j ACCEPT
iptables -t filter -A FORWARD -i eth2 -o eth0 -p udp --sport 8000 -j ACCEPT
...

iptables -t nat -A PREROUTING -i eth0 -d <eth0 IP> -p udp --dport 8000 
-j DNAT --to-destination <DSP1>
...

Something to consider.  With your control program dynamically adjusting 
the rules, you may not need to monitor packet state.  So if you can set 
up NATing with out connection tracking, you will have less load on your 
kernel.  However I don't know if you can do NATing with out connection 
tracking being in the kernel as I always have needed connection 
tracking.  If you do have to have connection tracking, you may be able 
to use the RAW table and it's NOTRACK target to avoid the connection 
tracking overhead.  Some experimentation will say for sure.  Or, perhaps 
someone else will help clarify this.



Grant. . . .
