From: =?iso-8859-1?Q?"Bj=F6rn=20Eberth"?= <Bjoern.Eberth@web.de>
Subject: Re: Changing the ip_ct_tcp_timeout_established value
Date: Tue, 29 Mar 2005 20:54:15 +0100
Message-ID: <1138392081@web.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
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
To: netfilter@lists.netfilter.org

Hi there,

thx for the answer, but it seems as this doesnt fix my problem.
It seems as if the value in "ip=5Fconntrack=5Ftcp=5Ftimeout=5Festablished" isnt in=
terpreted, cause i see lots of entries like this in the ip=5Fconntrack table=
:
tcp      6 231752 ESTABLISHED src=3Dyyy.yyy.yyy.yyy dst=3Dxxx.xxx.xxx.xxx spor=
t=3D3139 dport=3D6881 src=3Dxxx.xxx.xxx.xxx dst=3Dzzz.zzz.zzz.zzz sport=3D6881 dport=
=3D3139 [ASSURED] use=3D1

The third field is the timeout value i think=3F So this would be 231752 seco=
nds, which is much larger then the value in ip=5Fconntrack=5Ftcp=5Ftimeout=5Festab=
lished.
Im running a 2.4.27 kernel with iptables 1.2.11. Is the value ignored in t=
his versions by design=3F
Any advices=3F

Regards
Bjoern

Moritz Gartenmeister <moritz@uplink-verein.ch> schrieb am 27.03.05 19:36:2=
1:
>=20
> hi bjoern
>=20
> i changed this value to ten minutes. this reduced the ip=5Fconntrack=5Fcount=
 from 8000 to 3000 and it=20
> saves memory.
>=20
> i don't notice any problems. it's possible that if you are using connect=
ions without keepalive=20
> function, that they will probably suffer. but i assume, that connections=
 without traffic for ten=20
> minutes are anormal closed.
>=20
> regards
> moritz
>=20
> Bj=F6rn Eberth wrote:
> > Hi there,
> >=20
> > the default value for "ip=5Fconntrack=5Ftcp=5Ftimeout=5Festablished" is set to=
 5 days.
> > My problem is, that after about 2 days of using a filesharing client t=
he ip=5Fconntrack table runs full.
> > Im using a dial-up connection with 24 hours reconnect.
> > So my question is: Could i run into problems, if i set this value to 2=
4 hours or something like this=3F
> >=20
> > Regards
> > Bjoern
> >=20
> >=20


=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F
Verschicken Sie romantische, coole und witzige Bilder per SMS!
Jetzt bei WEB.DE FreeMail: http://f.web.de/=3Fmc=3D021193


