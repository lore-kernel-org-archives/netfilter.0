From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: ip masqurade
Date: Sun, 8 Jun 2003 23:21:57 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00eb01c32e03$fe2b5c60$0401000a@sterenborg.info>
References: <3EE14B43.7060102@lou-telecom.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3EE14B43.7060102@lou-telecom.net>
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
To: 'netfilter' <netfilter@lists.netfilter.org>

> computers on my LAN to gateway to the internet via my Linux Modem. My 

You use a modem, so I guess you have aa ppp internet interface and a
dynamic IP address.
That's why we'll be using MASQUERADE. Otherwise use SNAT.

> my lan which will fall in the ip range of 192.168.168.0/24. 

# First disable forwarding so that nothing will happen before your rules
are set.
echo 0 > /proc/sys/net/ipv4/ip_forward

# Forward packets coming from your LAN to internet, DROP everything
else.
# When not specifying a table, the filter table is assumed.
iptables -P FORWARD DROP
iptables -A FORWARD -i <if_lan> -o <if_inet> -s 192.168.168.0/24 -j
ACCEPT
iptables -t nat -A POSTROUTING -o <if_inet> -s 192.168.168.0/24 -j
MASQUERADE 

# Enable forwarding.
echo 1 > /proc/sys/net/ipv4/ip_forward


Gr,
Rob


