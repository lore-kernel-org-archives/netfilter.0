From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: If eth0 goes down after a reboot, rules for it will be applied to eth1.
Date: Wed, 11 Sep 2002 19:47:06 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020911184710.HWXE13709.mta07-svc.ntlworld.com@there>
References: <87ofb44i7l.fsf@prium.net> <20020911174425.URMD287.mta02-svc.ntlworld.com@there> <873csg4c3v.fsf@prium.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <873csg4c3v.fsf@prium.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wednesday 11 September 2002 7:25 pm, Erik Enge wrote:

> Antony Stone <Antony@Soft-Solutions.co.uk> writes:
> > Ugh !!!   What sort of networking setup have you got here ???
>
> A fictional one.  :-)

Oh good.   I feel much better about things already.

> Here's what we are thinking about doing, with the actual subnets:
>
>   NIC 1, eth0, 192.168.1.0, private LAN
>   NIC 2, eth1, 192.168.10.0, DMZ
>   NIC 3, eth2, 192.168.11.0, DMZ located elsewhere
>   NIC 4, eth3, 10.0.0.0, backup subnet
>   NIC 5, eth4, some-other-subnet-that-leads-to-the-internet

Very nice.   Very reasonable.   This should work.   I still think you have 
nothing to worry about (as I said in my first reply).

> Ok, given the above configuration, and as we discussed before, why is it
> inconceivable that the interface would communicate with my router?

eth1 has address 192.168.10.1 (I assume), netmask 255.255.255.0, and it's 
expecting to find other machines with the network address 192.168.10.0/24 
connected to it.

One day eth0 dies and eth1 gets reassigned by the Bios / kernel to take over 
the duties of eth0 (however it's still plugged into the same equipment it 
used to be connected to).

So eth1 now has address 192.168.1.1, netmask 255.255.255.0, and expects to 
talk to machines with network address 192.168.1.0/24 connected to it.

If something with address 192.168.10.42 sends out an ARP request for its 
default gateway of 192.168.10.1 (ie the old eth1 which it used to be 
connected to), this interface which now has address 192.168.1.1 isn't going 
to reply, so nothing communicates at the ethernet level (Ramin, I'm not going 
to discuss whether this is layer 1 or layer 2 right now, okay ?)

Similarly, by the time you get up to NIC5, which used to be eth4, and is now 
eth3, you've got eth3 with address 10.0.0.0 (I'll assume this has a netmask 
of 255.0.0.0 for the time being, but it really doesn't matter whether you've 
picked a Class A, B or C for this) plugged into something-that-leads-to-the- 
Internet, but which definitely doesn't have an address starting with 10 (if 
it did, it would have been plugged into NIC4 in the first place).   Therefore 
this interface (NIC5) won't communicate with anything either for the same 
reason.

Basically what happens is that NIC1 dies, all the other NICs get assigned IP 
addresses which are invalid on the networks they're physically connected to, 
and ARP (which is what links the ethernet layer and the IP layer) doesn't 
work any more.   Nothing will talk to anything else until you either repair 
NIC1, or swap all the cables along one position on your firewall, which 
brings you back to the physical configuration you wanted in the first place.

Does this make it clear ?

> Note: currently, we only have one small firewall with a LAN behind it.
> The reason we need this quite elaborate setup (assuming we're not going
> to buy any switches) is that we are moving part of our infrastructure to
> a colocation.

That's no problem.   One day you'll join them up using FreeS/WAN, I hope :-)

Antony.

-- 

Most people have more than the average number of legs.

