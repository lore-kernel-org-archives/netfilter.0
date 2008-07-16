From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: NAT rule
Date: Wed, 16 Jul 2008 18:54:40 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0807161850580.32031@fbirervta.pbzchgretzou.qr>
References: <487E1DF3.1090203@hoecoop.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <487E1DF3.1090203@hoecoop.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Crider <mcrider@hoecoop.org>
Cc: netfilter@vger.kernel.org


On Wednesday 2008-07-16 18:12, Michael Crider wrote:

> I am attempting to set up a LAN-to-LAN VPN using ipsec-tools for one 
> of our vendors to access a server behind our firewall. However, the 
> local IP address of the server (192.168.10.xx) conflicts with a local 
> address at the vendor's network. They suggested using NAT to transform 
> the server address to 192.168.101.xx and hooking the VPN to the 
> 192.168.101.0/24 network. I would like to run the VPN on the same 
> machine with the firewall (which uses netfilter 1.3.5-4 on CentOS 
> 5.2).  We need to be able to initiate a connection from either end of 
> the VPN. Could anybody recommend iptables rules that would set up the 
> address translation?


iptables -t nat -A POSTROUTING -m policy --dir out --mode tunnel 
--tunnel-dst <realip of vendor> -j NETMAP --to 192.168.101.0/24
iptables -t nat -A PREROUTING -m policy --dir in --mode tunnel
--tunnel-src <realip of vendor> -j NETMAP --to 192.168.10.0/24
