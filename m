From: strenuus <strenuus@sezampro.yu>
Subject: Packets passing trough...
Date: Wed, 13 Nov 2002 20:33:39 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DD2A913.9030100@sezampro.yu>
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

Output from iptables -L -nvx

---
Chain FORWARD (policy ACCEPT 161696 packets, 47270419 bytes)
     pkts      bytes target     prot opt in     out     source               destination
    61547  6434012             all  --  *       eth1    192.168.0.0/24       !192.168.1.0/24
    59305 36440468             all  --  eth1    *       !192.168.1.0/24       192.168.0.0/24
    20358  1239485             all  --  *       eth1    192.168.1.0/24       !192.168.0.0/24
    20322  3148918             all  --  eth1    *      !192.168.0.0/24        192.168.1.0/24
     3241   561174             all  --  *       *       194.106.188.0/28      192.168.0.0/24
       42     5260             all  --  *       *       194.106.188.0/28      192.168.1.0/24
---

How is this possible, wouldn't all packets match first 4 rules and never get to 6 and 7?
Interface eth1 goes to internet (snat is on) and eth0 and eth2 are LAN (192.168.0.0 and 192.168.1.0)




