From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: If eth0 goes down after a reboot, rules for it will be applied to eth1.
Date: Wed, 11 Sep 2002 15:05:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209111406.g8BE60v08709@vulcan.rissington.net>
References: <87sn0g4p8o.fsf@prium.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <87sn0g4p8o.fsf@prium.net>
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

On Wednesday 11 September 2002 2:42 pm, Erik Enge wrote:

> Let's assume I have a firewall with three NICs. 
>
>   NIC 1, eth0, DMZ interface [somewhat laid-back firewall rules]
>   NIC 2, eth1, LAN interface [very strict firewall rules]
>   NIC 3, eth2, router interface [basically FORWARDs everything]
>   NIC 4, eth3, external interface [basically FORWARDs everything]
>
> Now, say we take down the firewall for some reason, and upon it coming
> back up eth0 dies.  The bus assigning will then be a bit different, and
> so will eth0/1/2 and so on (which is what the firewall rules are set
> against).
>
> This means that I could end up in a situation where my laid-back DMZ
> rules were applied to my LAN interface and my external interface would
> still work, because it would take the eth2 which is pretty laid-back.

You're talking about your netfilter rules here (and you're right), but you 
haven't considered what happens to the IP addresses....

The IP address which was supposed to be on the 'real' eth0, which has just 
died, gets applied to what you think is eth1 (even though your computer has 
just decided to rename it eth0 as the first working ethernet card it found).

It is almost inconceivable that the interface connecting you to the outside 
world will deign to communicate with your router (or whatever else is the 
next hop upstream of you) because the IP address, network address, default 
gateway, netmask etc don't match.

Only if you physically plug the new eth0 (old eth1) into whatever the dead 
eth0 used to connect to will the new eth0 actually communicate with anything, 
and of course if you do that to each interface so that it talks, you've got 
your old configuration back again (minus one dead interface).

So, basically I don't think there's anything to worry about.

Antony.

-- 

Most people are aware that the Universe is big.

 - Paul Davies, Professor of Theoretical Physics

