From: "R D" <rkd@myrealbox.com>
Subject: Port forwarding across two firewalls
Date: Mon, 10 May 2004 16:00:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000301c4369f$8f8710b0$0f01020a@taita>
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
To: netfilter@lists.netfilter.org


Hi all,

I sent this before but got no reply...is there nobody out there that can
help
 me!?

I have a static IP (10.2.1.15) on which I need to have both TCP and UDP
ports 5000 appearing to be external! The subnet I'm on has a
firewall(Debian) with an int IP 10.2.1.1 & ext 10.1.1.77 with gw 10.2.1.1
obviously. The second firewall/router is a US Robotics ADSL
Modem/Router with int IP 10.1.1.1 & ext 1.2.3.4.

When I lived in a house with just a Debian firewall and nothing configured
on the modem the following worked:

iptables -A FORWARD -p udp -d 10.2.1.15 --dport 5000 -j ACCEPT
iptables -A PREROUTING -t nat -p udp -d fw-ext --dport 5000 -j DNAT --to
10.2.1.15:5000

iptables -A FORWARD -p tcp -d 10.2.1.15 --dport 5000 -j ACCEPT
iptables -A PREROUTING -t nat -p tcp -d fw-ext --dport 5000 -j DNAT --to
10.2.1.15:5000

I've tried the same commands with fw-ext=10.1.1.77 and setting a 'port range
mapping' on the modem 10.1.1.77:5000-1.2.3.4:5000 for both UDP/TCP, but to
no avail!

Any gurus out there that can help/explain!?


Many thanks,
R


