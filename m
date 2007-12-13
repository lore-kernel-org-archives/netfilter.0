From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Network Communication Issues
Date: Wed, 12 Dec 2007 18:42:51 -0600
Message-ID: <4760800B.7040601@riverviewtech.net>
References: <000b01c83ce4$71df9fb0$fe02a8c0@brammo.main>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <000b01c83ce4$71df9fb0$fe02a8c0@brammo.main>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 12/12/2007 11:28 AM, Jacob Lear wrote:
> The problem is that communication with the Linux router isn't working 
> properly.  I cannot ping the router from the other servers, but I CAN 
> ping the other servers from the router; however I receive a message 
> in every ping reply that says "wrong data byte #XX should be 0xXZ but 
> was 0xXY".

Can we see the actual error message rather than a sanitized one?

> What's even more strange is that I can ping the router's SAN NIC 
> (192.168.1.1) from my workstation which is on the main subnet just 
> fine, as well as the other servers on the SAN.
> 
> I've done some searching on the net and most people say that the 
> common cause of something like this is a firewall.  The router is 
> running iptables for its firewall and for NAT.  I've added entries to 
> permit all internal traffic and checked the log (it displays a 
> message in syslog when it rejects a packet) but it's not rejecting 
> the traffic.  None of the other servers are running a firewall.

I would initially question whether or not the problem is firewall 
related or if you have crossed subnet masks.

> Here's the routing table from one of the Windows servers:
> 
> <snip>
> 
> And here's the routing table from the Linux router:
> 
> <snip>
> 
> And here's the iptables firewall script:
> 
> <snip>

I don't see any thing in the script that should be causing problems. 
Initially I wondered if you could access the firewall from the servers 
via an IP address that would be forwarded through the router / firewall 
but not directly into the router / firewall.  However you have lines in 
your firewall script that look to allow any traffic in to the firewall 
from the LAN and SAN so this should not be a problem.  Consider if this 
was the case, the servers that are on both subnets would not be able to 
ping the IP of the router / firewall that passes through the router / 
firewall because it would always come from the close IP, i.e. the one 
that is in the subnet, thus no need for forwarding.  However your 
workstation would be able to ping the SAN IP address of the router / 
firewall because it would have to forward the packet(s), passing through 
the FORWARD chain, not the INPUT chain directly.

> If anyone has any ideas or suggestions, I'd greatly appreciate some 
> help.  I'm pretty much at a loss at this point.  All I can think of 
> is that maybe there's something wrong with the NIC...  but that 
> doesn't really make sense since I can ping it just fine from this 
> workstation.

Try disconnecting your internet connection for a few minutes (for 
safety) and disabling all firewalling all together and allow just 
straight routing.  If this works, you know for sure that there is a 
problem in your firewall script.

If that does not work can we get an output of iptables-save so that we 
see your entire firewall as in kernel memory?

> Thanks in advance,

*nod*



Grant. . . .
