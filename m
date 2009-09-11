From: Jacob Svensson <me@jacobsvensson.se>
Subject: Iptables-restore removing the wrong rules?
Date: Fri, 11 Sep 2009 15:44:10 +0200
Message-ID: <9e00edfe0909110644w3766019fn698aa61c7047271@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

I'm having some troubles with a set of iptable rules. When setting the
sequence with iptables everything is fine, but if I'm using
iptables-restore, the wrong rules get removed at a certain point.
This is the smallest subset of rules that i have been able to find
that reproduce the problem.
As you can see, when trying to remove the rules ending with 60007, the
60009 are removed.

Is this a bug, or do I miss use iptables-restore?

-------------------------

user@user-laptop:~$ sudo iptables -t nat -L -n
Chain PREROUTING (policy ACCEPT)
target=A0=A0=A0=A0 prot opt source=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 destination

Chain POSTROUTING (policy ACCEPT)
target=A0=A0=A0=A0 prot opt source=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 destination
test_POSTROUTING=A0 all=A0 --=A0 0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 0.0.0.0/0

Chain OUTPUT (policy ACCEPT)
target=A0=A0=A0=A0 prot opt source=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 destination
test_OUTPUT=A0 all=A0 --=A0 0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
0.0.0.0/0

Chain test_OUTPUT (1 references)
target=A0=A0=A0=A0 prot opt source=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 destination

Chain test_POSTROUTING (1 references)
target=A0=A0=A0=A0 prot opt source=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 destination
user@user-laptop:~$ sudo iptables-restore -n
*nat
-F
COMMIT
*mangle
-F
COMMIT
*nat
-X
COMMIT
*mangle
-X
COMMIT
*nat
-N test_POSTROUTING
-I POSTROUTING -j test_POSTROUTING
-N test_OUTPUT
-I OUTPUT -j test_OUTPUT
COMMIT
*mangle
-N test_POSTROUTING
-I POSTROUTING -j test_POSTROUTING
COMMIT
*nat
-I test_POSTROUTING -p udp -s 192.168.1.5 --sport 50001 -d 192.168.1.5
--dport 40001 -j SNAT --to 192.168.1.1:60007
-I test_POSTROUTING -p udp -s 192.168.1.5 --sport 40001 -d 192.168.1.5
--dport 50001 -j SNAT --to 10.76.50.70:60007
COMMIT
*mangle
-I test_POSTROUTING -p udp -s 192.168.1.5 --sport 40000 -d 192.168.1.5
--dport 50000 -j DSCP --set-dscp 46
COMMIT
*nat
-I test_POSTROUTING -p udp -s 192.168.1.5 --sport 50001 -d 192.168.1.5
--dport 40001 -j SNAT --to 192.168.1.1:60009
-I test_POSTROUTING -p udp -s 192.168.1.5 --sport 40001 -d 192.168.1.5
--dport 50001 -j SNAT --to 10.76.50.70:60009
COMMIT
*nat
-D test_POSTROUTING -p udp -s 192.168.1.5 --sport 50001 -d 192.168.1.5
--dport 40001 -j SNAT --to 192.168.1.1:60007
-D test_POSTROUTING -p udp -s 192.168.1.5 --sport 40001 -d 192.168.1.5
--dport 50001 -j SNAT --to 10.76.50.70:60007
COMMIT
user@user-laptop:~$ sudo iptables -t nat -L -n
Chain PREROUTING (policy ACCEPT)
target=A0=A0=A0=A0 prot opt source=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 destination

Chain POSTROUTING (policy ACCEPT)
target=A0=A0=A0=A0 prot opt source=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 destination
test_POSTROUTING=A0 all=A0 --=A0 0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 0.0.0.0/0

Chain OUTPUT (policy ACCEPT)
target=A0=A0=A0=A0 prot opt source=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 destination
test_OUTPUT=A0 all=A0 --=A0 0.0.0.0/0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
0.0.0.0/0

Chain test_OUTPUT (1 references)
target=A0=A0=A0=A0 prot opt source=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 destination

Chain test_POSTROUTING (1 references)
target=A0=A0=A0=A0 prot opt source=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 destination
SNAT=A0=A0=A0=A0=A0=A0 udp=A0 --=A0 192.168.1.5=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 192.168.1.5=A0=A0=A0=A0=A0=A0=A0=A0 udp
spt:40001 dpt:50001 to:10.76.50.70:60007
SNAT=A0=A0=A0=A0=A0=A0 udp=A0 --=A0 192.168.1.5=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 192.168.1.5=A0=A0=A0=A0=A0=A0=A0=A0 udp
spt:50001 dpt:40001 to:192.168.1.1:60007

----------------------------------

Best Regards
Jacob Svensson
