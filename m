From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: RE: Problems with DNS
Date: Sun, 07 Sep 2003 15:52:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062942775.2008.25.camel@elendil.intranet.cartel-securite.net>
References: <HMEKJPOHJKKBIDHGBCMDEEHDCAAA.varyag18@mail.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <HMEKJPOHJKKBIDHGBCMDEEHDCAAA.varyag18@mail.ru>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: =?koi8-r?Q?=F7=CC=C1=C4=C9=CD=C9=D2_?= =?koi8-r?Q?=F0=CF=D4=C1=D0=CF=D7?= <varyag18@mail.ru>
Cc: netfilter@lists.netfilter.org

Le dim 07/09/2003 =C3=A0 15:34, =D0=92=D0=BB=D0=B0=D0=B4=D0=B8=D0=BC=D0=B8=
=D1=80 =D0=9F=D0=BE=D1=82=D0=B0=D0=BF=D0=BE=D0=B2 a =C3=A9crit :
> 194.67.23.25 -outside mail server from that i tried to send mail to my
> 	mail server.
>  New not syn: IN=3Deth0 OUT=3Deth1 SRC=3D194.67.23.25 DST=3D192.168.5.2=
 LEN=3D88
> 	TOS=3D0x00 PREC=3D0x00 TTL=3D55 ID=3D2475 DF PROTO=3DTCP SPT=3D25
> 	DPT=3D49073 WINDOW=3D57920 RES=3D0x00 ACK PSH FIN URGP=3D0=20
>  New not syn: IN=3Deth0 OUT=3Deth1 SRC=3D194.67.23.25 DST=3D192.168.5.2=
 LEN=3D88
> 	TOS=3D0x00 PREC=3D0x00 TTL=3D55 ID=3D4691 DF PROTO=3DTCP SPT=3D25
> 	DPT=3D49073 WINDOW=3D57920 RES=3D0x00 ACK PSH FIN URGP=3D0
[...]

These logs have been raised by a rule you did not show in the ruleset
you gave. This rule has a -j LOG --log-prefix "New not syn: " target and
is supposed to match packets with state NEW that are not syn ones (-m
state --state NEW -p tcp -m tcp ! --syn). This does not happens very
often on SMTP flows, so this kind of log is a bit strange to me. Can we
see you whole ruleset ?

Without a complete ruleset, it is unlikely one can provide valuable help
if there's side effects.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

