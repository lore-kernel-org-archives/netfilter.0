From: Brian Capouch <brianc@palaver.net>
Subject: iptables NAT with "policy routing?"
Date: Thu, 22 Jan 2004 01:49:08 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <400F7264.1080201@palaver.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I have had to temporarily use a table-based route for one of my networks 
for administrative reasons, e.g.

 > ip rule from 192.168.1.0/24 lookup table temp

Then

 > ip route add default via 192.168.127.1 dev eth0 table temp

I have standard iptables NAT rules for a host on that network:

iptables -t nat -A POSTROUTING -s 192.168.1.10 -j SNAT --to-source A.B.C.D

iptables -t nat -A PREROUTING -d A.B.C.D -j DNAT --to-destination 
192.168.1.10

**********

I suspect though, that this mode of routing (as opposed to using the 
"regular" table via "route add default") is somehow hosing my iptables NAT?

At least sniffing the egress interface now shows the traffic heading out 
with its NATted address of 192.168.1.10.

Newbie here, I guess.  Can someone help/enlighten?

Thx.

B.

