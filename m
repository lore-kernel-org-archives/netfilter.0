From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: RE: Weird nat/conntrack Problem with PASV FTP upload
Date: Mon, 9 Jun 2008 13:21:29 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0806091319390.30276@blackhole.kfki.hu>
References: <E350C77ABFDBD242BDD51F5DA07905C102825E31@SONNE.gw.bringe.net>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="110391808-532683957-1213010489=:30276"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <E350C77ABFDBD242BDD51F5DA07905C102825E31@SONNE.gw.bringe.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: =?iso-8859-1?Q?Thomas_B=E4tzler?= <t.baetzler@bringe.com>
Cc: netfilter@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--110391808-532683957-1213010489=:30276
Content-Type: TEXT/PLAIN; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 9 Jun 2008, Thomas B=E4tzler wrote:

> Jozsef Kadlecsik wrote:
> > On Mon, 9 Jun 2008, Thomas B=E4tzler wrote:
> >> In any case I'm wondering why netfilter doesn't consider
> >> these packets  to be part of a connection. Is there a
> >> known problem with netfilter and TCP SACK?
> >=20
> > In these cases usually there is a device sitting between the=20
> > firewall running netfilter and the server/client machine,=20
> > which randomizes the TCP sequence numbers but fails to=20
> > propagate the changes to the SACK fields.=20
> > Thus the SACK values are totally bogus and therefore=20
> > netfilter marks them as INVALID.
>=20
> I thought of that, too, but it doesn't seem to be the case.
> Let's have a look at an excerpt (tcpdump -S):
>=20
> 22:37:44.830784 IP gateway.41803 > server.37890: SWE 1599996997:159999699=
7(0) win 5840 <mss 1460,sackOK,timestamp 495055487 0,nop,wscale 7>
> 22:37:44.846411 IP server.37890 > gateway.41803: SE 23582050:23582050(0) =
ack 1599996998 win 5792 <mss 1460,sackOK,timestamp 49338617 495055487,nop,w=
scale 7>
> 22:37:44.846533 IP gateway.41803 > server.37890: . ack 23582051 win 46 <n=
op,nop,timestamp 495055488 49338617>
>=20
> [...]
>=20
> 22:37:44.974253 IP gateway.41803 > server.37890: . 1600282667:1600284115(=
1448) ack 23582051 win 46 <nop,nop,timestamp 495055501 49338649>
>=20
> [...]
>=20
> 22:37:44.989794 IP server.37890 > gateway.41803: . ack 1600281219 win 892=
 <nop,nop,timestamp 49338653 495055501>
> 22:37:44.990228 IP gateway.41803 > server.37890: . 1600358775:1600360223(=
1448) ack 23582051 win 46 <nop,nop,timestamp 495055502 49338653>
>=20
> [...]
>=20
> 22:37:44.990397 IP server.37890 > gateway.41803: . ack 1600281219 win 892=
 <nop,nop,timestamp 49338653 495055501,nop,nop,sack 1 {1600282667:160028411=
5}>
> 22:37:44.990417 IP gateway.41803 > server.37890: R 1600281219:1600281219(=
0) win 0
>=20
> As you can see, the SACK data matches a previously sent segment,
> so it's not scrambled.

Then the best were if you could capture a full TCP session by tcpdump and=
=20
send it so that we could replay and analyze the traffic.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary
--110391808-532683957-1213010489=:30276--
