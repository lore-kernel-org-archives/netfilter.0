From: "Ginter, Jeff A" <Jeff.Ginter@ca.com>
Subject: Rules for localhost, help needed.
Date: Mon, 25 Jul 2005 16:54:03 -0400
Message-ID: <B80488675062364A909EE60F4A66603807E15FDE@usilms23.ca.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
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

On occasion, I configure iptables via webmin.  I am having a strange
problem where when I apply the rules from that GUI that it never comes
back.  If I close the web browser and restart, I can see everything
again, but it looks like I get cut off.  Also, I occasionally get some
redhat GUI issues as well and I think it's because of my rulebase.
These issues do not happen when I am connected remotely.

=20

I have my ruleset below...am I missing anything for local that anyone
can see.

=20

Thanks in advance...very appreciated.

=20

RULES

[root@mae-fw ~]# iptables -L

Chain INPUT (policy DROP)

target     prot opt source               destination

DROP       all  --  192.168.222.0/24     anywhere

DROP       all  --  138.42.156.0/24      anywhere

ACCEPT     all  --  anywhere             anywhere            state
RELATED,ESTABLISHED

ACCEPT     tcp  --  anywhere             anywhere            tcp
multiport dports ssh,10000 state NEW

DROP       all  --  anywhere             anywhere

=20

Chain FORWARD (policy DROP)

target     prot opt source               destination

DROP       all  --  192.168.222.0/24     anywhere

DROP       all  --  138.42.156.0/24      anywhere

ACCEPT     all  --  anywhere             anywhere            state
RELATED,ESTABLISHED

ACCEPT     udp  --  anywhere             anywhere            udp
dpt:domain

ACCEPT     tcp  --  anywhere             anywhere            tcp

ACCEPT     icmp --  anywhere             anywhere

ACCEPT     tcp  --  anywhere             anywhere            tcp
multiport dports
ftp-data,ftp,ssh,telnet,domain,http,https,webcache,3389,5800,5801

DROP       all  --  anywhere             anywhere

=20

Chain OUTPUT (policy DROP)

target     prot opt source               destination

ACCEPT     all  --  anywhere             anywhere            state
NEW,RELATED,ESTABLISHED

=20

=20

NATS

[root@mae-fw ~]# iptables -t nat -L

Chain PREROUTING (policy ACCEPT)

target     prot opt source               destination

DNAT       all  -- !192.168.222.0/24     Etrust-scc.ca.com
to:192.168.222.101

DNAT       all  -- !192.168.222.0/24     Etrust-audit.ca.com
to:192.168.222.165

DNAT       all  -- !192.168.222.0/24     Etrust-pc.ca.com
to:192.168.222.130

DNAT       all  -- !192.168.222.0/24     Etrust-ws1.ca.com
to:192.168.222.100

DNAT       all  -- !192.168.222.0/24     Etrust-uni.ca.com
to:192.168.222.102

DNAT       all  -- !192.168.222.0/24     Etrust-vm.ca.com
to:192.168.222.115

DNAT       all  -- !192.168.222.0/24     Itrmsrv01.ca.com
to:192.168.222.150

=20

Chain POSTROUTING (policy ACCEPT)

target     prot opt source               destination

SNAT       all  --  192.168.222.0/24     anywhere
to:138.42.156.15

=20

Chain OUTPUT (policy ACCEPT)

target     prot opt source               destination

=20

=20

=20

Jeff Ginter, CISSP

Computer Associates

Mid-Atlantic Total Protection

Consulting Manager

Office:  (908) 874-9726

Mobile:  (609) 577-1494

jeff.ginter@ca.com

=20

=20

