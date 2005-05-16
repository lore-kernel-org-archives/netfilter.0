From: "Clemente Aguiar" <caguiar@madeiratecnopolo.pt>
Subject: ICMP and conntrack
Date: Mon, 16 May 2005 12:21:24 +0100
Message-ID: <6A0C419392D7BA45BD141D0BA4F253C776DF@loureiro.madeiratecnopolo.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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


I do not know if this issue has been raised yet.

On a TCP or UDP protocol, if there are communication problems a ICMP
"responses" are generated.
Does conntrack handle all ICMP "responses" correctly?

The responses that I can think of are:
3 Destination Unreachable
11 Time to live Exceeded
4 Source Quench

The reason why I am asking is that I have a rules such as:

-A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
-A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
-A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

....

-A OUTPUT  -j RULE_DROP=20
-A INPUT  -j RULE_DROP=20
-A FORWARD  -j RULE_DROP=20
-A RULE_DROP   -m limit --limit 5/second -j LOG  --log-level info
--log-prefix "RULE DROP -- "
-A RULE_DROP  -j DROP=20

And I still see ICMP types which should be handled by conntrack in the =
log
file as, such as:

May 16 12:04:23 fw RULE DROP -- IN=3Deth0 OUT=3Deth1 =
SRC=3D68.121.146.134
DST=3D62.53.192.175 LEN=3D56 TOS=3D0x00 PREC=3D0xE0 TTL=3D42 ID=3D44796 =
PROTO=3DICMP
TYPE=3D3 CODE=3D3 [SRC=3D62.53.192.175 DST=3D68.121.146.134 LEN=3D85 =
TOS=3D0x00
PREC=3D0x00 TTL=3D98 ID=3D47689 PROTO=3DUDP SPT=3D45585 DPT=3D65000 =
LEN=3D65 ]
May 16 12:07:12 fw RULE DROP -- IN=3Deth0 OUT=3Deth1 SRC=3D68.0.95.18
DST=3D62.53.192.175 LEN=3D76 TOS=3D0x00 PREC=3D0xE0 TTL=3D49 ID=3D65337 =
PROTO=3DICMP
TYPE=3D3 CODE=3D1 [SRC=3D62.53.192.175 DST=3D192.168.1.104 LEN=3D48 =
TOS=3D0x00 PREC=3D0x80
TTL=3D110 ID=3D52247 DF PROTO=3DTCP SPT=3D45783 DPT=3D6881 =
WINDOW=3D16384 RES=3D0x00 SYN
URGP=3D0 ]
May 16 12:07:20 fw RULE DROP -- IN=3Deth0 OUT=3Deth1 SRC=3D10.49.4.6
DST=3D62.53.192.143 LEN=3D56 TOS=3D0x00 PREC=3D0xE0 TTL=3D230 ID=3D47467 =
PROTO=3DICMP
TYPE=3D11 CODE=3D0 [SRC=3D62.53.192.143 DST=3D219.100.31.227 LEN=3D40 =
TOS=3D0x00
PREC=3D0xE0 TTL=3D1 ID=3D54789 DF PROTO=3DTCP INCOMPLETE [8 bytes] ]

Shouldn't these messages be handled by conntrack as "RELATED" or
"ESTABLISHED" and be let through the firewall and therefore not be =
logged
(i.e. dropped)?
Can anybody help or explain?

Clemente


