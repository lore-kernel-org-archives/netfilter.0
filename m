From: Arkadiusz Miskiewicz <misiek@pld.org.pl>
Subject: -m string  and RELATED
Date: 04 Nov 2002 11:14:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <87znsptzey.fsf@arm.t19.ds.pwr.wroc.pl>
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
To: netfilter@lists.samba.org


Hi,

I'm trying to log whole stream basing on string match.

iptables -A INPUT -m string --string "xyztest" -j LOG --log-prefix "xyztest=
: " -m state --state NEW,ESTABLISHED,RELATED=20

[misiek@ikar misiek]$ telnet misie.k.pl 25
Trying 156.17.236.105...
Connected to misie.k.pl.
Escape character is '^]'.
220 misie.k.pl ESMTP Exim 4.10 Mon, 04 Nov 2002 11:11:18 +0100
xyztest
500 unrecognized command

- Nov  4 11:11:20 arm kernel: xyztest: IN=3Deth0 OUT=3D MAC=3D00:10:22:fe:5=
a:91:00:02:44:1f:f3:b4:08:00 SRC=3D156.17.235.253 DST=3D156.17.236.105 LEN=
=3D61 TOS=3D0x10 PREC=3D0x00 TTL=3D62 ID=3D53540 DF PROTO=3DTCP SPT=3D2637 =
DPT=3D25 WINDOW=3D5840 RES=3D0x00 ACK PSH URGP=3D0=20
 (logged packet which contains xyztest packet)

tralala
500 unrecognized command

 - nothing logged

Why is this not working - there is ESTABILISHED,RELATED rule - any ideas?
(I have conntrack modules loaded).

--=20
Arkadiusz Mi=B6kiewicz    CS at FoE, Wroclaw University of Technology
arekm@sse.pl   AM2-6BONE, 1024/3DB19BBD, arekm(at)ircnet, PLD/Linux

