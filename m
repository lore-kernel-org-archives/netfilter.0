From: Xemul <epv_xemul@mail.ru>
Subject: Double nat
Date: Fri, 18 Jul 2003 20:31:22 +0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030718203122.0f105933.epv_xemul@mail.ru>
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

Well here goes my network configuration.
I have two computers.
1st has two ifs:
eth0 192.168.2.91
eth1 172.16.1.1
2nd has one if:
eth0 172.16.1.2

On 192.168.2.0/24 subnet I have a 192.168.2.254 router (I can't admin
it) which provides NAT for the 192.168.2.0 subnet.

I want to make NAT for my 2nd comp on the 1st one.

I do the following on the 1st comp:

#/sbin/iptables -A POSTROUTING -t nat -s 192.168.1.0/24 -j SNAT
--to-source 192.168.2.91
#/sbin/iptables -A FORWARD -i eth0 -o eth1 -m state --state
RELATED,ESTABLISHED -j ACCEPT
#/sbin/iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT

The 2nd comp has default router set to 172.16.1.1.

Everything goes fine but nothing works.
I can see with tcpdump all incoming packets from eth1 but I can't see
any outgoing from eth0 corresponding to them.
What should I do?

