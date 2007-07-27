From: =?ISO-8859-1?Q?=22jose_a=2E_z=FA=F1iga=22?= <zuniga@baibrama.cult.cu>
Subject: problem with  postrouting chain
Date: Fri, 27 Jul 2007 12:14:12 +0200
Message-ID: <46A9C574.70701@baibrama.cult.cu>
Reply-To: zuniga@baibrama.cult.cu
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

Hi:

I'm running pre compilied 2.6.18-4 kernel on debian etch.

I=B4ve load this modules:

ip_nat_irc
ip_conntrack_irc
iptable_nat
ip_tables
ip_nat_ftp
ip_nat
ip_conntrack_ftp
ip_conntrack

When I try to run this rules:

/sbin/iptables -A POSTROUTING -s 192.168.1.0/24 -d XXX.XXX.XXX.XXX -o=20
YYY.YYY.YYY.YYY -p tcp -m tcp --dport 110 -j SNAT --to-source=20
YYY.YYY.YYY.YYY

I get this error.

iptables: No chain/target/match by that name

If I insert chain type: INPUT, OUTPUT or FORWARD they run without problem.

What's happen exactly???? There's a problem in kernel?

Thanks

Zng


