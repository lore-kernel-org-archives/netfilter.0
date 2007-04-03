From: "Rafael Dewes" <rafael.dws@gmail.com>
Subject: Iptables - Error: No chain/target/match by that name
Date: Tue, 3 Apr 2007 18:18:57 -0300
Message-ID: <cdcab2540704031418m1c25bf55hbcfabf8340db546b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=BKh4yHTgeuVuHv+zPptYJ9TH3aZiC6znhQgSJHCxnw1hUNmdtAcRjajLHYmn9lFCB94tEmSh/qI2TR10NDai/AfMQVG7AFiTVNNWlbQ132zyCi/UNI7StH8Zy6/7emqn2agqCn/VCLo6V+ZBFs4GbVC3gKeOqlCU5ZwMQMIKIyY=
Content-Disposition: inline
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

Friends, I am using iptables 1.5.7 + linux kernel 2.6.20.2 and the
last patch-o-magic.

But, when I exec this rule
iptables -I INPUT -s 192.168.0.0/24 -p tcp --dport 21 -j ACCEPT
This error occurs
iptables: No chain/target/match by that name

This occurs in the chain ACCEPT, DROP and REJECT, but if I modify the
rule for the following one:
iptables -I INPUT -s 192.168.0.0/24 -p tcp -j ACCEPT
or
iptables -I INPUT -s 192.168.0.0/24 -j ACCEPT

it is accepted, the error only occurs when I specify the the origin or
destination port.

Any Ideas to solve this?
Thanx.

iptables -L output:
Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

modules loaded:
/sbin/modprobe ipt_REDIRECT
/sbin/modprobe ipt_state
/sbin/modprobe ipt_recent
/sbin/modprobe ipt_MASQUERADE
/sbin/modprobe ipt_LOG
/sbin/modprobe ip_tables
/sbin/modprobe iptable_filter
/sbin/modprobe iptable_nat
/sbin/modprobe ipt_conntrack
/sbin/modprobe ip_conntrack

