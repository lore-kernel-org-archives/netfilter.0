From: =?iso-8859-1?Q?St=E9phane_Klein?= <sklein@aquitaine-valley.fr>
Subject: RE: sqlnet 8 connexion and iptables 1.2.6a
Date: Mon, 7 Apr 2003 10:23:46 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <C92390AC8CA2D3119A2800508B6711B401406B57@PHOSOIRAK>
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

Hi,=20

Thanks for your interest and response.

I looked for interesting logs last week, and i found sqlnet in working =
like
this:

first, the client connects to the server on 1521 port, second, the =
server
tells client to connect to=20
a random port. At last, the client try to connect to the server, but =
the
port is not opened.

I was thinking the related component could help to resolve the problem, =
but
it is not the case.
Here are the logs:

Apr  4 12:55:26 fw kernel: RULE 0 -- ACCEPT IN=3Deth0 OUT=3Deth0
SRC=3D192.168.0.208 DST=3DORACLE-IP LEN=3D44 TOS=3D0x00 PREC=3D0x00 =
TTL=3D127 ID=3D463 DF
PROTO=3DTCP SPT=3D1487 DPT=3D1521 WINDOW=3D8192 RES=3D0x00 SYN URGP=3D0
Apr  4 12:55:26 fw kernel: RULE 3 -- DROP IN=3Deth0 OUT=3Deth0 =
SRC=3D192.168.0.208
DST=3DORACLE-IP LEN=3D44 TOS=3D0x00 PREC=3D0x00 TTL=3D127 ID=3D1999 DF =
PROTO=3DTCP
SPT=3D1488 DPT=3D1089 WINDOW=3D8192 RES=3D0x00 SYN URGP=3D0
Apr  4 12:55:36 fw kernel: RULE 3 -- DROP IN=3D OUT=3Deth0 =
SRC=3D192.168.0.239
DST=3D192.168.0.208 LEN=3D72 TOS=3D0x00 PREC=3D0xC0 TTL=3D255 =
ID=3D26567 PROTO=3DICMP
TYPE=3D5 CODE=3D1 GATEWAY=3DORACLE-IP [SRC=3D192.168.0.208 =
DST=3DORACLE-IP LEN=3D44
TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D9423 DF PROTO=3DTCP SPT=3D1488 =
DPT=3D1089
WINDOW=3D8192 RES=3D0x00 SYN URGP=3D0 ]
Apr  4 12:55:36 fw kernel: RULE 3 -- DROP IN=3Deth0 OUT=3Deth0 =
SRC=3D192.168.0.208
DST=3DORACLE-IP LEN=3D44 TOS=3D0x00 PREC=3D0x00 TTL=3D127 ID=3D9423 DF =
PROTO=3DTCP
SPT=3D1488 DPT=3D1089 WINDOW=3D8192 RES=3D0x00 SYN URGP=3D0
Apr  4 12:55:49 fw kernel: RULE 3 -- DROP IN=3D OUT=3Deth0 =
SRC=3D192.168.0.239
DST=3D192.168.0.208 LEN=3D72 TOS=3D0x00 PREC=3D0xC0 TTL=3D255 =
ID=3D26568 PROTO=3DICMP
TYPE=3D5 CODE=3D1 GATEWAY=3DORACLE-IP [SRC=3D192.168.0.208 =
DST=3DORACLE-IP LEN=3D44
TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D10191 DF PROTO=3DTCP SPT=3D1488 =
DPT=3D1089
WINDOW=3D8192 RES=3D0x00 SYN URGP=3D0 ]
Apr  4 12:55:49 fw kernel: RULE 3 -- DROP IN=3Deth0 OUT=3Deth0 =
SRC=3D192.168.0.208
DST=3DORACLE-IP LEN=3D44 TOS=3D0x00 PREC=3D0x00 TTL=3D127 ID=3D10191 DF =
PROTO=3DTCP
SPT=3D1488 DPT=3D1089 WINDOW=3D8192 RES=3D0x00 SYN URGP=3D0

192.168.0.239 is an ip of the firewall, 208 is the client.

regards=20

Stephane

-----Message d'origine-----
De : richardo@start-global.com [mailto:richardo@start-global.com]
Envoy=E9 : lundi 7 avril 2003 09:58
=C0 : St=E9phane Klein
Objet : RE: sqlnet 8 connexion and iptables 1.2.6a



Hi Stephane,

The rules below look as though they do allow RELATED and ESTABLISHED
packets back through the firewall ... there are some logging rules, are =
you
getting any relevant information in the log files ?

Regards,
Richard.

Richard Oatridge
Head of IT, Start-global Ltd
http://www.start-global.com
tel :  +44 1564 779297
email : richardo@start-global.com


|--------+----------------------------------->
|        |          St=E9phane Klein           |
|        |          <sklein@aquitaine-valley.|
|        |          fr>                      |
|        |          Sent by:                 |
|        |          netfilter-admin@lists.net|
|        |          filter.org               |
|        |                                   |
|        |                                   |
|        |          04/04/2003 13:06         |
|        |                                   |
|--------+----------------------------------->
=20
>-----------------------------------------------------------------------=
----
----------------------------------------------|
  |
|
  |       To:     "'richardo@start-global.com'" =
<richardo@start-global.com>
|
  |       cc:     "'netfilter@lists.netfilter.org'"
<netfilter@lists.netfilter.org>                                         =
|
  |       Subject:     RE: sqlnet 8 connexion and iptables 1.2.6a
|
=20
>-----------------------------------------------------------------------=
----
----------------------------------------------|




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
RULE_0     icmp --  anywhere             oracle_srv_ip      icmp type 8
code 0 state NEW
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
RULE_0     icmp --  anywhere             194.250.29.100     icmp type 8
code 0 state NEW
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






