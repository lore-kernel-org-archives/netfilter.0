From: |m| <p0q0b0d@gmail.com>
Subject: Masquerade and ICMP frag needed
Date: Tue, 24 May 2005 16:12:05 +0200
Message-ID: <3b1e6f4805052407125672d663@mail.gmail.com>
Reply-To: |m| <p0q0b0d@gmail.com>
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

Problem: My box does not forward ICMP Fragmentation needed packet to
its masqueraded clients.

Setup:
I have a box with 3 nics equipped with kernel 2.6.11 and iptables
1.2.11. This box has two gateways, and the net workflow is as follows:

eth0 <---> clients
eth1 <---> standard internet traffic
eth2 <---> VPN

Details:
Traffic on eth2 is masqueraded (required). The problem is that the
packets (MTU 1500) must be encapsulated in IPSEC packets at the next
hop where the MTU is the same, therefore the VPN server sends back
ICMP packet telling that need to frag. ICMP packets are received by my
box, but not forwarded to clients that continue to send 1500 bytes
packets. Therefore the VPN site does not open.

Is that a normal behavior? Should I add anything to iptables rules in
order to make it forwarding ICMP Frag needed packets?

Thank you very much!

Iptables on eth2:
Input,Output,Forward
- Policy ACCEPT (nothing else)
Nat
- POSTROUTING anywhere anywhere -j MASQUERADE

Current Workaround:
- ifconfig eth2 mtu 1400 (I don't like it! :)

