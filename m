From: "Matthew Hellman" <mhellman@raccoon.com>
Subject: Re: Trying to get a Subnet NATted
Date: Sun, 8 Dec 2002 21:03:40 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000f01c29f2f$9390b9d0$020aa8c0@winxp>
References: <000401c29f26$50e6ecc0$6401a8c0@athlon>
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
Content-Type: text/plain; charset="us-ascii"
To: "Kevin L. Collins" <kcollins@qx.net>, netfilter@lists.samba.org

Kevin,
I'm not exactly sure I understand your network setup, but in a more typical
setup one normally SNAT's all connections going out the external interface
(because everything behind the firewall is "private").

You seem to be saying that you are receiving packets with private source
addresses on the "external" interface of your linux box and that these
packets are destined for the Internet?  Why would you Linux box be receiving
these packets for routing?  It doesn't seeem like it should be in the
routing path.

----- Original Message -----
From: "Kevin L. Collins" <kcollins@qx.net>
To: <netfilter@lists.samba.org>
Sent: Sunday, December 08, 2002 7:57 PM
Subject: FW: Trying to get a Subnet NATted


> First I want to appologize if this makes it to the list more than once,
> I've been having trouble joinging the list.
>
> I've got a strange situation where I receive data from my WAN links
> across the same Interface as my External Interface.
>
> Let me try to explain it with ACSII art....
> +--------------+
> |     WAN      |
> |10.200.9.x/24 |
> |10.200.10.x/24|
> +------+-------+
>        |
>       aDSL
>        |
> +------+------+
> |Real Internet|
> |   Subnet    |
> |   eth0 of   |
> |  Linux Box  |
> +-------------+
>
> I need to be able to bring the packets from the WAN subnet and then
> "SNAT" them to allow them to go back out on to their final Internet
> Destination.  As it stands right now, the Linux machine is simply
> routing them through to the Default Gateway and my ISP's router is
> killing the packets because they are "improper" as they have a
> destination address in the Private LAN subnets.
>
> What I would to do is have IPTABLES apply the SNAT arrangement that I
> have configured for my Internal LAN.  Is this even possible?  And if so,
> how would I go about doing it?  I've tried several things over the past
> week tro make it happen, but nothing is working.  I think I have to do
> something BEFORE the routing takes place, but I'm not sure what.  ANY
> help would be GREATLY appreciated.
>
> Kevin L. Collins, MCSE
> Systems Manager
> Nesbitt Engineering, Inc.
>
>
>



