From: Brian McNally <bmcnally@u.washington.edu>
Subject: "iptables: No chain/target/match by that name"
Date: Thu, 21 Dec 2006 10:48:37 -0800
Message-ID: <2FFB10CA-345B-432D-9669-128232B12051@u.washington.edu>
Mime-Version: 1.0 (Apple Message framework v752.3)
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
To: netfilter@lists.netfilter.org

Hello,

I'm running Red Hat Enterprise Linux 3 with the 2.4.21-27.0.2.ELsmp  
kernel and iptables 1.2.8. When I try and insert the following rule:

iptables -A PREROUTING -p tcp -m tcp --dport 80 -j REDIRECT --to- 
ports 8080

I get the following error:

iptables: No chain/target/match by that name

$ lsmod | grep ipt
iptable_nat            22808   0  (autoclean) (unused)
ipt_REJECT              4632   1  (autoclean)
ipt_state               1080   5  (autoclean)
ip_conntrack           29800   2  (autoclean) [iptable_nat ipt_state]
iptable_filter          2412   1  (autoclean)
ip_tables              16544   6  [iptable_nat ipt_REJECT ipt_state  
iptable_filter]

Any ideas? I'm wondering if I'm missing a kernel module that iptables  
needs, but my understanding was that it should load the modules it  
needs on the fly.

Thanks,

--
Brian McNally



