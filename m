From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: connlimit reached - cannot open connections even after I close
 some
Date: Tue, 05 Feb 2013 20:54:13 +0100
Message-ID: <51116365.4070801@plouf.fr.eu.org>
References: <51014395.1000101@doodle.com> <510E4F4C.50202@plouf.fr.eu.org> <510F9B9B.8070907@doodle.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <510F9B9B.8070907@doodle.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Gubler <dg@doodle.com>
Cc: netfilter@vger.kernel.org

David Gubler a =E9crit :
>=20
> Starting a fifth download fails:
>=20
> $ wget --limit-rate=3D1  http://localhost:8080/....
> --2013-02-04 11:48:41--  http://localhost:8080/...
> Aufl=F6sen des Hostnamen =BBlocalhost (localhost)=AB... 127.0.0.1
> Verbindungsaufbau zu localhost (localhost)|127.0.0.1|:8080... fehlges=
chlagen: Verbindungsaufbau abgelehnt.
> (connection rejected)
>=20
> # conntrack -L | grep 8080
> tcp      6 431949 ESTABLISHED src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D=
60279 dport=3D8080 src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dport=3D=
60279 [ASSURED] mark=3D0 use=3D1
> tcp      6 431990 ESTABLISHED src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D=
60278 dport=3D8080 src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dport=3D=
60278 [ASSURED] mark=3D0 use=3D1
> tcp      6 431956 ESTABLISHED src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D=
60284 dport=3D8080 src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dport=3D=
60284 [ASSURED] mark=3D0 use=3D1
> tcp      6 431963 ESTABLISHED src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D=
60285 dport=3D8080 src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dport=3D=
60285 [ASSURED] mark=3D0 use=3D1
> tcp      6 71 SYN_SENT src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D60291 =
dport=3D8080 [UNREPLIED] src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 d=
port=3D60291 mark=3D0 use=3D1
>=20
> Note: The rejected connection is in the conntrack table in the state =
SYN_SENT.

It appears that you're testing over the loopback interface. Note that
the connection tracking behaves a bit differently on this interface :
the connection is confirmed when the first packet reaches the end of
POSTROUTING chains, before entering back the PREROUTING and INPUT
chains. So even though the packet is dropped in the INPUT chain, the
conntrack entry is not new any more and left in the SYN_STATE.

> Killing one of the four running downloads with CTRL+C:
>=20
> # conntrack -L | grep 8080
> tcp      6 431950 ESTABLISHED src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D=
60279 dport=3D8080 src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dport=3D=
60279 [ASSURED] mark=3D0 use=3D1
> tcp      6 7 CLOSE src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D60278 dpor=
t=3D8080 src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dport=3D60278 [AS=
SURED] mark=3D0 use=3D1
> tcp      6 431958 ESTABLISHED src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D=
60284 dport=3D8080 src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dport=3D=
60284 [ASSURED] mark=3D0 use=3D1
> tcp      6 431965 ESTABLISHED src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D=
60285 dport=3D8080 src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 dport=3D=
60285 [ASSURED] mark=3D0 use=3D1
> tcp      6 17 SYN_SENT src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D60291 =
dport=3D8080 [UNREPLIED] src=3D127.0.0.1 dst=3D127.0.0.1 sport=3D8080 d=
port=3D60291 mark=3D0 use=3D1
>=20
> Now we have a connection in state CLOSED and one in state SYN_SENT in
> the table. wget still fails as it did before.

As expected, as there are already four active (SYN_SENT and ESTABLISHED=
)
connections.

> On 03.02.2013 12:51, Pascal Hambourg wrote:
>  >
>  > This is not the expected behaviour. AFAIK, when a packet creating =
a new
>  > connection is DROPPed or REJECTed, the conntrack entry should be
>  > deleted. This is what I observe on my system.

Edit : I observe this if the connections are from a remote host. If the
connections are from the local host over loopback, I observer the same
behaviour as you. I tested both conditions with a Debian Squeeze 2.6.32
kernel. I could not test with other kerne versions.

> Ok this is weird. I have made a similar (although not exactly the
> same) attempt on "Linux 2.6.32-5-amd64 #1 SMP Sun Sep 23 10:07:46 UTC
> 2012 x86_64 GNU/Linux" (Debian stable with stock kernel). On that ker=
nel
> it behaves as you describe it! No SYN_SENT entries pop up in the
> conntrack table, instead the denied connections directly go into
> TIME_WAIT, and the connection limit works fine.
>=20
> On "Linux 3.2.0-2-amd64 #1 SMP Mon Jun 11 17:24:18 UTC 2012 x86_64
> GNU/Linux" (Debian stable with backports kernel), on the other hand, =
I
> get the exact same behavior as with 3.2 in Ubuntu (broken).

Did you test all kernels in the exact same conditions, connecting eithe=
r
 from a remote host or over loopback ?
