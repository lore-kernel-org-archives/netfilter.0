From: Brent Clark <bclark@eccotours.co.za>
Subject: layer 7
Date: Fri, 05 Jan 2007 14:46:30 +0200
Message-ID: <459E48A6.4030206@eccotours.co.za>
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

Hey all

Was wondering if someone could please help.

Im trying go get layer7 working, problem is that I dont see it in /lib/iptables.

Weird thing is I patched the kernel and its even loaded

root@cptgate:/lib/iptables# lsmod | grep -i layer
ipt_layer7             10788  0
x_tables               13252  22 
ipt_layer7,ipt_TOS,ipt_SET,ipt_TARPIT,ipt_ROUTE,ip6t_LOG,ip6_tables,ipt_owner,ipt_hashlimit,ipt_SAME,ipt_REDIRECT,iptable_nat,ipt_TCPMSS,ipt_TTL,ipt_CLUSTERIP,ip_tables,ipt_LOG,ipt_MASQUERADE,ipt_REJECT,ipt_ULOG,ipt_iprange,xt_MARK
root@cptgate:/lib/iptables#

My question is, do I have to get the source and compile iptables its, or can have I missed something.
I comparing from using patchomatic, a part from having the source, not much more was needed.

If someone could assist, I would greatfully be appreciated.

Kind Regards
Brent Clark

