From: "Ian Hunter" <ihunter@hunterweb.net>
Subject: Re: Home web server using front firewall
Date: Wed, 17 Dec 2003 16:56:42 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002801c3c4e8$a82ca220$7000a80a@melita.com>
References: <HFEBJMKNPOCPPMGFHDMCAEJBCDAA.esanz@minorplanetusa.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Erick Sanz <esanz@minorplanetusa.com>
Cc: netfilter@lists.netfilter.org

> iptables -A FORWARD -i eth0 -p tcp -d 10.10.1.240 --dport 80 -m state \
> --state NEW,ESTABLISHED,RELATED -j ACCEPT
>
> iptables -A FORWARD -i eth1 -p tcp -s 10.10.1.0/24 --source-port 80 \
> -j ACCEPT
>
> iptables -A FORWARD -o eth1 -p tcp -s 10.10.1.240 --sport 80 -m state \
> --state NEW,ESTABLISHED,RELATED -j ACCEPT


The first forward allows inbound traffic from eth0 (net?) to hit the
webserver on 10.10.1.240
The second forward allows any traffic FROM any webserver in the 10.10.1.0/24
network out to anywhere (ODD!)
The third forward specifically allows the web server at 10.10.1.240 to
respond to web requests, and should be redundant with the second rule

Here's my question -- which interface is which?  Assuming eth0 is the
internet side, and eth1 is your DMZ side, you should have these:

iptables -A FORWARD -i eth0 -p tcp -d  10.10.1.240 --dport 80 -j ACCEPT
iptables -A FORWARD -i eth1 -p tcp -s 10.10.1.240 --sport 80 -m
state --state ESTABLISHED,RELATED -j ACCEPT

and that should do it.

Are you logging dropped packets?

> Also, I would like to "lock" my OUTPUT chain to avoid Netbios and other
> protocols to go out... any recommendations?

To drop netbios (137-139 tcp & udp), you'd probably want to drop it going
out AND being forwarded, like this:

iptables -A FORWARD -o eth0 -p tcp --dport 137 -j DROP
iptables -A FORWARD -o eth0 -p tcp --dport 138 -j DROP
iptables -A FORWARD -o eth0 -p tcp --dport 139 -j DROP
iptables -A FORWARD -o eth0 -p udp --dport 137 -j DROP
iptables -A FORWARD -o eth0 -p udp --dport 138 -j DROP
iptables -A FORWARD -o eth0 -p udp --dport 139 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --dport 137 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --dport 138 -j DROP
iptables -A OUTPUT -o eth0 -p tcp --dport 139 -j DROP
iptables -A OUTPUT -o eth0 -p udp --dport 137 -j DROP
iptables -A OUTPUT -o eth0 -p udp --dport 138 -j DROP
iptables -A OUTPUT -o eth0 -p udp --dport 139 -j DROP

> Thank you VERY much for your time!

You get what you pay for... lol


