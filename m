From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: SNAT firewall maybe compromised. Misconfiguration?
Date: Tue, 29 Apr 2003 10:55:21 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304291055.21445.Alistair@nerdnet.ca>
References: <00a501c30d91$cf0b7740$1800a8c0@medusa>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <00a501c30d91$cf0b7740$1800a8c0@medusa>
Content-Disposition: inline
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
To: Thiago Lima  <thiagolima@webforce.com.br>, netfilter@lists.netfilter.org

On April 28, 2003 10:23 am, Thiago Lima wrote:
>     I'm using iptables v1.2.6a (RPM from redhat) in a firewall that has
> 5 external ips and lots of machines in the internal network.
>
>     iptables should port foward services based on external ip/port to
> some internal machines and port.
>
>     Everything is working fine, but I've seen entries in my internal
> servers logs to 192.168.1.254 and my internal network is 192.168.0.254.
> Ping shows that 192.168.1.254 does not exist.  So I'm thinking that
> maybe my firewall script has a hole. And someone discoved it.
>
>     My external interface is eth0 (200.200.200.111~115 eth0:1~eth0:5)
> and the internal is eth1 (192.168.0.254)
>
> 	Can someone point me if I'm doind something very wrong here?
>
> 	Thanks alot
> 	Thiago Lima.
>
>
> Here goes my fw script.
>
> -- fw.sh
>
> echo -n  Starting firewal ..
> # enable packet forwarind
> echo 1 > /proc/sys/net/ipv4/ip_forward
> echo -n .
>
> # clear all tables
> /sbin/iptables -t nat -F
> /sbin/iptables -F
> echo -n .
>
>
> # eth0 is the external interface. blocking packages to internal net
> /sbin/iptables  -A INPUT -d 192.168.0.0/24 -i eth0  -j DROP
> echo -n .
>
> # install snat
> /sbin/iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source
> 200.200.200.110
> /sbin/iptables -t nat -A POSTROUTING -o eth0 -s 192.168.0.0/24 -j SNAT
> --to 200.200.200.110
> echo -n .
>
> # port forwarding
>
> # http goes to server #1
> /sbin/iptables  -A PREROUTING -t nat -p tcp -d 200.200.200.111 --dport
> 80 -j DNAT --to 192.168.0.1:80
> /sbin/iptables  -A PREROUTING -t nat -p tcp -d 200.200.200.111 --dport
> 443 -j DNAT --to 192.168.0.1:443
> echo -n .
>
> ## pop goes to server #2
> /sbin/iptables  -A PREROUTING -t nat -p tcp -d 200.200.200.112 --dport
> 110 -j DNAT --to 192.168.0.4:110
> echo -n .
>
> # DNS goes to server #3
> /sbin/iptables  -A PREROUTING -t nat -p tcp  -d 200.200.200.114 --dport
> 53 -j DNAT --to 192.168.0.6
> /sbin/iptables  -A PREROUTING -t nat -p udp  -d 200.200.200.114 --dport
> 53 -j DNAT --to 192.168.0.6
> echo -n .
>
> # enables access from internet net to external virtual servers
> /sbin/iptables  -A POSTROUTING -t nat -d 192.168.0.0/24 -s
> 192.168.0.0/24 -j SNAT --to 192.168.1.254
> --cut

	You aren't showing us your policies, and that leads me to believe
	that the chain policies might be ACCEPT ... which is very not good.
	Also it ranter looks like this script was cut off.... so I can't be sure...
	
	$IPTABLES -P INPUT DROP
	$IPTABLES -P FORWARD DROP
	
	?? do you do this at all??
-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

