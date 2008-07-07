From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: iptables resources consumed
Date: Mon, 07 Jul 2008 10:04:32 -0500
Message-ID: <48723080.6070302@riverviewtech.net>
References: <VPOP31.4.0e.20080707110152.031.c.1.00149acd@matrixindia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <VPOP31.4.0e.20080707110152.031.c.1.00149acd@matrixindia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 07/07/08 00:32, Elison Niven wrote:
> Hi,

Morning.

> My main application will know these IP addresses and port numbers 
> through the negotiation. Once the negotiation is done actual RTP data 
> will flow to and from the DSPs and this data has to sent from eth0 to 
> eth2 and from eth2 to eth0.

Ok...

> After the negotiation, my main application (in C) will do a simple 
> system call like
> 
> system("iptables [OPTIONS] ...");
> 
> to add a rule for packets received on eth0 and on which DSP to 
> forward them to.

Ah.  So you do not want to put these rules (that we have been 
discussing) in a system start up script / iptables-save file.  This 
makes things a bit more interesting in the long run.  (See below.)

> After the call is over, my main application will do another call to 
> iptables to remove the above added rule.

Having IPTables rules programmatically removed can be a bit tricky in 
such as having your code know what rule to remove from the list of 
rules.  I suggest that you either use sub-chains and have your code 
flush flush the sub-chain(s), or use the "comment" extension to tag the 
rules, or attempt to pass the exact rule to iptables again to have it 
delete the rule(s) in question.  I personally find the sub-chain to be 
more consistent and less error prone.

Also, you may want to search the archives about having C programs use 
API calls to modify the IPTables chains.

> No, packets that the DSPs send are not to be prevented from going out 
> on eth0.

Ok.



Grant. . . .
