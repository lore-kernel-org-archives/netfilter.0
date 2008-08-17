From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: VPN (interface) access for and all traffic through from single
 user -- how to do it?
Date: Sun, 17 Aug 2008 12:53:39 -0500
Message-ID: <48A865A3.1010307@riverviewtech.net>
References: <200808151255.44987.janklodvan@gmail.com> <200808162347.55392.janklodvan@gmail.com> <48A7A9A5.3040403@riverviewtech.net> <200808171420.32090.janklodvan@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200808171420.32090.janklodvan@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 8/17/2008 6:20 AM, Jan Klod wrote:
> I think so, but how to check?

The output of ifconfig and the VPN client trace (local / remote IP 
lines) after the VPN is up tells us what we need to know.  Yes, the 
address you are pining is the other end of the VPN.  Good.

> local ~ # ip route list
> 192.168.2.0/24 dev eth1  proto kernel  scope link  src 192.168.2.111
> 127.0.0.0/8 dev lo  scope link
> default via 192.168.2.1 dev eth1

*nod*

> pty pptp 193.13.128.6 --nolaunchpppd

Is 193.13.128.6 the IP of the VPN server you are establishing a VPN to? 
  (I'm going to presume yes for the rest of the discussion.)

> It might be Microsoft VPN most likely, but I am not absolutely sure (how to 
> check?).

It does not really matter.  It was more a point of interest that this is 
a PPTP VPN, not an SSL VPN, which is what OpenVPN provides.  Usually 
PPTP / L2TP VPNs are served up by a Microsoft VPN server where as IPSec 
/ SSL / other are served up by things that are not Microsoft. 
(PPTP/L2TP is built in to Routing and Remote Access from Microsoft.)

> local ~ ip route list
> 215.155.115.254 dev ppp0  proto kernel  scope link  src 215.155.114.15
> 192.168.2.0/24 dev eth1  proto kernel  scope link  src 192.168.2.111
> 127.0.0.0/8 dev lo  scope link
> default via 192.168.2.1 dev eth1

*nod*  Here the VPN is up and we see a new network (the VPN) as I expect.

> local ~ # ifconfig
> eth1 ... inet addr:192.168.2.111  Bcast:192.168.2.255  Mask:255.255.255.0
> lo   ... inet addr:127.0.0.1  Mask:255.0.0.0
> ppp0 ... inet addr:215.155.114.15  P-t-P:215.155.115.254  Mask:255.255.255.255
> 
> local ~ # route -n
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    Use Iface
> 215.155.115.254 0.0.0.0         255.255.255.255 UH    0      0        0 ppp0
> 192.168.2.0     0.0.0.0         255.255.255.0   U     0      0        0 eth1
> 127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0 lo
> 0.0.0.0         192.168.2.1     0.0.0.0         UG    0      0        0 eth1
> 
> This should contain most of necessary information...

Yes it does.  At this point I would think that you can issue the 
following commands (double check my syntax) and get the result you are 
wanting.

ip route add 193.13.128.6/32 via 192.168.2.1
ip route del default via 192.168.2.1
ip route add default via 215.155.115.254 metric 1
ip route add default via 192.168.2.1 metric 2

This should do the following:
  - Add an explicit route to get to the VPN server via your local router.
  - Delete your existing default gateway so we can (re)add the new one 
that you want.
  - Add a new default gateway that is the remote end of the VPN.
  - Add a new backup default gateway that is your local router so we 
still have a backup route to the net when your VPN is down.

At this point things should be functional for you.



Grant. . . .
