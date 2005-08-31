From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Special configuration... need help!
Date: Wed, 31 Aug 2005 07:19:30 -0500
Message-ID: <200508310719.30230.rob0@gmx.co.uk>
References: <1125419556.4423.3.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1125419556.4423.3.camel@localhost.localdomain>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tuesday 2005-August-30 11:32, Terje Sannum wrote:
> I'm no networking expert and don't know if this is possible, so any
> help and tips are welcome...

I don't think I completely understand, because if I do there's nothing 
"special" about this. It's basic NAT-HOWTO stuff.

> Here is the situation: I have this set-top box for cable-tv at home
> that is connected to a 100mbps network. This network is connected to
> the internet, and plugging in a laptop instead gives me full (NAT'ed)
> 100mbps access to the internet(!). The problem is that the DHCP
> server only gives me 1 ip-address, so I'm looking for a solution

What DHCP server? You don't control this server? Can you assign static 
IP's in the same netblock?

> where I can have both my laptop (or better, a subnet) and the set-top
> box online on the same time.
>
> Available hardware:
> 1 Linux PC w/2 network cards
> 1 switch
> (I will invest in the nessesary hardware if that's what it takes)
>
> I've tried using this hardware to make a NAT'ed subnet (with DHCP
> server). This works fine for the laptop (i'm using it now :), but the
> set-top box complains about no connection to server. The set-top box
> is WinXP based, and looking at the traffic at boot-time I see a lot
> of netbios packets. I've tried to set up forwarding, but that does

So the set-top box needs a non-NAT'ed connection to somewhere, and it's 
sending netbios out? I would worry about how safe this thing is. It may 
already have a virus or other compromise!

> not seem to help. Testing different configurations takes a hell lot
> of time since I have to reboot the set-top box everytime, that's why
> I'm trying this message. Don't know anything about the MS protocols,
> and a little searching tells me that NAT'ing this does not work?

An embedded device made by someone without a clue! Ouch!

> So, is there some way I can watch TV and be online with my
> computer(s) at the same time?  The set-top box only needs access to a
> 10.x.x.x net (I think), so my thought was that a configuration that
> sets up a bridge from that net to the set-top box but still has a
> NAT'ed subnet maybe will work. Is this possible? Help! ;)

That would be one suggestion.

Did you try one NIC in the dual-homed Linux going to the set-top box, 
the other NIC going to the switch, and simple SNAT/MASQUERADE for the 
switch subnet?

eth0: 192.168.2.1/24, connected to switch
eth1: DHCP from the set-top box
SNAT traffic from eth0 going out eth1 to the eth1 IP
run a DHCP server listening on eth0 only
run dnsmasq, give DHCP clients "option nameserver 192.168.2.1;"
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

