From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: Perform routing using NAT
Date: Thu, 16 Jan 2014 15:45:50 -0500
Message-ID: <201401161545.50447.neal.p.murphy@alum.wpi.edu>
References: <assp.10936facb6.52D832C9.20409@amfes.com>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <assp.10936facb6.52D832C9.20409@amfes.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Thursday, January 16, 2014 02:28:09 PM Daniel Miller wrote:
> I have the following topology:
>      1.  Windows PC on a LAN - for convenience assume is 192.168.1.x.
> Assume because this is a notebook and can/does connect from different
> points.
>      2.  Windows PC has an OpenVPN connection to office Linux server.
> This is a routed connection - PC has address 10.59.97.8, and server is
> at 10.59.97.1.
>      3.  There is a second VPN in place for customers.  This is
> 172.27.x.x.  The server (same as 10.59.97.1) is at 172.27.0.1.
>      4.  Customer has Linux server with VPN address of 172.27.0.10.
> 
> ...
>
> At this time, no iptables are running on either server.  But I'd like to
> be able to have the PC reach the remote server - without having to
> configure the routes as I've described.  What routing can I eliminate
> using NAT - and what combination of SNAT & DNAT is required?

From a high-level point of view, reserve a couple addresses on your server 
(like 10.59.97.254 and 172.27.0.254, assuming a /24 subnet). The PC would use 
10.59.97.254 to reach the customer and the customer would use 172.27.0.254 to 
reach the PC.

So, given a packet from 10.59.97.8 to 10.59.97.254, your server would DNAT it 
to 172.27.0.10 after it's received and SNAT it to 172.27.0.254 before it's 
sent.

And given a packet from 172.27.0.10 to 172.27.0.254, your server would DNAT it 
in PREROUTING to 10.59.97.8 and SNAT it to 10.59.97.254 in POSTROUTING.

This would allow both (PC and cust. server) to talk to each other without 
needing any special routing. But each needs to use the other's 'special' IP 
address.

You would reject NEW packets from the customer's server to the PC. If 
filter:FORWARD, DNAT has happened but SNAT hasn't yet happened. So the nodes' 
natural IPs are used.

Unless I've fallen off my Radio Flyer, the following should do the trick:

iptables -t nat -A PREROUTING -d 10.59.97.254/32 \
    -j DNAT --to-destination 172.27.0.10
iptables -t nat -A PREROUTING -d 172.27.0.254/32 \
    -j DNAT --to-destination 10.59.97.8

iptables -t nat -A POSTROUTING -s 10.59.97.8/32 \
    -j SNAT --to-destination 172.27.0.254
iptables -t nat -A POSTROUTING -s 172.27.0.10/32 \
    -j SNAT --to-destination 10.59.97.254

iptables -I FORWARD -s 172.27.0.10 -d 10.59.97.8 \
    -m state --state NEW -j REJECT

N
