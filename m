From: funny guy <asteriskmail@yahoo.com>
Subject: Multiple PPTP clients behind NAT
Date: Sun, 12 Sep 2004 19:22:08 -0700 (PDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040913022208.11511.qmail@web52510.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Dear All,

I wish to establish multiple PPTP connection through
and linux NAT machine with the following scenario:

PPTP client 1->|                       |->PPTP Server
1
               |                       |
PPTP client 2->|                       |->PPTP Server
2
               |->NAT->...Internet...->|
... ... ...  ->|                       |->... ... ...
               |                       |
PPTP client n->|                       |->PPTP Server
n

I recompiled Kernel 2.4.26 with the patch
patch-o-matic-20031219 from www.netfilter.org and I
recompiled iptables v1.2.11

I have the required modules loaded:
ip_conntrack_proto_gre
ip_conntrack_pptp
ip_nat_proto_gre
ip_nat_pptp
iptable_nat
ip_conntrack
ip_tables
iptable_filter

However, the iptables rules stated in
http://www.netfilter.org/patch-o-matic/pom-extra.html#pom-extra-pptp-conntrack-nat
are incomplete. Therefore, I cannot establish multiple
connections successfully. The scenario is as
following:
1. I can setup two connections at the same time (the
signalling seems working)
2. However, only one client is able to ping the
machines in the server network 
3. If two machines try to ping at that same time, one
of them will fail (the data path seems not working)

Can anyone suggest the correct iptable rules for me?
or anyone can give me other helps?

Thanks in advance.


		
__________________________________
Do you Yahoo!?
Yahoo! Mail - 50x more storage than other providers!
http://promotions.yahoo.com/new_mail

