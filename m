From: "Jeff 'Gum-y' East" <an972@ncf.ca>
Subject: masquerading works for Xterminal, but not Mac 0S/X
Date: Sun, 30 Mar 2003 15:04:35 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030330200435.GD2280@localhost>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: Netfilter list <netfilter@lists.netfilter.org>

	I have reduced my rules for testing purposes to:

iptables --table nat -A POSTROUTING --out-interface ppp0 -j MASQUERADE
echo 1 > /proc/sys/net/ipv4/ip_forward

	Now my Xterminal's telnet client (only thing I can test with) and
dns lookups go through my forwarding just fine.  But when I connected my
friend's Powerbook (Graphite edition?) with OS/X up to it, I saw NO traffice
with iptstate.

- The Mac DID get an IP address (but not nameserver entries) from my dhcpd
successfully.

- even failed lookups (bad iptables rules) from my Xterminal showed up on
iptstate

	Could the OS/X implementation of TCP/IP have something odd with it?
___________________________________________________________________________
         Say NO to HTML emails:     http://expita.com/nomime.html

