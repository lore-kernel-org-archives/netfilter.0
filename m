From: Wouter <wouter-netfilter@publica.duodecim.org>
Subject: module order: tcp/conntrack vs. conntrack/tcp
Date: Mon, 02 Jul 2012 08:02:19 -0400
Message-ID: <9bfb14742a7ec35d775699fc955f437b@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org


=0D
Hello,=0D
=0D
I'm wondering about the practical difference between these seemingly=0D
equivalent rules (notice the module order):=0D
=0D
iptables -A INPUT -i eth0 -p tcp --dport 8140 -m state --state NEW -j=0D
ACCEPT=0D
iptables -A INPUT -i eth0 -p tcp -m state --state NEW -m tcp --dport 81=
40=0D
-j ACCEPT=0D
=0D
[root@test1 ~]# iptables -L=0D
Chain INPUT (policy ACCEPT)=0D
target     prot opt source               destination=0D
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:81=
40=0D
state NEW=0D
ACCEPT     tcp  --  anywhere             anywhere            state NEW =
tcp=0D
dpt:8140=0D
=0D
Rule 1: TCP --> state=0D
Rule 2: state --> TCP=0D
=0D
While I always use the form of rule 1 (filter first, then state NEW), I=
=0D
found some systems configured like rule 2 =E2=80=93 which appears to ha=
ve the same=0D
end result =E2=80=93 and I wonder if rule 2 (state first, then filter) =
has any side=0D
effects or causes more overhead.=0D
=0D
Thanks for for any insight!=0D
=0D
  Wouter
