From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: ssh connections stalling
Date: Fri, 23 Oct 2009 10:05:10 +0200
Message-ID: <4AE163B6.9040706@chello.at>
References: <alpine.LNX.2.00.0910221138180.21365@spider.phas.ubc.ca>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.0910221138180.21365@spider.phas.ubc.ca>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

netfilter-owner@vger.kernel.org wrote:
> I'm having some troubles with what should be a very simple firewall to 
> simply protect a local machine.  When the firewall is enabled, ssh and 
> scp connections will sometimes hang indefinitely.  I've tried 
> configuring the firewall (which blocks all incoming requests to ports 
> 0:1023 except ssh and icmp) with several different tools: firehol, ufw 
> and lutelwall.  If the firewall is turned off, the problem 
> disappears.  With lutelwall there is an option to create a 
> non-stateful firewall - if that is done, the problem also disappears.
>
> My syslog does show dropped packets that appear to be the cause of the 
> problem.  From tcpdumps at both ends of the connection it looks like 
> the problem happens if large packets are sent out from behind the 
> firewall and then arrive in pieces at the other end with a piece 
> missing.  ack packets coming back in are dropped, and the connection 
> never recovers.
>
> Any help in diagnosing this would be much appreciated.
>
> Carl

Hello,

The rules you showed us, would all allow a local ssh server, so the 
ruleset is not the problem.
What confuses me, you talk about packets from behind the firewall, but 
your rulesets don't show any FORWARD rules that would even allow ssh.
If you would have, I'd say the problem may be fixable using the TCPMSS 
target:

TCPMSS
       [...]
       This target is used to overcome criminally braindead ISPs or 
servers which block "ICMP Fragmentation Needed" or "ICMPv6  Packet  Too  
Big"  packets.   The
       symptoms of this problem are that everything works fine from your 
Linux firewall/router, but machines behind it can never exchange large 
packets:
        1) Web browsers connect, then hang with no data received.
        2) Small mail works fine, but large emails hang.
        3) ssh works fine, but scp hangs after initial handshaking.
       [...]

If you need rules for a non routing (forwarding) machine, why do you 
talk about 'behind the firewall'?
Otherwise it's something else, than the ruleset.
Log outputs? tcpdumps? Distro? Kernel? iptables version?

Regards

Mart

