From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: Dropped packets logged which should be accepted by Conntrack
Date: Wed, 16 Nov 2011 07:07:53 -0500
Message-ID: <1321445273.2936.83.camel@denise.theartistscloset.com>
References: <1321326448.2936.43.camel@denise.theartistscloset.com>
	 <4EC23515.8020808@freemail.hu>
	 <1321361861.2936.68.camel@denise.theartistscloset.com>
	 <CAG61UF-BmX38MbC=5MUsBkWD3Fixx7-=AENxHKtbRi9TX7NzmA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAG61UF-BmX38MbC=5MUsBkWD3Fixx7-=AENxHKtbRi9TX7NzmA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jorge =?ISO-8859-1?Q?D=E1vila?= <jorgedavilalopez@gmail.com>
Cc: netfilter@vger.kernel.org

On Tue, 2011-11-15 at 10:20 -0600, Jorge D=C3=A1vila wrote:
> John,
>=20
> The particular thing I see in the logs is they shows the flag DF
> (Don't Fragment).
>=20
> My first guess is the TCPMSS rule is the responsible for generating t=
he logs.
>=20
> Maybe adjusting the mtu for the interfaces will solve the problem.
>=20
> Jorge.
<snip>
Thanks, Jorge.  However, the packets are quite small and should not be
having a problem with DF.  I thought, perhaps, they were RSTs and maybe
those were not considered RELATED but that is not always the case:

No Match: IN=3Dbond4 OUT=3Dbond3 SRC=3D172.x.y.34 DST=3D187.15.198.127 =
LEN=3D117
TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D20811 DF PROTO=3DTCP SPT=3D25 DPT=3D=
2307
WINDOW=3D5840 RES=3D0x00 ACK PSH URGP=3D0

No Match: IN=3Dbond4 OUT=3Dbond3 SRC=3D172.x.y.34 DST=3D180.252.147.149=
 LEN=3D55
TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D60912 DF PROTO=3DTCP SPT=3D25 DPT=3D=
19445
WINDOW=3D5840 RES=3D0x00 ACK PSH URGP=3D0

Here are two examples of packets being logged from our public SMTP
gateway with tiny packet sizes and no unusual flags.

Any other ideas, anyone, of why we would be seeing these logs when we
would suspect these packets should be ACCEPTed at the very beginning of
the FORWARD chain with a -m state --state RELATED,ESTABLISHED -j ACCEPT
rule? Thanks - John

