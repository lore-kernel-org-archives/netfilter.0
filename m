From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: Port Scanner
Date: Wed, 5 Nov 2003 11:19:55 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031105191955.89083.qmail@web40207.mail.yahoo.com>
References: <200311051707.hA5H7qr13228@agate.rockstone.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311051707.hA5H7qr13228@agate.rockstone.co.uk>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

In the interest of sharing.. I'ld like to show how I stop portscanning.

Please take note about this and my method. It's for a NATed network on a home
cable line. If you want to open services to the world they should preceed these
lines. This is a very hard nosed way to stop portscanning and any other types
of connections to your computer. Please note that you may want to add other
protcols to the list as well if you use this method.. such as IGMP etc etc

This does stop any and all of NMAPs cuurrent scans.

# NMAP and Connection killer
#
# iptables -A INPUT -p tcp -i eth0 -m state --state NEW -j LOG
iptables -A INPUT -p tcp -i eth0 -m state --state NEW,INVALID -j DROP
iptables -A INPUT -p tcp -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT

# UDP Filters
#
#iptables -A INPUT -p udp -i eth0 -m state --state NEW,INVALID -j LOG
iptables -A INPUT -p udp -i eth0 -m state --state NEW,INVALID -j DROP
iptables -A INPUT -p udp -i eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT

# ICMP Filtration
#
iptables -A INPUT -p icmp -i eth0 -m state --state NEW,INVALID -j DROP
iptables -A INPUT -p icmp -i eth0 -m state --state ESTABLISHED,RELATED -j
ACCEPT

SBlaze

=====
In the absence of order there will be chaos.

__________________________________
Do you Yahoo!?
Protect your identity with Yahoo! Mail AddressGuard
http://antispam.yahoo.com/whatsnewfree

