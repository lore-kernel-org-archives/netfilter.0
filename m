From: Brett Curtis <dashnu@gmail.com>
Subject: x_tables xt_esp match problem.
Date: Wed, 23 Aug 2006 14:18:16 -0400
Message-ID: <D437F596-3DAB-43DB-88D5-1829EF835672@gmail.com>
Mime-Version: 1.0 (Apple Message framework v752.2)
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: Netfilter Lists <netfilter@lists.netfilter.org>

Hello

I was using a 2.6.14 kernel with a esp match mark rule for my ipsec  
connection. However with kernel 2.6.17 iptables will not match esp  
packets with the same rule.

iptables -t mangle -A INPUT --proto esp -j MARK --set-mark 1
iptables -A INPUT -i eth0 -m mark --mark 1 -j LOG --log-prefix "Mark 1:"
iptables -A INPUT -i eth0 -m mark --mark 1 -j ACCEPT

My ipsec connection uses NAT-T and the esp packets are encapsulated  
inside UDP 4500. If I match and mark port 4500 udp my VPN works as  
expected.

Did something change related to the matching of esp packets that I am  
not aware of?

Thanks for your time.

-BC

Brett Curtis
dashnu@gmail.com
http://teh.sh.nu




