From: "Kovacs Istvan" <kofa@alarmix.net>
Subject: One-to-one NAT
Date: Fri, 18 Oct 2002 13:47:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFE4F0023E.764FDF67-ON41256C56.004112CB@telelogic.hu>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Hi,

I would like to map one network onto another in a one-to-one way, that
is:
192.168.1.x <---> 10.0.1.x

I know it is possible to use ranges, as demonstrated by the following
example from the iptables NAT HowTo:
# iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -o eth1 \
  -j SNAT --to 1.2.3.0/24

I think this is not the solution for me, as the same document also
says:
---
6.3.1.  Selection Of Multiple Addresses in a Range

  If a range of IP addresses is given, the IP address to use is chosen
  based on the least currently used IP for connections the machine
knows
  about.
---

However, I need the mapping to resolve address range clashes on a VPN
(192.168.1.0 is used on both networks, and I would like network A to
access machines of network B as if they were in 10.0.1.0, not in
192.168.1.0).

Please let me know how I can do that without adding a mapping for
individual addresses.

TIA,
Kofa

Homepage at http://emil.alarmix.org/kofa/  For PGP public key: send mail
with the subject PGP Public Key Request or finger kofa@lemma.math.bme.hu



