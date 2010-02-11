From: Guido Trentalancia <guido@trentalancia.com>
Subject: Re: Port forwarding with iptables on tunnel interface
Date: Thu, 11 Feb 2010 20:20:14 +0100
Message-ID: <1265916014.2985.72.camel@tesla.lan>
References: <1265912094.2985.44.camel@tesla.lan>
	 <4B745327.9020806@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B745327.9020806@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org

Hello Patrick,

thanks very much for your message !

By the way, some IP addresses in the original message are wrong (read
192.168.3.69 instead of 192.168.1.65), but that's just a typo.

Here is the log produced by iptables on 192.168.3.64:

Feb 11 20:09:58 gyokuro kernel: ipencap (in): IN=eth0 OUT=
MAC=macaddressofreceiverandsender SRC=senderipaddress DST=192.168.3.64
LEN=76 TOS=0x00 PREC=0x00 TTL=41 ID=26562 PROTO=4 
Feb 11 20:10:01 gyokuro kernel: ipencap (in): IN=eth0 OUT=
MAC=macaddressofreceiverandsender SRC=senderipaddress DST=192.168.3.64
LEN=76 TOS=0x00 PREC=0x00 TTL=41 ID=28099 PROTO=4 
Feb 11 20:10:07 gyokuro kernel: ipencap (in): IN=eth0 OUT=
MAC=macaddressofreceiverandsender SRC=senderipaddress DST=192.168.3.64
LEN=76 TOS=0x00 PREC=0x00 TTL=41 ID=28322 PROTO=4 

And this is tcpdump on 192.168.3.64:

20:09:58.362266 IP (tos 0x0, ttl 41, id 26562, offset 0, flags [none],
proto IPIP (4), length 76) senderipaddress > 192.168.3.64: IP (tos 0x0,
ttl 35, id 38176, offset 0, flags [DF], proto TCP (6), length 56)
smtppeeripaddress.37441 > localhost.smtp: S, cksum 0x641c (correct),
3101176972:3101176972(0) win 5840 <mss 1460,sackOK,timestamp 547791276
0>

I can't see anything odd in the above logs. IPIP encapsulated packets
are allowed in... Then if you look at the output from tcpdump, you see
that they actually contain a connection request to the port 25 (smtp)
from some host with address smtppeeripaddress. But this connection is
not forwarded to the appropriate host as specified in the DNAT and
MASQUERADE iptables rules.

Any idea ?

Regards,

Guido

On Thu, 2010-02-11 at 19:57 +0100, Patrick McHardy wrote:
> Guido Trentalancia wrote:
> > Hello !
> > 
> > I have the following problem. I need to forward/redirect all connections
> > to port 25 (smtp) from one host (192.168.3.64) to another host on the
> > same network (192.168.3.69).
> > 
> > I am using the following iptables rules:
> > 
> > -A PREROUTING -p tcp --dport 25 -j DNAT --to-destination 192.168.3.69
> > -A POSTROUTING -p tcp -d 192.168.1.65 --dport 25 -j MASQUERADE
> > 
> > and I have also tried the following alternative rules:
> > 
> > -A PREROUTING -p tcp --dport 25 -j DNAT --to-destination 192.168.3.69
> > -A POSTROUTING -p tcp -d 192.168.1.65 --dport 25 -j SNAT --to-source
> > 192.168.3.64
> > 
> > The connections come from an IP-IP tunnel and they are allowed by the
> > following iptables rules:
> > 
> > -A INPUT -p 4 -i eth0 -j ACCEPT
> > -A OUTPUT -p 4 -o eth0 -j ACCEPT
> > 
> > It used to work until a few days ago. But now it only works from within
> > the LAN and not from the tunnel. I have not changed any iptables rules
> > and I have only upgraded the system to the latest kernel (2.6.32.8).
> > 
> > The version of iptables that I am using is 1.4.3.1.
> > 
> > Any idea on how to get it back working ?
> 
> Try logging the packets coming out of the tunnel to see whats wrong.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


