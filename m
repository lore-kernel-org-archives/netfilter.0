From: Tim Miller <tj.miller@javaspotlet.com>
Subject: DHCP IssuesB
Date: Thu, 20 Mar 2003 08:46:41 -0600 (CST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0303200827390.6606@beethoven.javaspotlet.com>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: NetFilter List <netfilter@lists.netfilter.org>


I'm pretty new to netfilter so bear with me.  I have a server that has a
quad card, currently the card is configured:

eth0 -> internet
eth1,eth2 -> not active (yet)
eth3 -> internal lan 10.2.0.0/24 network

I am running dhcpd on eth3 and everything works ok, except for the
renewing of addresses.  For example:

1. Connect a laptop to the network and power up, get an address ok.
2. Release the address and then renew the address, get an address ok.
3. Perform a renew on the laptop and it fails.

My rules are setup as follows:

iptables -A INPUT -i eth3 -p udp -s 0.0.0.0 --sport 68 -d 255.255.255.255
	--dport 67 -j ACCEPT
iptables -A INPUT -i eth3 -p udp -s 0.0.0.0 --sport 68 -d 10.2.0.1
	--dport 67 -j ACCEPT
iptables -A INPUT -i eth3 -p udp -s 10.2.0.0/24 --sport 68 -d 10.2.0.1
	--dport 67 -j ACCEPT

iptables -A OUTPUT -i eth3 -p udp -s 0.0.0.0 --sport 67 -d 255.255.255.255
	--dport 68 -j ACCEPT
iptables -A OUTPUT -i eth3 -p udp -s 10.2.0.1 --sport 67
	-d 255.255.255.255 --dport 68 -j ACCEPT
iptables -A OUTPUT -i eth3 -p udp -s 10.2.0.1 --sport 67 -d 10.2.0.0/24
	--dport 68 -j ACCEPT

Does this make sense? What am I missing?

Thanks

-- 
-Tim Miller

"You are who you become"

Email: tj.miller@javaspotlet.com
Registered Linux User #302727

