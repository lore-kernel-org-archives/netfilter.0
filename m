From: Mart Pirita <mart.pirita@e-positive.ee>
Subject: iptables-1.2.7a bug?
Date: Fri, 6 Sep 2002 13:03:35 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <p05111b09b99e2c56b604@[192.168.30.10]>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello.


Im running on RedHat 6.2, 2.4.19 kernel and iptables-1.2.6a, and 
everithing worked fine, but after I upgraded to iptables-1.2.7a and 
applied patch-o-matic-20020825 pathes, I get error messages:


Sep  6 12:22:53 www kernel: ASSERT ip_conntrack_core.c:1063 
&ip_conntrack_lock not readlocked
Sep  6 12:22:53 www kernel: ASSERT ip_conntrack_core.c:1074 
&ip_conntrack_lock not readlocked
Sep  6 12:22:53 www kernel: ASSERT: ip_nat_core.c:839 
&ip_conntrack_lock not readlocked
Sep  6 12:22:53 www kernel: ASSERT ip_conntrack_core.c:94 
&ip_conntrack_lock readlocked


So I recompiled kernel without patch-o-matic-20020825 pathes and with 
ipables-1.2.7a, still same errors. So I downgraded iptables to 1.2.6a 
and no errors occurred. Is there some bug or something or what is the 
problem?

-- 
Mart Pirita

e-positive.ee
Joa 2, Tallinn
10127, Estonia
Tel. +372 6060909
Fax. +372 6060910

