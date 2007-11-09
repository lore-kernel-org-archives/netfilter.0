From: "Patrick Wong" <pawong@versasys.com>
Subject: RE: NAT'ing multiple IPsec clients to the same destination IPSec server
Date: Fri, 9 Nov 2007 18:19:21 -0500
Message-ID: <6384F3D395F0A347A603C129CFD52DAA630CC1@exchange.versa.versasys.com>
References: <1194648215.26369.17.camel@fe7pawong.versa.versasys.com> <4734E6D5.4050902@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
In-Reply-To: <4734E6D5.4050902@rtij.nl>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Martijn Lievaart <m@rtij.nl>
Cc: netfilter@vger.kernel.org


That's the problem. I don't have control over UDP encapsulation because
I don't control the server's end!


-----Original Message-----
From: Martijn Lievaart [mailto:m@rtij.nl] 
Sent: Friday, November 09, 2007 6:02 PM
To: Patrick Wong
Cc: netfilter@vger.kernel.org
Subject: Re: NAT'ing multiple IPsec clients to the same destination
IPSec server

Patrick Wong wrote:
> Way back in 2.0.18 kernel, there was an IPsec connection tracking
module
> that would allow me to masquerade multiple IPsec clients (eg Cisco VPN
> client) all going to the same remote IPsec server onto one external IP
> address. This was done with IPsec connection module + ipmasqadm +
> ipchains.
>
> I have never been able to get the above to work on iptables. In the
> early days of iptables, I also noticed there was no IPsec conntrack
> module. 
>
> If I have only 1 external IP address on my firewall/gateway to SNAT
to,
> is there a way to support multiple IPSec clients on my internal LAN
all
> establishing IPSec connections to the same destination IPSec server?
>   

Cisco VPN client supports UDP encapsulation. You have to allow it on the

concentrator too, but if that is possible, it should work without 
specific iptables rules.

M4

