From: =?iso-8859-1?Q?St=E9phane_Klein?= <sklein@aquitaine-valley.fr>
Subject: RE: sqlnet 8 connexion and iptables 1.2.6a
Date: Fri, 4 Apr 2003 14:06:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <C92390AC8CA2D3119A2800508B6711B401406B1D@PHOSOIRAK>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: "'richardo@start-global.com'" <richardo@start-global.com>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

iptables -L gives me:

Chain INPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere           state
RELATED,ESTABLISHED
RULE_1     all  --  oracle_srv_ip        anywhere           state NEW
RULE_2     all  --  192.168.0.41         anywhere           state NEW
RULE_3     all  --  anywhere             anywhere

Chain FORWARD (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere           state
RELATED,ESTABLISHED
RULE_0     icmp --  anywhere             oracle_srv_ip      icmp type 8 =
code
0 state NEW
RULE_0     tcp  --  anywhere             oracle_srv_ip      tcp =
dpt:1521
state NEW
RULE_1     all  --  oracle_srv_ip        anywhere           state NEW
RULE_2     all  --  192.168.0.41         anywhere           state NEW
RULE_3     all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere           state =
RELATED

Chain OUTPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere           state
RELATED,ESTABLISHED
RULE_0     icmp --  anywhere             194.250.29.100     icmp type 8 =
code
0 state NEW
RULE_0     tcp  --  anywhere             194.250.29.100     tcp =
dpt:1521
state NEW
RULE_3     all  --  anywhere             anywhere

Chain RULE_0 (4 references)
target     prot opt source               destination
LOG        all  --  anywhere             anywhere           LOG level =
debug
prefix `RULE 0 -- ACCEPT '
ACCEPT     all  --  anywhere             anywhere

Chain RULE_1 (2 references)
target     prot opt source               destination
LOG        all  --  anywhere             anywhere           LOG level =
info
prefix `RULE 1 -- ACCEPT '
ACCEPT     all  --  anywhere             anywhere

Chain RULE_2 (2 references)
target     prot opt source               destination
LOG        all  --  anywhere             anywhere           LOG level =
info
prefix `RULE 2 -- ACCEPT '
ACCEPT     all  --  anywhere             anywhere

Chain RULE_3 (3 references)
target     prot opt source               destination
LOG        all  --  anywhere             anywhere           LOG level =
info
prefix `RULE 3 -- DROP '
DROP       all  --  anywhere             anywhere



-----Message d'origine-----
De : richardo@start-global.com [mailto:richardo@start-global.com]
Envoy=E9 : vendredi 4 avril 2003 13:51
=C0 : St=E9phane Klein
Objet : Re: sqlnet 8 connexion and iptables 1.2.6a



Hi Stephane,

Are you allowing RELATED and ESTABLISHED packets back through the =
firewall
? if not, it may solve the problem ....


Regards,
Richard.

Richard Oatridge
Head of IT, Start-global Ltd
http://www.start-global.com
tel :  +44 1564 779297
email : richardo@start-global.com



