From: "LinuXKiD" <gregoriandres@yahoo.com.ar>
Subject: vpn masquerading
Date: Thu, 19 Jan 2006 09:58:38 -0300
Message-ID: <NHBBLNDNFKDMKNNKGOMMMEODOBAA.gregoriandres@yahoo.com.ar>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>


Hi,

I've a small lan with linux router debian:
	- 2.4.28 kernel
	- iptables 1.3.0
	- pptp patch-o-matic-ng and others patchs
	- Adsl internet connection.

Lan share internet connection with MASQUERADE (iptables nat)
and I've loaded modules pptp and gre (conntrack and nat)

lsmod:

Module                  Size  Used by    Not tainted
imq                     2024   5
sch_red                 2720   5  (autoclean)
cls_fw                  3384  45  (autoclean)
sch_sfq                 3520  40  (autoclean)
sch_htb                21632  10  (autoclean)
ipt_mark                 504   2  (autoclean)
ipt_length               536   2  (autoclean)
ipt_MARK                 792  25  (autoclean)
iptable_mangle          2200   1  (autoclean)
bsd_comp                4216   0  (autoclean)
ppp_synctty             5696   0  (unused)
ppp_async               7040   5
ppp_generic            19528  15  [bsd_comp ppp_synctty ppp_async]
slhc                    4800   0  [ppp_generic]
ipt_ipp2p               6424   0
ipt_IMQ                  824   5
ip_nat_tftp             1872   0  (unused)
ip_nat_proto_gre        1508   0  (unused)
ip_nat_pptp             2572   0  (unused)
ip_nat_mms              3120   0  (unused)
ip_nat_irc              2320   0  (unused)
ip_nat_h323             2796   0  (unused)
ip_nat_cuseeme          2608   0  (unused)
ip_conntrack_amanda     1392   1  (autoclean)
ip_nat_amanda           1068   0  (unused)
ip_conntrack_tftp       1840   1
ip_conntrack_pptp       2832   1  [ip_nat_pptp]
ip_conntrack_proto_gre    2676   0  [ip_nat_pptp ip_conntrack_pptp]
ip_conntrack_mms        3216   1  [ip_nat_mms]
ip_conntrack_irc        3088   1
ip_conntrack_h323       2736   1  [ip_nat_h323]
ip_nat_ftp              2832   0  (unused)
iptable_nat            19590  10  [ip_nat_tftp ip_nat_proto_gre ip_nat_pptp
ip_nat_mms ip_nat_irc ip_nat_h323 ip_nat_cuseeme ip_nat_amanda ip_nat_ftp]
ip_tables              12960   9  [ipt_mark ipt_length ipt_MARK
iptable_mangle ipt_ipp2p ipt_IMQ iptable_nat]
ip_conntrack_ftp        4144   1
ip_conntrack           23076   8  [ip_nat_tftp ip_nat_pptp ip_nat_mms
ip_nat_irc ip_nat_h323 ip_conntrack_amanda ip_nat_amanda ip_conntrack_tftp
ip_conntrack_pptp ip_conntrack_proto_gre ip_conntrack_mms ip_conntrack_irc
ip_conntrack_h323 ip_nat_ftp iptable_nat ip_conntrack_ftp]
sis900                 13708   1
3c59x                  27184   5


well... the problem is when two , or more lan hosts want to access
same vpn server with pptp "microsoft vpn protocol"

Only one host can connect to VPN simultaneously


Also, I've find next in source code netfilter pptp: (patch o matic ng)


-> ->
-> ->  * TODO: - finish support for multiple calls within one session
-> ->  *     (needs expect reservations in newnat)
-> ->  *   - testing of incoming PPTP calls
-> ->

and, in last 2.6 Kernel:

 * Limitations:
 *       - We blindly assume that control connections are always
 *         established in PNS->PAC direction.  This is a violation
 *         of RFFC2673
 *       - We can only support one single call within each session


BTW, In VPN-Masquerade HOWTO , I can read that 2.0 and 2.2 Kernel
patchs exist in order to connect two or more lan hosts to same VPN
server.

TIA.

bests
andres


