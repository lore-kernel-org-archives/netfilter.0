From: Luis Miguel Cruz Miranda <luismi@b2bi.es>
Subject: can't patch with patch-o-matic
Date: Mon, 17 Feb 2003 17:27:07 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.0.9.2.20030217171848.01c2e5c0@172.26.0.8>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all,

I am using patch-o-matic to patch a 2.4.20 kernel but I am having some=20
problems here:

For example:

Do you want to apply this patch [N/y/t/f/a/r/b/w/v/q/?] y
Testing patch extra/tcp-window-tracking.patch...
    Placed new Makefile line
Failed to patch copy of /usr/src/linux
TEST FAILED: patch NOT applied.

I want to use that patch but I don't know why I can't.
I have these patches applied:

Already applied: submitted/01_2.4.19
                  submitted/02_2.4.20
                  submitted/ipt_multiport-invfix
                  submitted/ipt_ULOG-mac_len-fix
                  pending/01_ip_conntrack_proto_tcp-lockfix
                  pending/02_newnat-udp-helper
                  pending/03_REJECT-fwspotting-phrack60-fix
                  pending/04_ftp-conntrack-msg-fix
                  pending/05_ECN-tcpchecksum-littleendian-fix
                  base/fuzzy
                  base/iplimit
                  base/ipt_unclean-ubit
                  base/ipv4options
                  base/IPV4OPTSSTRIP
                  base/mport
                  base/NETLINK
                  base/NETMAP
                  base/nth
                  base/pool
                  base/psd
                  base/quota
                  base/random
                  base/realm
                  base/SAME
                  base/time
                  base/TTL
                  extra/condition
                  extra/CONNMARK
                  extra/h323-conntrack-nat
                  extra/ip_tables-proc
                  extra/ipt_TARPIT
                  extra/mms-conntrack-nat
                  extra/pptp-conntrack-nat
                  extra/recent
                  extra/ROUTE
                  extra/rsh
                  extra/string
                  extra/talk-conntrack-nat
                  extra/tftp-conntrack-nat

What is wrong?


Luis Miguel Cruz Miranda.               |       B2B INTEGRAL, S.A.
CCNA - Systems Administrator            |       Pol. Ind. de Asipo
                                         |       C/A - Parcela 86-C
Tel: +34 902 506 605                    |       33.428 - CAYES - LLANERA
Fax:+34 985 980 794                     |       ASTURIAS (ESPA=D1A/SPAIN)



