From: <linuxmail@ntlworld.com>
Subject: Issues route advanced routing + masq in  2.6
Date: Thu, 18 Dec 2003 16:40:18 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031218164037.LEZJ19387.mta05-svc.ntlworld.com@[10.137.100.64]>
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

I've been running my current network configuration for over a year on the 2.4.xx kernels without any issue. I've recently been using 2.6.0-test11 and without any configuration changes I'm having issues with advanced routing combined with masquerading.

To reproduce the problem here is a simplified breakdown of my configuration.

eth0 : Internal Network
eth1 : ADSL modem
eth2 : Cable modem

The default route for all traffic is the ADSL modem but certain protocols/machines route across the cable modem. The cable modem only has a single publish IP (bound to eth1) and, therefore, it is necessary to NAT.

So....

iptables -A POSTROUTING -s internal_pc_ip -d ! LOCALNET -o eth1 -t nat -j MASQUERADE

ip rule add from internal_pc_ip table cm prio 1000

ip route add default via eth1_ip dev eth1 table cm

----

This works fine on the 2.4.22 kernel but in 2.6 traffic destined for the cable modem generates a "MASQUERADE: Route sent us somewhere else." error.

Apologies if I've missed something but any held in diagnosing the problem would be appreciated.

Steve.

-----------------------------------------
Email provided by http://www.ntlhome.com/



