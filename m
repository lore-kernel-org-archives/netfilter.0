From: Alexander Lay <Alexander.Lay@gmx.de>
Subject: DNAT for ongoing UDP flows
Date: Sat, 03 Dec 2005 18:03:35 +0100
Message-ID: <584Q3slIoxJmAE9GGpFKDnHSMtx6Ju8DOlQWsPjrOt0@akmail>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

i need to dynamically change the destination IP address
of UDP packets for an ongoing UDP flow. That means
when the flow starts for the first time no change
is needed and after some time a change of the destination
IP address must be done to redirect the packets to another
machine dynamically. For new flows this could be done using e.g.:
iptables -t nat -A OUTPUT/PREROUTING  -p udp --destination-port 1111
-d 192.168.2.10 -j DNAT --to-destination 192.168.1.2:2222

The problem is that this rule is only used for new flows
and not for ongoing flows as already discussed in february 2003
here:
<https://lists.netfilter.org/pipermail/netfilter-devel/2003-February/010577.html>

The proposed solutions there are not applicable. Interesting
was solution C) (ctnetlink extension) but it seems to me that
this extension only allows matching of flows and not changing
rules for ongoing flows.

In addition i am looking for a possibility to flush tables/rules
for ongoing flows to switch back to the old destination IP
address in a last step by removing the DNAT rule.
iptables -t nat -F flushes rules but again not for ongoing flows.

Perhaps there are some new possibilities since february 2003
or someone has new or additional ideas. Thanks.

BTW, i am using SuSE 10, Kernel 2.6.13-15-default, iptables v1.3.3.

best regards,
  Alex


