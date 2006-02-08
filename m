From: =?ISO-8859-1?Q?Samuel_D=EDaz_Garc=EDa?= <samueldg@arcoscom.com>
Subject: Last patch-o-matic patches status report
Date: Wed, 08 Feb 2006 18:30:13 +0100
Message-ID: <43EA2AA5.3080401@arcoscom.com>
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

Hi all, I want to report to mainteneers some issues with patch-o-matic patc=
hes.

Kernel: 2.6.15.3
Iptables: 1.3.5
Aditional patches applied: imq, nf-hipac, layer7
pom: LAST

Patches not mentioned here are applied fine or kernel included and not need=
 pom=20
patch.

Patches don't apply fine for any reason:
    MARK-operations
    ACCOUNT
    netfilter-docbook
    tproxy
    TRACE
    connrate
    conntrack_locking
    conntrackc_nonat
    goto
    ipsec-XXXXX
    nat-reservations
    owner-socketlookup

Patches that could be applied but broke kernel compilation (at least):
    talk-conntrack-nat

Patches that could be applied but broke iptables compilation (at least):
    expire

Patches that could be applied but have missing simbols in kernel (at least):
    IPV4OPTSSTRIP
    XOR

Patches that couldn't be applied into this kernel:
    condition (Somebody send me a kernel patch that could be used over 2.6.=
15.x=20
kernel series before apply many pom patches).

Patches that could be applied but must be patched before compilation:
    mms-conntrack-nat (changing 2 lines in ip_conntrack_mms.c and 1 line in=
=20
ip_nat_mms.c)

Patches that could be applied but must be disable from kernel before compil=
ation=20
(because they don't compile):
    IPV4OPTSSTRIP (from IPV4)
    expire (from IPV6)
    fuzzy (from IPV6)
    nth (from IPV6)
    random (from IPV6)
    rtsp-conntrack (from IPV4)
    XOR (from IPV4)
    quake3-conntrack-nat (from IPV4)

I only expect this report could be usefull for somebody who wants to use po=
m=20
successfully.

Regards

P.D.: Sorry for my English.

--=20
    Samuel D=EDaz Garc=EDa
     Director Gerente
ArcosCom Wireless, S.L.L.

CIF: B11828068
c/ Romero Gago, 19
Arcos de la Frontera
11630 - Cadiz

http://www.arcoscom.com

mailto:samueldg@arcoscom.com
msn: samueldg@arcoscom.com

M=F3vil: 651 93 72 48
Tlfn.: 956 70 13 15
Fax:   956 70 34 83

