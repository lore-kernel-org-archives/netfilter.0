From: "Bo Jacobsen" <subs@systemhouse.dk>
Subject: Strange log info from iptables ?
Date: Sun, 29 Feb 2004 10:17:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000d01c3fea4$ea271f70$de0aa8c0@comp>
References: <20040227175608.666a0e38.Information-Cascade@ntlworld.com><1077905740.2526.41.camel@anduril.intranet.cartel-securite.net> <20040227190555.214cbc6e.Information-Cascade@ntlworld.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

What is the following log info. It looks like some kind of combined ICMP =
and DNS ?

Feb 29 10:02:03 WFx-SH kernel:=20
DROP-OUT:IN=3D OUT=3Deth0 SRC=3D192.168.1.2 DST=3D212.54.64.171=20
LEN=3D198 TOS=3D0x00 PREC=3D0xC0 TTL=3D64 ID=3D30626=20
PROTO=3DICMP TYPE=3D3 CODE=3D3 [SRC=3D212.54.64.171 DST=3D192.168.1.2 =
LEN=3D170=20
TOS=3D0x00 PREC=3D0x40 TTL=3D59 ID=3D53582=20
PROTO=3DUDP SPT=3D53 DPT=3D59554=20
LEN=3D150 ]=20



-------------------------------------------------
Bo Jacobsen
=20




