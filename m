From: Luis Miguel Cruz Miranda <luismi@b2bi.es>
Subject: patch-o-matic and userpace
Date: Thu, 20 Feb 2003 12:18:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.0.9.2.20030220121447.01c5bbb0@172.26.0.8>
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

Hi all again,

I am trying to use the patch called 'userspace/ipt_REJECT-fake-source.pat=
ch'
As I read, if I use that patch I need to recompile iptables user programs.

The problems is that I can't use that patch because I don't know have any=
=20
idea how to patch iptables source code.

I have this tree:

|-- iptables-1.2.7a
|   |-- extensions
|   |-- include
|   |   |-- libippool
|   |   |-- libipq
|   |   |-- libiptc
|   |   |-- libipulog
|   |   `-- linux
|   |       |-- netfilter_ipv4
|   |       `-- netfilter_ipv6
|   |-- ippool
|   |-- libipq
|   |-- libiptc
|   `-- libipulog
|-- patch-o-matic -> patch-o-matic-20030218
|-- patch-o-matic-20030218
|   |-- base
|   |-- broken
|   |-- extra
|   |-- not-accepted
|   |-- obsolete
|   |-- oldnat
|   |-- optimizations
|   |-- pending
|   |-- submitted
|   `-- userspace
`-- userspace -> iptables-1.2.7a

Is it correct to patch iptables-1.2.7a?


Luis Miguel Cruz Miranda.               |       B2B INTEGRAL, S.A.
CCNA - Systems Administrator            |       Pol. Ind. de Asipo
                                         |       C/A - Parcela 86-C
Tel: +34 902 506 605                    |       33.428 - CAYES - LLANERA
Fax:+34 985 980 794                     |       ASTURIAS (ESPA=D1A/SPAIN)



