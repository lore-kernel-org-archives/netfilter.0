From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: Help with Masquerading
Date: Sun, 5 Jan 2003 17:06:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GOEDLKDBKHLHGAKAGFGKEEPELLAA.rsterenborg@xs4all.nl>
References: <3E184D14.10102@cablespeed.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E184D14.10102@cablespeed.com>
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
To: Subba Rao <subba3@cablespeed.com>, netfilter@lists.netfilter.org

> My W2K is configured with the Linux system as the gateway.
> Both systems
> can ping each other.
> However my laptop is not able to go out to the Internet.

<snip>

> #!/bin/sh
>
> echo "Starting Firewall....."
>
> INTERNAL_NET="10.0.0.0/24"
>
> INTERNET=`ifconfig eth0 | grep inet | cut -d : -f 2 | cut
> -d \  -f 1`
>
> # Flush the tables
> /usr/sbin/iptables -F INPUT
> /usr/sbin/iptables -F OUTPUT
> /usr/sbin/iptables -F FORWARD
> /usr/sbin/iptables -t nat -F
>
> # Set default policies for packet entering this box
>
> iptables -P INPUT DROP
> iptables -P OUTPUT ACCEPT
> iptables -P FORWARD ACCEPT
>
> # Allow some packets in but accept all those on the
> internal interface
> /usr/sbin/iptables -A INPUT -i lo -j ACCEPT
> /usr/sbin/iptables -A INPUT -i eth0 -j ACCEPT
> /usr/sbin/iptables -A INPUT -i eth1 -j ACCEPT

You have set the default policy to DROP, and now you're going to
accept anything on eth0 ? You said that eth0 was the inet interface..
"iptables -P INPUT DROP" doesn't make much sense now.

>
> # Masquerade internal system with the public IP address
>
> iptables -t nat -A POSTROUTING -d $INTERNAL_NET -o
> $INTERNET -j ACCEPT

You shouldn't do this. The next (MASQ) rule won't be processed.

> iptables -t nat -A POSTROUTING -o $INTERNET -s
> $INTERNAL_NET -j MASQUERADE
>
> # Block inbound connections
>
> /usr/sbin/iptables -A INPUT -i eth0 -p tcp --syn -j DROP

If you just don't do "iptables -A INPUT -i eth0 -j ACCEPT" then you
don't have to do this.

> echo 1 > /proc/sys/net/ipv4/ip_forward
> echo 1 > /proc/sys/net/ipv4/tcp_syncookies


Let's rewrite all of the above to :

# Disable IP Forwarding
echo 0 > /proc/sys/net/ipv4/ip_forward

# Clear the chains
iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD
iptables -t nat -F POSTROUTING

# Set default policy
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# ACCEPT connections on local and lan interface
# If you don't run any servers, you don't want to INPUT ACCEPT for
eth0
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -i eth1 -j ACCEPT

# ACCEPT RELATED and ESTABLISHED connections for the FORWARD chain,
# ACCEPT FORWARDing from lan to internet.
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i eth1 -s $INTERNAL_NET -j ACCEPT

# Use MASQUERADE if you have a dynamic IP address (dhcp)
# Use SNAT if you have a static IP address
iptables -t nat -A POSTROUTING -s $INTERNAL_NET -o eth0 -j MASQUERADE
### OR ###
iptables -t nat -A POSTROUTING -s $INTERNAL_NET -j SNAT --to-source
$INET_IP

# Enable IP Forwading
echo 1 > /proc/sys/net/ipv4/ip_forward
echo 1 > /proc/sys/net/ipv4/tcp_syncookies


That should do it I think.


Rob


