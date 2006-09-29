From: Lucas Diaz <lucasdiaz@eternet.cc>
Subject: NAT with marked packets
Date: Fri, 29 Sep 2006 11:41:45 -0300
Message-ID: <451D30A9.1030406@eternet.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

That's how I'm marking them.
iptables -A PREROUTING -t mangle -j CONNMARK --restore-mark
iptables -A PREROUTING -t mangle -m mark ! --mark 0 -j ACCEPT
iptables -A PREROUTING -t mangle -m layer7 --l7proto http
iptables -A PREROUTING -t mangle -m layer7 --l7proto dns
iptables -A PREROUTING -t mangle -m layer7 --l7proto pop3
iptables -A PREROUTING -t mangle -m layer7 --l7proto smtp
iptables -A PREROUTING -t mangle -m layer7 --l7proto msnmessenger
iptables -A PREROUTING -t mangle -m layer7 --l7proto unknown -j MARK 
--set-mark 10
iptables -A PREROUTING -t mangle -m mark --mark 10 -j CONNMARK --save-mark

Then I do QOS with -j CLASSIFY in table mangle chain POSTROUTING using 
those marked packets.
That's working very well.

My problem is that I also need to SNAT to a specific IP those marked 
packets, and I can't match'em.
No packets go through
                                    iptables -A POSTROUTING -t nat -m 
mark --mark 10 -j SNAT --to x.x.x.x

Thanx a lot.

