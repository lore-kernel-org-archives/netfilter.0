From: "Fabrice Grelaud" <f.grelaud@free.fr>
Subject: nth patch
Date: Mon, 1 Dec 2003 16:57:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003701c3b824$646f1200$5618a8c0@imperial.local>
References: <20031201150917.BEDE11B9BA@smtp.ttp.nl>
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

Hi everybody,

I have 2 connections adsl on my gateway (eth1, eth2) and one card for the
LAN (eth0).
netfilter-extension-HOWTO: "easy and quick method to produce load-balancing"
I would like to know if it's possible to balance the load of incoming
packets (eth0) to the two externals interfaces.
                                          _______
                                          |             |-eth1
(66.12.24.36)----------
------eth0 (192.168.0.254)|    FW   |
NET
                                          |    NAT |-eth2
(66.13.52.36)----------
                                          _______

And so use the command:
#iptables -t nat -A POSTROUTING -o eth1 -m nth --counter 7 --every
2 --packet 0 -j SNAT --to-source 66.12.24.36
#iptables -t nat -A POSTROUTING -i eth2 -m nth --counter 7 --every
2 --packet 1 -j SNAT --to-source 66.13.52.36

In the howto's example, each time the output card is eth0 ???

what do you think ???
Or do i have to use the target ROUTE or iproute2 & netfilter ???

Cordially yours
Fabrice



