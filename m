From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Unwanted Uploading.
Date: Sun, 07 Sep 2003 07:22:41 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F5B1501.2070207@chrisbrenton.org>
References: <20030907041653.11017.qmail@web20706.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ads nat <adsnat@yahoo.com>
Cc: netfilter@lists.netfilter.org

ads nat wrote:
> Hi,
> By giving command "tcpdump -v -nn icmp"
> I get follwoing :
> *****
> 09:31:38.307409 202.63.164.12 > 202.183.69.130: icmp: echo request (DF) 
> (ttl 58, id 0, len 84)

Is 202.63.164.12 part of your internal address space? I'm guessing its 
not because the TTL is not normal for a local Windows system.

Try this, run the command:
ifconfig

and identify which interface is the internal interface of your firewall 
(eth0, eth1, etc.). Then run one of the following commands:

tcpdump -i eth0 -v -nn icmp
or
tcpdump -i eth1 -v -nn icmp

depending on which interface faces your internal (inside) network.

Let the command run for a while and see if you capture anything. You 
should make sure that all of your systems are turned on so you don't 
miss anything. If you see a host sending out a ton of echo-request 
packets, investigate that host to find out why.

If you do not identify any internal systems causing the problem, then 
the problem is originating from outside your network. Going back to what 
you captured again for a moment:

> 09:31:39.308771 202.63.164.12 > 202.183.69.130: icmp: echo request (DF) 
> (ttl 58, id 0, len 84)

I'm sure you've heard about Blast and all the variants. One of those 
variants (Nachi) generates a flood of outbound echo-request packets from 
each infected machine. My guess is that your ISP (like myself when I 
first replied) feels this is a Nachi problem.

Now, the Nachi echo-request packets have a unique signature to them. To 
start, they always originate from a Windows system. Windows uses a 
default TTL of 128. This means that when you see a Nachi packet the TTL 
is usually between 112-128. The TTL in the packets you captured is 58. 
This could be a Nachi infected systems going through a proxy or IPFilter 
type system (or iptables using the --ttl-set option for that matter), 
but it looks kind of odd.

The don't fragment flag (DF) is turned on in the packets you captured. 
When Nachi generates traffic the don't fragment flag is usually turned 
off. Again, could be a firewall rewriting the info but I don't think so 
as its weird for the state of DF to get changed.

Nachi always generates echo-request packets that are 92 bytes in size. 
Your capture shows packets that are _84_ bytes in size. I guess it could 
be some variant (I run Linux only so I don't stay up on all the Windows 
worms), but again it looks kind of odd.

Also, a Nachi infected system does not continually beat up on a single 
IP address. You may see them hit the same IP over time, but its never a 
continual stream as shown in your trace. This also leads me to believe 
that this is not an infected Windows system.

So:..
The TTL is wrong to be Nachi
The DF setting is wrong to be Nachi
The packet size is wrong to be Nachi
The behavior is wrong to be Nachi

I'm guessing its not Nachi. ;-)

So the packets you are seeing out of India look more like some kind of 
echo-request flood. This could be a worm or it could be someone who is a 
jerk. Either way its not Nachi and you are losing bandwidth because of 
this flood of echo-request packets.

One thing you *might* be able to do is ask your ISP to filter out all 
echo-request (ICMP type 8, code 0) packets that are headed for your 
network. This would filter them out on your ISPs side, keeping them off 
your link and from sucking up your bandwidth. I have no idea if your ISP 
is willing to do this type of filtering for you or not.

If you need anything else please shout back directly as we've strayed a 
bit from the general subject of iptables.

HTH,
C


