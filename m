From: zhongyu <zhongyu@ecfounder.com>
Subject: Bug fixed
Date: Mon, 10 Jun 2002 16:23:34 +0800
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D046206.5030100@ecfounder.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Fix iptable_nat's memory leak problem.

--- linux-orig/net/ipv4/netfilter/ip_nat_core.c Mon Jun 10 16:15:10 2002
+++ linux/net/ipv4/netfilter/ip_nat_core.c Mon Jun 10 16:17:30 2002
@@ -913,4 +913,5 @@
{
ip_ct_selective_cleanup(&clean_nat, NULL);
ip_conntrack_destroyed = NULL;
+ vfree(bysource);
}


