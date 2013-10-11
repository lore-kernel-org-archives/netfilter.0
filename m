From: Tom van Leeuwen <tom.van.leeuwen@saasplaza.com>
Subject: Re: iptables fails to NAT some packets
Date: Fri, 11 Oct 2013 08:26:17 +0200
Message-ID: <52579A09.50508@saasplaza.com>
References: <5257309B.8030204@systech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5257309B.8030204@systech.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "jay@systech.com" <jay@systech.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi Jay,

If your gateway haven't seen the SYN packet that creates the session, it 
is not able to FIN (or RST) the established session. That's what a FIN 
does: terminate an existing tcp session.
If it would decide to create a new NAT translation on a FIN packet, the 
receiving host would not know the tcp session coming from the new NAT 
translation. It would probably respond with a RST.
So: starting a NAT translation on a FIN or RST packet services no 
purpose imho.

Other possibility would be that the SYN packet did go through the 
gateway and that it was correctly natted, but the session has been idle 
for too long and was deleted from the NAT table.
My guess is this sysctl setting: 
net.netfilter.nf_conntrack_tcp_timeout_established

Kind regards,
Tom

On 10/11/2013 12:56 AM, Jay Foster wrote:
> I have a gateway application which I am using iptables to NAT from a LAN
> interface to a WAN interface (linux 3.2.6).  This mostly works well,
> except that I sometimes see (via wireshark) IP packets being sent out
> the WAN interface that originated from the LAN interface that iptables
> fails to apply NAT.
>
> These packets seem to usually be FIN, FIN/ACK, or RST packets.  I
> suspect that these are for IP connections from the device connected to
> the LAN interface that were setup prior to being connected to the
> gateway on which I am running iptables.  After some time, I think the
> application on the connected device decides to close these connections
> (FIN), but iptables fails to NAT these packets.  Why?
>
>   From the iptables man page:
>
>                 nat:
>                     This table is consulted when a packet  that  creates
> a  new
>                     connection  is encountered.  It consists of three
> built-ins:
>                     PREROUTING (for altering packets as soon as they
> come  in),
>                     OUTPUT  (for altering locally-generated packets
> before rout-
>                     ing), and POSTROUTING (for  altering  packets  as
> they  are
>                     about to go out).
>
> I'm concerned about the statement that says, "when a packet that creates
> a new connection is encountered".  Since the SYN packet for the problem
> FIN,RST packets was not seen by iptables, does this mean that iptables
> will not NAT the FIN packet?  This would seem wrong to me.
>
> Jay
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

