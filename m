From: "louie miranda" <lmiranda@chikka.com>
Subject: can't connect to another network on my masq lan
Date: Wed, 26 Feb 2003 17:30:49 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <027301c2dd79$c4b988b0$0b00000a@nocpc3>
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
To: netfilter@lists.samba.org

-- my route
panic:/# route -n
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface
203.190.72.104  0.0.0.0         255.255.255.248 U     0      0        0 eth0
192.168.129.0   10.0.0.2        255.255.255.0   UG    0      0        0 eth1
10.0.0.0        0.0.0.0         255.255.0.0     U     0      0        0 eth1
0.0.0.0         203.190.72.110  0.0.0.0         UG    0      0        0 eth0

-- my masq
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE


I can connect to 192.168.129.x but, on my workstation inside my masq lan
I cannot, whats wrong?



--
thanks,
louie miranda



