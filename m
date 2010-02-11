From: Patrick McHardy <kaber@trash.net>
Subject: Re: Port forwarding with iptables on tunnel interface
Date: Thu, 11 Feb 2010 19:57:43 +0100
Message-ID: <4B745327.9020806@trash.net>
References: <1265912094.2985.44.camel@tesla.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1265912094.2985.44.camel@tesla.lan>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Guido Trentalancia <guido@trentalancia.com>
Cc: netfilter@vger.kernel.org

Guido Trentalancia wrote:
> Hello !
> 
> I have the following problem. I need to forward/redirect all connections
> to port 25 (smtp) from one host (192.168.3.64) to another host on the
> same network (192.168.3.69).
> 
> I am using the following iptables rules:
> 
> -A PREROUTING -p tcp --dport 25 -j DNAT --to-destination 192.168.3.69
> -A POSTROUTING -p tcp -d 192.168.1.65 --dport 25 -j MASQUERADE
> 
> and I have also tried the following alternative rules:
> 
> -A PREROUTING -p tcp --dport 25 -j DNAT --to-destination 192.168.3.69
> -A POSTROUTING -p tcp -d 192.168.1.65 --dport 25 -j SNAT --to-source
> 192.168.3.64
> 
> The connections come from an IP-IP tunnel and they are allowed by the
> following iptables rules:
> 
> -A INPUT -p 4 -i eth0 -j ACCEPT
> -A OUTPUT -p 4 -o eth0 -j ACCEPT
> 
> It used to work until a few days ago. But now it only works from within
> the LAN and not from the tunnel. I have not changed any iptables rules
> and I have only upgraded the system to the latest kernel (2.6.32.8).
> 
> The version of iptables that I am using is 1.4.3.1.
> 
> Any idea on how to get it back working ?

Try logging the packets coming out of the tunnel to see whats wrong.
