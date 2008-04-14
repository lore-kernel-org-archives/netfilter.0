From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: simple connection bridging
Date: Mon, 14 Apr 2008 15:01:31 -0500
Message-ID: <4803B81B.5010201@riverviewtech.net>
References: <5d97c170804121439m44ef9243r466dc7e106f0d947@mail.gmail.com>	 <4801622E.1060407@bofhland.org>	 <5d97c170804130410p400d523bs118b8885b5c1548a@mail.gmail.com>	 <alpine.LNX.1.10.0804132100520.9651@fbirervta.pbzchgretzou.qr>	 <48030D4B.1040204@bofhland.org>	 <alpine.LNX.1.10.0804141244260.9651@fbirervta.pbzchgretzou.qr>	 <48033984.9060206@bofhland.org> <5d97c170804141239t1ea0a2c0j6a7f865b508fccb2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5d97c170804141239t1ea0a2c0j6a7f865b508fccb2@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 04/14/08 14:39, Peter Boughton wrote:
> It is for one, but not the other - can change that if necessary?

You don't have to have the Linux box be the default gateway for both XP 
boxen, but the one(s) that do not do so will have to have a route in 
place to the other subnet via the Linux box.

> I've had to fiddle the IPs to try and get Internet Connection Sharing 
> (Windows requires 192.168.0.1 be the internet machine), so I've 
> currently got this:

Ugh?  How big of a role is Internet Connection Sharing (a.k.a. ICS) 
playing in this network?  Are you aware of the problems that ICS will 
introduce in to this mix?

>  - main machine -
> ip=192.168.1.2
> gateway=192.168.0.1
> route add 192.168.0.0 mask 255.255.255.0 192.168.1.10

Um, this machine (as it is above) probably does not have internet access 
as it's default gateway (192.168.0.1) is not on its network (192.168.1.x).

> - internet machine -
> ip=192.168.0.1
> gateway=192.168.0.10
> route add 192.168.1.0 mask 255.255.255.0 192.168.0.10

So this is one of the XP boxen and it is the one that is connected to 
the internet?  I.e. the other XP box will have to pass through the Linux 
box to get to this box to go out to the internet?

>  - linux machine -
> eth0 = 192.168.0.10
> eth1 = 192.168.1.10
> packet filtering enabled

*nod*  Simple enough.

> pinging, ssh, remote desktop all work, but I can't get internet from
> the main machine, only the other two.

*nod*  (See my above note about the default gateway.)

> Aha! I changed the default gateway of my main machine to the linux 
> one and now I can get online with it again!

This is as I would expect.

> Not really sure what it means to change the gateway though - why that 
> allows it to work online when going direct to the other machine 
> doesn't?

I'm guessing by this statement that you are not overly familiar with 
subneting and routing.  In a nut shell, the netmask in combination with 
your IP address define what addresses are considered local and can be 
gotten to directly.  Any address that is not local has to be gotten 
through via a route or the special route better known as the default 
gateway.

So I'm guessing your set up is something like this:

                (I Net)
                   |
+---+   +---+   +-+-+
| M +---+ L +---+ I |
+---+   +---+   +---+

Where M is your main system, L is the Linux system, and I is the 
internet system.

(Presuming that the above is correct.)

Your main system will be able to talk to any systems with in the same 
subnet that it is on, namely L.  Likewise, L is able to talk to any 
systems with in the same subnets that it is on, namely M and I. 
Similarly I is able to talk to any systems with in the same subnets that 
it is on, namely L and the ISP.

For M to talk to any thing other than L it will need a default gateway 
(L) or at least a route to get to I.  Likewise L will need a default 
gateway (I) to get to the internet.  Similarly I will use the ISP as 
it's default gateway to get to the internet.

Now, word to the wise about Internet Connection Sharing (a.k.a. ICS). 
ICS runs on the system that shares its (usually internet) connection. 
This system has to be fully functional and in charge of the networks 
that it is sharing its connection to.

Any system that is a client of ICS will very likely have to be 
configured as a DHCP client, or ICS *MAY* not share its connection to it 
properly.

Also, if you want, you can tweak the registry of the ICS system to 
change the network config that it hands out to clients.



Grant. . . .
