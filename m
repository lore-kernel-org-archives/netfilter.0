From: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Subject: iprange and mac-source
Date: Mon, 7 Mar 2005 01:38:46 +0200
Message-ID: <fad9d4840503061538754118e6@mail.gmail.com>
Reply-To: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org, GLUG-Chat <glug-chat@linux.org.za>

Guys

I'm having some difficulty getting the following rules to work:

These chains are used in both the INPUT and FORWARD chains of the filter table:

# Log/Drop chain for ip/mac address mismatches
$IPTABLES -N ADDRESSMISMATCH 2> /dev/null
$IPTABLES -F ADDRESSMISMATCH
$IPTABLES -A ADDRESSMISMATCH -j LOG --log-level $LOG_LEVEL -m limit
--limit $LTIME --log-prefix "Firewall (IP/MAC mismatch) "
$IPTABLES -A ADDRESSMISMATCH -p tcp -j $TCP_RESPOND
$IPTABLES -A ADDRESSMISMATCH -p udp -j $UDP_RESPOND
$IPTABLES -A ADDRESSMISMATCH -j DROP

# Now verify all MAC/IP combos
$IPTABLES -N VERIFYMAC 2> /dev/null
$IPTABLES -F VERIFYMAC
$IPTABLES -A VERIFYMAC -i $LANPORT -m iprange --src-range
192.168.10.1-192.168.10.10 -m mac --mac-source 00:0b:6a:a0:0a:7f -j
RETURN
$IPTABLES -A VERIFYMAC -i $LANPORT -m iprange --src-range
192.168.10.31-192.168.10.40 -m mac --mac-source 00:02:e3:55:85:f5 -j
RETURN
$IPTABLES -A VERIFYMAC -j ADDRESSMISMATCH

Every single packet traverses the chain all the way down to
ADDRESSMISMATCH, no packets match...

The scenario is that each user can have multiple MAC addresses
(laptops, pda's & pc's). The DHCP will always issue the same range to
the same MAC addresses, each user get's their own pool own 10 IP's.

I'm trying to avoid matching 10 ip's to each MAC address. I'm under
the impression that this will adversely affect performance. We already
have 80 users on the network, 800 possible ip's and already 110 mac
addresses. The VERIFYMAC chain above will get too big or is this not a
problem.

Is the one-to-one match the only solution, or am I missing the plot here?

Thanks in advance!

-- 

Kenneth Kalmer
kenneth.kalmer@gmail.com
http://opensourcery.blogspot.com

