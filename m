From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: NEW vs INVALID
Date: Mon, 30 Sep 2002 16:39:07 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D98620B.2070707@fugmann.dhs.org>
References: <m2elbb4w7h.fsf@pcwi1068.uni-muenster.de>
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
To: =?ISO-8859-1?Q?Jens_Lechtenb=F6rger?= <lechten@wi.uni-muenster.de>
Cc: netfilter@lists.netfilter.org

Jens Lechtenb=F6rger wrote:
> Hi there,
>=20
> using stateful packet matching I wonder how an INVALID tcp packet is
> defined.  In particular, I set up a rule to log inbound NEW ssh
> connections to port 22:
> iptables -A INPUT  -m state --state NEW -p TCP --dport 22 -j LOG --log-=
level 5 --log-prefix "IPTABLES: Legal NEW TCP: "
>=20
> What confuses me, is that this rule not only logs initial SYN
> packets but also (initial) packets with SYN and FIN set.=20
> I thought that such packets should be INVALID...
SYN-FIN??? Are you sure of this? I would suspect some ACK-FIN when the=20
connection closes, but not SYN-FIN.

Anyhow, AFAIK, the INVALID target only matches  ackets which are=20
malformed. a SYN-FIN packets is not malformed as such. (But yes, SYN-FIN =

is an illegal combination, and should be dropped, though this is not the =

purpose of the INVALID match (IMHO, this can easily be done using=20
standard netfilter rules).

Regards
Anders Fugmann

--=20
Neo: 'Can you fly that thing?'
Trinity: 'Not yet'.
$ apt-get install pilot-prg-v212helicopter.


