From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: iptables resources consumed
Date: Wed, 02 Jul 2008 14:00:00 -0500
Message-ID: <486BD030.8090908@riverviewtech.net>
References: <VPOP31.4.0e.20080702095953.250.a.1.00149acd@matrixindia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <VPOP31.4.0e.20080702095953.250.a.1.00149acd@matrixindia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 07/01/08 23:29, Elison.Niven@matrixtelesol.com wrote:
> I need to forward UDP packets received on eth0 to eth2 and send them 
> to a particular DSP, and also forward packets received on eth2 to 
> eth0.

That in and of its self should not be a problem.

Question:  Do you either want or need globally routable IPs on the DSPs, 
or would you prefer to have private IPs?

I ask because at this point, you can either use IPTables / NATing / 
routing or you could use EBTables and bridging to do what you are 
wanting to do.

> General rule: All outgoing packets from eth0 should have src ip = 
> eth0 ip.

Ok.  This is the first implication that you will be using different IPs 
internally and want everything externally to be seen as one IP.  This 
indicates that you will probably be using internal IPs and IPTables.

> Example rules:
> 
> Rule 1:
> 
> a) Packets received on eth0 with src IP address = X, dest port = 8000 
> should be sent to DSP1, port = 8000.
> 
> b) Packets received on eth2 (i.e from the L2switch) with src IP = DSP1 
> IP OR dest IP = X, dest port = 10000 should be sent on eth0 to IP 
> address X, port = 10000.
> 
> Rule 2:
> 
> a) Packets received on eth0 with src IP address = Y, dest port = 9000 
> should be sent to DSP2, port = 9000.
> 
> b) Packets received on eth2 (i.e from the L2switch) with src ip = DSP2 
> IP OR dest IP = Y, dest port = 11000 should be sent on eth0 to IP 
> address Y, port = 11000.

Ok.

> I will have a maximum of 256 such rules i.e effectively 256*2 = 512 
> rules. (256 for packets received on eth0, 256 for packets received on 
> eth2)

Eh, yes and no.  You really have three rules per "Rule <#>:" above.

  - Packets coming in eth0 with a source IP of X with a destination port 
of 8000 should be sent to destination IP of DSP1 and destination port 8000.
  - Packets coming in eth2 with a source IP of DSP1 with a destination 
port of 10000 should be sent with a source IP of eth0 and a destination 
port of 10000.
  - Packets coming in eth2 with a destination IP of X with a destination 
port of 10000 should be sent with a source IP of eth0 and a destination 
port of 10000.

The "OR" really makes two rules for "b)".  So you will have apparently 
256 sets of these 3 rules for at minimum a total of 768 rules.  I think 
some careful planning needs to be done when creating your rule set(s). I 
think I'd start with a simple structure like this:

Put the following rules in your PREROUTING chain.
  - If the packet is coming in eth0 go to a subchain "in_eth0".
  - If the packet is coming in eth2 go to a subchain "in_eth2".

Put the following rules in your "in_eth0" chain.
  - If source IP is X and the destination port is 8000 go to a subchain 
"in_DSP1".
  - If source IP is Y and the destination port is 9000 go to a subchain 
"in_DSP2".
  - etc.
    (There is room for a tree structure to optimize the number of rules 
that have to be tested before a match is found.)

Put the following rules in your "in_eth2" chain.
  - If source IP is DSP1 and the destination port is 10000 go to a 
subchain of "out_DSP1".
  - If destination IP is X and the destination port is 10000 go to a 
subchain of "out_DSP1".
  - If source IP is DSP2 and the destination port is 11000 go to a 
subchain of "out_DSP2".
  - If destination IP is X and the destination port is 11000 go to a 
subchain of "out_DSP2".
    (There is room for a tree structure to optimize the number of rules 
that have to be tested before a match is found.)

Put the following rule in your "in_DSP1" chain.
  - DNAT to destination IP of DSP1 and destination port 8000.

Put the following rule in your "in_DSP2" chain.
  - DNAT to the destination IP of DSP2 and the destination port 9000.

Put the following rule in your "out_DSP1" chain.
  - SNAT to the source IP of eth0 with a destination port of 10000.

Put the following rule in your "out_DSP2" chain.
  - SNAT to the source IP of eth0 with a destination port of 11000.

This is a fairly loose and expandable structure.  I'm jumping to sub 
chains where arguable I could put the two chains together.  I could do 
the NATing (that is being done in "in_DSP1") in the "in_eth0" chain. 
However if you want to add an "OR" condition, you would have duplication 
in the "in_eth0" chain.  So I'm leaving room to grow with out having to 
duplicate.  Besides, this is also more consistent with what is being 
done in "in_eth2" having multiple rules jumping to the "out_DSP<#>" chains.

The main performance problem that I see is the "in_eth0" and "in_eth2" 
chains will be sizable and have quite a few rules in them.  I think this 
could possibly be broken down in to sub-chains to reduce the maximum 
number of rules that have to be checked before finding one that matches.

This method may seem like it is a lot more complex than hundreds or 
thousands of rules in a single chain, but it will seriously reduce the 
number of check that the kernel has to perform on each and every packet. 
  Think about how many rules the kernel would have to process in worst 
case for the packets that are the last to be matched.  This is where 
this optimization comes in to play.  In a way this could be sort of like 
trying to create a balanced tree structure for the rules, something that 
databases and file systems try to do to make it easy (read: faster) to 
find files.

Question:  What do you want to do with packets that do not match the 
above rules?

> I am assuming that a packet is received every 20 ms on eth0 and eth2 
> for a single rule.

So minimizing the number of rules that have to be checked against will 
dramatically help the performance of the system.

I take it that all DSPs will (normally) have a packet every 20 ms, so 
there is no re-arranging the rules in a given chain to move the most 
frequently matched to the start of the chain.

> So for a total of 256, 256 packets are received every 20 ms on eth0 
> and 256 packets are received every 20 ms on eth2.

*nod*

There will be a lot of traffic flying through this kernel.

> Or I can make eth2 IP address as the default gateway of all the DSPs. 
> The DSPs will send packets with dest IP address = X, Y etc. These 
> packets should be sent out through eth0 and should have source IP = 
> eth0. This will eliminate rules 1b and 2b above. Thus, packet 
> filtering to read src IP and dest port will only be on eth0. Now 
> total rules will be 256.

As long as you are sending the packets back out to the world with the 
proper source and / or destination port, yes, you could reduce your 
number of rules (by not having rules to match outgoing packets).  You 
will still need to SNAT / MASQUERADE the traffic, but that can be a 
single rule.

> The processor will be running at 400 MHz, 256 MB DDR2 RAM using Linux 
> kernel 2.6.10.

Ok...  I've never worked with a RISC based processor on a firewall, 
theoretically it will perform better than a CISC.  However you need to 
make sure that things are compiled for the level of processor you are 
using.  Do *NOT* use a generic kernel for any PowerPC.  Make sure you 
compile one for *your* PowerPC so that you are taking advantage of all 
the optimizations that it can provide.

> Will it be able to do this task and also run the main application? 
> How much resources will iptables require?

Comparing 256 packets against 256 rules every is 65536 comparisons every 
20 ms.  I don't know how much CPU time that will take, but I can see how 
there is a possibility of a problem.  Using a tree I can guarantee the 
worse case scenario to match 1 of 256 possibilities with in 16 
comparisons (best case is 4, worst case is 16).  This will be *much* 
easier on a processor than having to match worse case 256 rules per 
packet (best case is 1, worst case is 256).



Grant. . . .
