From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: Dual WAN setup redux
Date: Mon, 30 Jan 2012 19:50:51 -0600
Message-ID: <op.v8xd21wnx1lyi3@debiandesk2.net>
References: <201201271803.19071.dyioulos@onpointfc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201201271803.19071.dyioulos@onpointfc.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, Dimitri Yioulos <dyioulos@onpointfc.com>

On Fri, 27 Jan 2012 17:03:18 -0600, Dimitri Yioulos <dyioulos@onpointfc.com> wrote:

>Let me see if I can provide all of the information you might need to assist me:
>LAN: 192.168.100.0/24
> DMZ: 192.168.1.0/24
> WAN1 (up and working for a long time): 65.x.x.160/27, gw 65.x.x.161
> WAN2 (new connection): 75.x.x.24/29, gw 75.x.x.30
>eth0 - WAN1: 65.x.x.162
> eth0:0-eth0:6: 65.x.x.163, 164, etc.
> eth1 - LAN: 192.168.100.1
> eth2 - DMZ: 192.168.1.1
> eth3 - WAN2: 75.x.x.25
> eth3:0-eth3:1: 75.x.x.26, 27
>SNAT current DMZ hosts WAN1 addresses
>I want to use WAN2 for a new Web server and test server living in the DMZ.
>I created a new routing table called WAN2.  Here's the output of "ip route show
> table WAN2":
>75.x.x.24/29 dev eth3  scope link  src 75.x.x.25
> default via 75.x.x.30 dev eth3
>Netstat -ar produces the following ourput:
>75.x.x.24   *               255.255.255.248 U         0 0          0 eth3
> 65.x.x.160  *               255.255.255.224 U         0 0          0 eth0
> 10.8.0.0        vpn.mydomain.c 255.255.255.0   UG        0 0          0 eth2
> 192.168.1.0     *               255.255.255.0   U         0 0          0 eth2
> 192.168.100.0   *               255.255.252.0   U         0 0          0 eth1
> default         65.x.x.161. 0.0.0.0                UG        0 0          0 eth0
>The following are probably stupid noob questions, but here goes:
>I can ping the WAN2 gateway address from our firewall/router, but not from any
> other network device (I can ping the gateway address of WAN1 just fine).  Don't
> I have to be able to do that first?
>

I don't see why you can't ping the eth3 interface address from other points in your network.  Your routing table looks OK to me.  Are you sure there are not firewall rules interfering?  And yes, I think that until you get that to work, it's useless to try to go forward.

> I'm not sure what internal ip addresses to give the new Web server and test
> server (192.100.1.x, or 75.x.x.26-29.

I'm not experienced at this, but I expected a DMZ to have public IP addresses, not to be natted just like your internal LAN.  But anyway, of course you will need to assign some address in the 192.100.1.0/24 network to your web server in the DMZ, and use DNAT to allow it to respond to queries from the Internet.  If you assign 192.168.1.3 to your web server, I think you would do something like this:

iptables -A PREROUTING -i eth3 -p tcp -dport 80 -j dnat --to-destination 192.168.1.3

For the test server, I assume you don't need for it to be accessible from outside your LANs, so no DNAT necessary.  Just assign a LAN address to it like 192.168.1.5.

Others here will be much more able to help you, I think.

-- 
Lloyd
