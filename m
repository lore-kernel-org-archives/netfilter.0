From: "David Ruggles" <david@safedatausa.com>
Subject: Quick Routing question
Date: Tue, 4 Mar 2003 15:10:43 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <016701c2e28a$239fbab0$1f0016ac@daviddesktop>
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

I'm trying to learn netfilter so I've got a very simple setup.

I've got a Linux box with three interfaces. (I'm not using eth0 currently)
I've got two networks (eth2: 172.22.0.0 & eth1: 10.0.0.0)
I entered the following on the Linux box:
iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to 10.9.0.254 (eth1's IP
address)

I've got a machine on each network: machine A is on 172.22.0.0 and machine B
is on 10.0.0.0
I'm trying to ping from A to B.
I can ping all the interfaces on the router but I can't ping B

I would expect to see the POSTROUTING chain counter increment for each ping
packet, but it doesn't. (It will increment if I ping from the Linux box to
B)

Any suggestions?

Thanks,
David Ruggles

CCNA MCSE (NT) CNA A+
Network Engineer, Safe Data, Inc
910-285-7200    david@safedatausa.com
0100011101101111011001000110110001101111011101100110010101110011011110010110
111101110101


