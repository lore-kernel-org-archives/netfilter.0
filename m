From: JCA <1.41421@gmail.com>
Subject: Rules on SSH connection requests
Date: Wed, 8 Mar 2006 15:37:54 +0000
Message-ID: <a10b0c8a0603080737u61843de2k85a6314cb60e8916@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

    I have the following setup:

Internet ---- ADSL modem/router A ----- Linux firewall F ------ Linux box B

   TCP/IP packets for port 22 (the SSH port) are allowed in by A. In
turn, F just forwards such packets to B without any further
processing. In B I have the following IPTables set of rules:

/usr/sbin/iptables -A INPUT -p tcp -i eth0 -s 192.168.1.0/24 \
                   --dport 22 -j ACCEPT
/usr/sbin/iptables -A INPUT -p tcp -i eth0 -m state --state NEW \
                   --dport 22 -m recent --update --seconds 15 -j DROP
/usr/sbin/iptables -A INPUT -p tcp -i eth0 -m state --state NEW \
                   --dport 22 -m recent --set -j ACCEPT

  My understanding is that with these rules, whenever an SSH
connection attempt to port 22 from a given IP address fails (because
the wrong credentials were used), no further connection requests from
that IP address will be honored for 15 seconds. The first rule just
specifies that this mechanism is not to be applied to connections from
my internal LAN.

  If I make an SSH connection from some machine I in the Internet to
B, B honours this connection request promptly (modulo network
performance, of course). If, the first connection having been
successful, from I another SSH connection to B is opened immediately
afterwards (that is, within a few seconds), this second connection
request takes a long time to be honored - 45 seconds or more. The only
thing that I can think of interfering here is the set of rules above.

  Can anybody throw some light on this? In particular, if the rules
are causing this behavior, can they be modified so that the behavior
disappears, while preserving the 15 second timeout for failed
connection attempts?

  B is running a 2.4.27 Linux kernel, and iptables 1.2.10.

