From: "Peter Hoeg" <disposable1@hoeg.com>
Subject: Firewalling non-IPsec connections
Date: Sun, 14 Dec 2003 23:30:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000c01c3c291$e4e0f3a0$fc00000a@vmwarew2k>
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

Normally google is my friend but hasn't been able to help me out, which is
the reason I am turning to you guys.

Here is the deal:

I have a multipurpose gateway/firewall box (running linux kernel
2.6.0-test9) using iptables 1.2.9 (standard debian package) with 3 NICs:

eth0 - internal LAN
eth1 - WLAN (using a crossover cable into an orinoco wireless gateway)
eth2 - internet connection via adsl

For the IPsec stuff I am using the in-kernel ipsec implementation and racoon
for IKE (tunnel mode by the way).

What I want to do:

Basically, the only connections that are to be allowed as wireless
connections are IPsec tunnels, so I can ensure nobody else uses my
connection. This is pretty easy for connections to the gateway host (UDP
port 500 for IKE, ESP protocol and dhcp) as I just need to limit the INPUT
chain for eth1.

The REAL problem is since I need to allow connections from the wireless LAN
segment to go onto the internet and it seems like the connections only hit
the FORWARD chain AFTER the kernel has done all its magic with unpacking the
encrypted packages. What I would like to do is something like:

iptables -A FORWARD -i eth1 -o eth2 -p esp -j ACCEPT

and then drop everything else, but again, the problem is that if I as an
example ping www.google.com from a wireless host with the IPsec tunnel
active and having this rule:

iptables -A FORWARD -j LOG

I can then see the ICMP packages in my log for the forward chain.

I hope I have managed to explain what it is that I am looking for and that
somebody out there can help me out.


