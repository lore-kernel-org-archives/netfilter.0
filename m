From: Kees VandenBroek <kvdb@caip.rutgers.edu>
Subject: No www and ftp using NAT
Date: Mon, 8 Jul 2002 13:08:34 -0400 (EDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <Pine.GSO.4.44.0207081307250.2326-100000@caip.rutgers.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Hi,

I have a cable internet connection on eth0, eth1 and eth2 are my internal
networks. The gateway is running kernel 2.4.18 on debian 3.0 prerelease
with iptables 1.2.6a.

From a machine on the eth1 network, I can:
'ping www.tweakers.net' without problems.
So resolving and icmp works.
I can login into MSN messenger and Jabber but not to ICQ.
So part of the connectivity is ok.
But I cannot surf the web or receive data from an FTP connection.

I tried tons of example scripts but they don't seem to work.
Any ideas?

This is the script I use for nat:

insmod ip_tables
insmod ip_conntrack
insmod ip_conntrack_ftp
insmod ip_conntrack_irc
insmod iptable_nat
insmod ip_nat_ftp

iptables --flush
iptables --flush --table nat
iptables --delete-chain
iptables --table nat --delete-chain

iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

iptables --table nat --append POSTROUTING --out-interface eth0 -j
MASQUERADE

echo 1 > /proc/sys/net/ipv4/ip_forward

# tried this, doesn't work..
#iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -jTCPMSS
--clamp-mss-to-pmtu

Cheers,
Kees



