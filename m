From: "Bo Jacobsen" <subs@systemhouse.dk>
Subject: Question; what is this netfilter logfile entry ?
Date: Sun, 14 Nov 2004 03:18:46 +0100
Message-ID: <000c01c4c9f0$4807a0d0$de0aa8c0@comp>
References: <1100392955.4894.25.camel@localhost.localdomain>
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
To: netfilter <netfilter@lists.netfilter.org>

Nov 14 02:24:48 WF1-HOME kernel: DENY-OUT:.IN=3D OUT=3Deth0 =
SRC=3D192.168.1.2 DST=3D198.41.0.4 LEN=3D560 TOS=3D0x00 PREC=3D0xC0 =
TTL=3D64 ID=3D3123 PROTO=3DICMP TYPE=3D3 CODE=3D3 [SRC=3D198.41.0.4 =
DST=3D192.168.1.2 LEN=3D532 TOS=3D0x00 PREC=3D0x00 TTL=3D49 ID=3D41159 =
PROTO=3DUDP SPT=3D53 DPT=3D51981 LEN=3D512 ]

It looks like ICMP with an embedded DNS call  ?.
What is it exactly, and how would a rule to allow this look like ?

Thanks in advance

Bo




