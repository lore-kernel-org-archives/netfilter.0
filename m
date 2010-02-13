From: Guido Trentalancia <guido@trentalancia.com>
Subject: Re: Natting html traffic
Date: Sat, 13 Feb 2010 15:47:14 +0100
Message-ID: <1266072434.2916.46.camel@tesla.lan>
References: <368e93c51002121503y2bf70ddbh85c0c377356a345@mail.gmail.com>
	 <1266016722.2980.159.camel@tesla.lan>
	 <1266027202.3899.1.camel@casper.meteor.dp.ua>
	 <33be4bb31002130208p53b4db41j1e46b3a3920b1fa4@mail.gmail.com>
	 <368e93c51002130422la851213ud93649e9ccc5519c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <368e93c51002130422la851213ud93649e9ccc5519c@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bojan Sukalo <shukalo83@gmail.com>
Cc: netfilter@vger.kernel.org

Hello again !

On Sat, 2010-02-13 at 13:22 +0100, Bojan Sukalo wrote:
> OK, just not to go off topic here (telnet can be used to comunicate
> with lots of stuff)
> 
> Here are my iptables rules with comments.
> 
> iptables -P INPUT DROP
> iptables -P FORWARD DROP
> iptables -P OUTPUT ACCEPT
> 
> iptables -F INPUT
> iptables -F FORWARD
> iptables -F OUTPUT
> iptables -F -t nat
> 
> ##from internal to outside world
> iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
> 
> ##from vpn clients to inisde
> iptables -A FORWARD -i tap0 -o eth1 -j ACCEPT
> 
> 
> ##established sessions from outside to inside
> iptables -A FORWARD -i eth0 -o eth1 -m state --state
> ESTABLISHED,RELATED -j ACCEPT
> ## established session from inside to vpn clients
> iptables -A FORWARD -i eth1 -o tap0 -m state --state
> ESTABLISHED,RELATED -j ACCEPT
> 
> ##Allow inputs from the internal network and local interfaces
> iptables -A INPUT -i eth1 -s 192.168.60.0/24 -d 0/0 -j ACCEPT
> iptables -A INPUT -i tap0 -s 192.168.168.0/24 -d 0/0 -j ACCEPT
> iptables -A INPUT -i lo -s 0/0 -d 0/0 -j ACCEPT

The last three entries are not very secure. In particular, the first two
leave all ports open, while in a real situation you'd better have an
entry for each allowed service/port (by adding "-m state --state NEW -m
tcp -p tcp --dport ALLOWED_SERVICE_PORT", substituting
ALLOWED_SERVICE_PORT with the service you need and perhaps removing -d
0/0).

You could also add for the loopback interface this entry (although it
should be equivalent to setting rp_filter=1):

-A INPUT ! -i lo -d 127.0.0.0/8 -j REJECT

> ## NAT to public source ip (also tried -j MASQUARADE here but that
> also didn't help)
> iptables -A POSTROUTING -t nat -s 192.168.60.0/24 -o eth0 -j SNAT
> --to-source my_public_ip

iptables -A POSTROUTING -t nat -s 192.168.60.0/24 -o eth0 -j MASQUERADE

because amongst other things, if you use SNAT then you would also need
DNAT !

And remember to do "echo 1 > /proc/sys/net/ipv4/ip_forward" to enable
forwarding.

> ##prevent some spoofing from outside
> iptables -A INPUT -i eth0 -s 192.168.60.0/24 -j DROP
> iptables -A INPUT -i eth0 -s 127.0.0.0/8 -j DROP

I think you could just use:

echo 1 > /proc/sys/net/ipv4/conf/all/rp_filter

or just a similar command for specific interfaces.

> ##add some access rules for ssh and openvpn
> iptables -A INPUT -i eth0 -p tcp -s ssh_allowed_public_ip
> --destination-port 22 -j ACCEPT
> iptables -A INPUT -i eth0 -p udp -s 0/0 --destination-port 1194 -j ACCEPT
>
> ##giving trust to my public dns, just in case
> iptables -A INPUT -p udp -s my_public_dns --source-port 53 -d 0/0 -j ACCEPT
> 
> ##trying hard nat to work by clamping mss to mtu
> iptables -t mangle -A FORWARD -i eth1 -o eth0 -p tcp --tcp-flags
> SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu

What do you want to achieve with the last rule ?

Regards,

Guido

