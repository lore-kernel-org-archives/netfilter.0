From: Jason Opperisano <opie@817west.com>
Subject: Re: state: INVALID
Date: Sun, 21 Nov 2004 13:25:43 -0500
Message-ID: <1101061543.3501.18.camel@hubcap.ljm.dom>
References: <419E75B1.3030406@uni-paderborn.de>
	<1100990773.3501.9.camel@hubcap.ljm.dom>
	<419FD0BD.6000906@uni-paderborn.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <419FD0BD.6000906@uni-paderborn.de>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org
Cc: bj-schmidt@uni-paderborn.de

On Sat, 2004-11-20 at 18:18, Bj=C3=B6rn Schmidt wrote:
> Jason Opperisano wrote:
> >>the ulogd logfile of my server shows many "INVALID state" packets. Wh=
at could
> >>be the reason for that?
> >=20
> > my guess would be because you have a log rule that logs on "-m state
> > --state INVALID"
>=20
> Yes, of course. ;)
>=20
> >>The server has one cardbus nic (eth0), one dsl-interface (ppp0) and, =
of course
> >>lo. The client has only eth0 and lo. The kernel version of both compu=
ters is
> >>2.6.10-rc2
> >>
> >>syslogemu.log:Nov 19 20:31:52 kilobyte INPUT_INVALID IN=3Deth0 OUT=3D=
=20
> >>MAC=3D00:d0:b7:01:ce:2a:00:04:e2:7f:90:41:08:00  SRC=3D192.168.0.2 DS=
T=3D192.168.0.1=20
> >>LEN=3D52 TOS=3D00 PREC=3D0x00 TTL=3D64 ID=3D1680 DF PROTO=3DTCP SPT=3D=
32899 DPT=3D3130=20
> >>SEQ=3D4260699581 ACK=3D510793293 WINDOW=3D5080 ACK FIN URGP=3D0
>  >
>  > this is a FIN-ACK packet from the client to the server for an ICP
>  > session.
>=20
> Ooops, i picked exactly the entries from the log which are _really_ inv=
alid.
> Sorry for that (it was to late at night...).
>=20
> Here is a(n older) packet that is _falsely_ classified as INVALID (shou=
ld be
> ESTABLISHED). I changed the IP-adress and hostname in the meantime:
>=20
> Oct 29 13:51:05 skyron ILLEGAL_PACKET IN=3D OUT=3Deth0 MAC=3D SRC=3D192=
.168.1.1=20
> DST=3D192.168.1.2 LEN=3D60 TOS=3D00 PREC=3D0x00 TTL=3D64 ID=3D0 DF PROT=
O=3DTCP SPT=3D22=20
> DPT=3D33085 SEQ=3D1048000056 ACK=3D1050690244 WINDOW=3D5792 ACK SYN URG=
P=3D0

well--this is a SYN-ACK packet...without seeing the log rule that
creates this "ILLEGAL_PACKET" entry, i can't say.  my guess is that your
rules do not match your intentions.
 =20
> Besides I forgot to mention that i only get "false INVALID" states with
> activated IPsec (esp in transport mode, kernel 2.6). With IPsec _AND_ i=
ptables
> it es NOT possible to establish a new tcp connection due to these "INVA=
LID
> state packets".

uh huh...  post your rules:

  iptables -t mangle -vnxL && iptables -t nat -vnxL && iptables -vnxL

> There is also a (german) thread at debian-users-german where we tried t=
o solve=20
> this problem, without success:
>   http://lists.debian.org/debian-user-german/2004/10/msg02735.html

-j

--
"'Nuke the whales?' You don't really believe that, do you?
 I dunno. Gotta nuke something."
	--The Simpsons


