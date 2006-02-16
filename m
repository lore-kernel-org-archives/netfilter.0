From: Patrick McHardy <kaber@trash.net>
Subject: Re: 2.6.16-rc3 panic related to IP Forwarding and/or Netfilter
Date: Thu, 16 Feb 2006 21:33:07 +0100
Message-ID: <43F4E183.2020508@trash.net>
References: <20060216001056.GA7446@ranger.taprogge.wh> <43F3C547.8050901@trash.net> <20060216144457.GA1576@ranger.taprogge.wh>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-net-owner@vger.kernel.org>
In-Reply-To: <20060216144457.GA1576@ranger.taprogge.wh>
Sender: linux-net-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jens Taprogge <jlt_lk@shamrock.dyndns.org>
Cc: linux-kernel@vger.kernel.org, linux-net@vger.kernel.org, netfilter@lists.netfilter.org

Jens Taprogge wrote:
> The two patches fix the panic.  However routing still does not quite
> work. 
> 
> My setup consits of two masquerading gateways with local adresses
> 192.168.1.128 (2.6.15.1) and 192.168.3.11 (2.6.16-rc3 + patches).  They
> connect the two local networks through an IPSEC tunnel.  With the exact
> same setup that previously (192.168.3.11 running 2.6.13) worked I can
> now only reach from 192.168.1.0/24 to 192.168.3.0/24 and not the other
> way around:
> 
> Pinging from 192.168.1.128 I am getting:
> 	$ ping 192.168.3.15
> 	PING 192.168.3.15 (192.168.3.15): 56 data bytes
> 	64 bytes from 192.168.3.15: icmp_seq=0 ttl=63 time=127.9 ms
> 
> On the other hand pinging from 192.168.3.11 I am getting timeouts.
> 
> This is even the case if I set the nat POSTROUTING rule to: 
> 	$ iptables -t mangle -I PREROUTING -p esp -j MARK --set-mark 111
> 	$ iptables -t nat -F POSTROUTING
> 	$ iptables -t nat -A POSTROUTING -o ppp0 -s 192.168.3.0/24 \
> 		-m mark ! --mark 111 -j MASQUERADE
> 
> on both sides of the tunnel which should disable masquerading for IPSEC
> packages.
> 
> However the tunnel works as soon as I completly disable masquerading.

2.6.16-rc includes patches for proper netfilter IPsec handling. Packets
will now go through the chains once in plain text and once encrypted,
so I guess you're masquerading the packets that should go through the
tunnel to an address that doesn't match the policy anymore and they
are therefore not handled by IPsec (this is also the case my patches
fixed). So you need to make sure you don't have any SNAT rules that
change the unencrypted packets to an address not included in the policy.
