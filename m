From: "Postmaster" <iptables-pmd0052@promind.de>
Subject: question about -t nat
Date: Sat, 19 Jun 2004 18:46:48 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000501c4561d$0495e830$6900a8c0@W2K>
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
To: netfilter@lists.netfilter.org

hello list-users,

i want clean up my pre- and postrouting chains with rules like this:

iptables -t nat -A PREROUTING -i eth0 -j first_group
iptables -t nat -A PREROUTING -i eth1 -j second_group

iptables -t nat first_group -s a.b.c.d -d x/y -p tcp --sport
1024:65535 --dport 10001 -j DNAT --to-destination 1.2.3.4:25
iptables -t nat second_group -s a.b.c.d -d x/y -p tcp --sport
1024:65535 --dport 10002 -j DNAT --to-destination 4.5.6.7:25

is there any modul which makes this possible?


best regards

Jan


