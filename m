From: "Arrizabalaga, Saioa" <sarrizabalaga@ceit.es>
Subject: bytes counting
Date: Fri, 23 Apr 2004 15:42:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <086C43C9A9A1A541BFDFABCFDA05F58901448BAB@mailnew.tecnun.es>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: netfilter@lists.netfilter.org

Hello everyone,

I have been reading some mails in this listing and it is said the best
place to count bytes/packets is the mangle table, but I have a problem.

I have three network cards in my linux box: eth0 (private LAN), eth1
(private LAN) and eth2 (internet).

I would like to count the bytes/packets from/to 192.168.0.50 (it is in
eth0) that goes/comes to/from internet (eth2).

These are the rules I have:

iptables -A POSTROUTING -t mangle -o eth2 -s 192.168.0.50

With this rule I catch all the packets going from 192.168.0.50 to eth2,
but I know where to put the rule to catch the packets going from eth2 to
192.168.0.50, because as far as I can see it, when I put the rule:
iptables -A PREROUTING -t mangle -i eth2 -d 192.168.0.50 nothing is
caught because the packet has not been SNAT-ed yet. Am I wrong?

Any help would be appreciated.

Saioa Arrizabalaga


