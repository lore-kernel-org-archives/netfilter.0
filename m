From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: How to force all packet go through tun0 ?
Date: Wed, 5 Dec 2012 14:25:14 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1212051424120.14360@nerf07.vanv.qr>
References: <20121205153159.2f96e942@shiva.selfip.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20121205153159.2f96e942@shiva.selfip.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "J. Bakshi" <joydeep@infoservices.in>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Wednesday 2012-12-05 11:01, J. Bakshi wrote:

>Hello,
>
>I have reconnect script which reconnect the vpn connection if
>tun0 is missing. Still during the reconnect phase, the packets
>go through the eth0. How can I force all packets to go through
>tun0 and how can I exclude the domain required for vpn connection
>to be established ?

Just like VPN solutions themselves do when they establish a tunnel with 
a default route:

 ip route add 134.76.22.1/32 dev eth0
 ip route replace default via tun0
