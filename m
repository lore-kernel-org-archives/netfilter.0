From: "Elison Niven" <Elison.Niven@Matrixtelesol.com>
Subject: Re: iptables resources consumed
Date: Mon, 7 Jul 2008 11:02:53 +0530
Message-ID: <VPOP31.4.0e.20080707110152.031.c.1.00149acd@matrixindia>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: netfilter@vger.kernel.org

Hi,

> Uh, this could make for a bit of fun.  It is trivial to write an 
> IPTables rule to match based on static source / destination IP and / or 
> source / destination port or any combination there of.  However to match 
> the dynamic ports, you will need may need a helper to find what is 
> negotiated.

My main application will know these IP addresses and port numbers through
the negotiation. Once the negotiation is done actual RTP data will flow to
and from the DSPs and this data has to sent from eth0 to eth2 and from eth2
to eth0.

After the negotiation, my main application (in C) will do a simple system
call like

system("iptables [OPTIONS] ...");

to add a rule for packets received on eth0 and on which DSP to forward them
to.

After the call is over, my main application will do another call to iptables
to remove the above added rule.

> Question:  Is filtering out packets from the DSPs other than what you 
> have mentioned a must or is it ok if packets leak out.  In other words, 
> do they have to be filtered (prevent them from going) out as long as the 
> RTP packets go where they are suppose to go?

No, packets that the DSPs send are not to be prevented from going out on
eth0.

Best Regards,
Elison


