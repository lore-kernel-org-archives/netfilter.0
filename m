From: Moritz Gartenmeister <moritz@uplink-verein.ch>
Subject: --set-mark
Date: Wed, 12 Jan 2005 14:51:56 +0100
Message-ID: <41E52B7C.9070802@uplink-verein.ch>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

hi all

i have a problem with -j MARK --set-mark

everthing was working until i changed the kernel and iptables ;-)

before i had kernel 2.6.7 and iptables 1.2.9 (and everything was working =
perfectly)

now i have kernel 2.6.10 and iptables 1.2.10

for both i used a layer-7 patch.
there was no problem during compiling and installing.

here my rule:
$IPTABLES -t mangle -A PREROUTING -p ICMP -s 0/0 --icmp-type 8 -j MARK --=
set-mark 1 # ECHO

error message:
iptables: Invalid argument

i didn't find something in changelog and google doesn't help much here.

MARK target exists:
sudo /usr/local/sbin/iptables -I FORWARD -j MARK
iptables v1.2.11: MARK target: No action

lsmod shows:
Module                  Size  Used by
ipt_hashlimit           9556  -
ipt_CONNMARK            2028  -
ipt_connmark            1452  -
cls_fw                  4748  -
sch_sfq                 5420  -
sch_htb                25772  -
ipt_TOS                 2252  -
ipt_REDIRECT            1836  -
iptable_nat            25604  -
ip_conntrack_irc       71632  -
ip_conntrack_ftp       72592  -
ipt_pkttype             1452  -
ipt_helper              1996  -
ipt_conntrack           2316  -
ipt_mac                 1708  -
ipt_physdev             1948  -
ipt_multiport           1804  -
ipt_iprange             1548  -
ipt_mark                1420  -
ipt_length              1452  -
ipt_tos                 1388  -
ipt_CLASSIFY            1932  -
ipt_MARK                1868  -
ipt_layer7             11572  -
ipt_state               1676  -
ipt_limit               2284  -
ipt_LOG                 6828  -
iptable_mangle          2540  -
iptable_filter          3404  -
ip_conntrack           47204  -
ip_tables              17792  -
bridge                 51684  -

was something changed in the syntax? do i have to use another modul?

regards
moritz

--=20
Uplink student association
Moritz Gartenmeister
B=FClachstrasse 1 F
8057 Z=FCrich
Switzerland

