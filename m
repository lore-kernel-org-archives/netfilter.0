From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: -m string  and RELATED
Date: 04 Nov 2002 11:42:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1036406552.8844.47.camel@elendil>
References: <87znsptzey.fsf@arm.t19.ds.pwr.wroc.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <87znsptzey.fsf@arm.t19.ds.pwr.wroc.pl>
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
To: Arkadiusz Miskiewicz <misiek@pld.org.pl>
Cc: netfilter@lists.samba.org

Le lun 04/11/2002 =E0 11:14, Arkadiusz Miskiewicz a =E9crit :
> iptables -A INPUT -m string --string "xyztest" -j LOG --log-prefix "xyzte=
st: " -m state --state NEW,ESTABLISHED,RELATED=20
>
> [misiek@ikar misiek]$ telnet misie.k.pl 25
> Trying 156.17.236.105...
> Connected to misie.k.pl.
> Escape character is '^]'.
> 220 misie.k.pl ESMTP Exim 4.10 Mon, 04 Nov 2002 11:11:18 +0100
> xyztest
> 500 unrecognized command
>=20
> - Nov  4 11:11:20 arm kernel: xyztest: IN=3Deth0 OUT=3D MAC=3D00:10:22:fe=
:5a:91:00:02:44:1f:f3:b4:08:00 SRC=3D156.17.235.253 DST=3D156.17.236.105 LE=
N=3D61 TOS=3D0x10 PREC=3D0x00 TTL=3D62 ID=3D53540 DF PROTO=3DTCP SPT=3D2637=
 DPT=3D25 WINDOW=3D5840 RES=3D0x00 ACK PSH URGP=3D0=20
>  (logged packet which contains xyztest packet)
>=20
> tralala
> 500 unrecognized command
>=20
>  - nothing logged
>=20
> Why is this not working - there is ESTABILISHED,RELATED rule - any ideas?
> (I have conntrack modules loaded).

I do not see your problem. You want to log packets that :
	. contains string "xyztest"
	AND
	. are NEW, ESTABLISHED or RELATED

The first packet logued matches, but not the second as it does not
contains string "xyztest".

So, WTF ? :)))

If you want to log the whole session that follows a packet containing
string "xyztest", then it will be a little more tricky. You have to use
the patch-o-matic CONNMARK patch (extra section) which provides a target
to set per connection mark, and a connmark match to match against it.

By the way, I did not tested it...

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curit=
=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

