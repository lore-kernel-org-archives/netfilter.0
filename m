From: "David Busby" <busby@pnts.com>
Subject: SNAT kills local stuff?
Date: Mon, 14 Jul 2003 11:29:30 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00ec01c34a35$e5c6d0c0$1100000a@busbydev>
Reply-To: "David Busby" <busby@pnts.com>
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

List,
    Perhaps I'm missing something, when I enable SNAT it makes it so I can't
resolve names anymore on my machine or make outbound connections it seems.

My Setup:
[ Local (10./24) ] <-> [ netfilter ] <-> [ Internet ]

So I setup iptables like this:
root@repono:/etc# iptables -t filter -L
Chain INPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere           state
RELATED,ESTABLISHED
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:ssh
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:domain
ACCEPT     udp  --  anywhere             anywhere           udp dpt:domain
LOG        all  --  anywhere             anywhere           LOG level
warning

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
root@repono:/etc

Everything is OK, Lan can resolve names and such.

Now I add:
iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to $EXTERNAL_IP
And it all works, this command:
iptables -t nat -A POSTROUTING -s 10.0.0.0/24 -j SNAT --to $EXTERNAL_IP
Doesn't work. The LAN is fine, but the localbox cannot connect out.
What is so different about those two commands?

David Busby
Systems Engineer
busby@pnts.com


