From: "Thhoep" <thhoep@gmx.de>
Subject: Re: Iproute2 and fwmark usage
Date: Wed, 14 Jan 2004 00:46:37 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000e01c3da2f$7cc83700$1684188d@Kiste>
References: <001401c3d63b$e9ebdff0$1684188d@Kiste> <001501c3d6fc$3a889c80$1684188d@Kiste> <000d01c3d885$8181e710$1684188d@Kiste> <200401112107.09764.Antony@Soft-Solutions.co.uk> <000a01c3d88c$f8d07d20$1684188d@Kiste> <001701c3d898$70c170e0$1684188d@Kiste>
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

> ok, just solved my problem.

sorry, i was mistaking. i found some bugfixes, thats right, but they didnt
fix this bug BUT brought several other bugs into my kernel.

i still have the problem that usage of firewall marks as routing key doesnt
work.
kernel:     2.4.20-22  (all tried)
iptables:   1.2.9
iproute:    ss010824

in addition with kernels 2.4.23 and 2.4.24 routing table selection doesnt
seem to work at all for me.


if you have ANY hints, i would be really grateful. maybe you can name me a
configuration of kernel, kernelpatches, iptables and iproute with which
advanced routing, firewalling and QoS are working fine. to be more precise,
i need a full functional netfilter with the usual matching rules and
targets, esp. marks and masquerading, advanced routing that allows routing
selection upon netfilter marks and qos with the htb queueing disciplin.

thank you.


