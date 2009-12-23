From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: IPTABLES and NATTING
Date: Wed, 23 Dec 2009 12:02:32 +0100
Message-ID: <4B31F8C8.7070002@plouf.fr.eu.org>
References: <5f765be60912222021y5de642a4u785aecf0476a2c29@mail.gmail.com>	 <23731b2b0912222115y11417feua2eab5787197d1eb@mail.gmail.com> <5f765be60912222201j2c836482kcd5e3326c03b1358@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5f765be60912222201j2c836482kcd5e3326c03b1358@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Ajith Adapa <adapa.ajith@gmail.com>
Cc: netfilter@vger.kernel.org

Ajith Adapa a =E9crit :
> Hi
>=20
> Sorry I have some changes in my question as I am confused initially.
>=20
>                      linuxbox (p.q.r.t)
>                             |
>                             |
> INTERNAL  ------ ABCD ----- INTERNET
>  (p.q.r.s)                               (m.n.o.k)

Please use a fixed-size font for ASCII art, otherwise it may appear all
garbled to readers. Here I see linuxbox linked to INTERNET instead of
ABCD, and m.n.o.k is linked to nothing.

> ABCD has 3 interfaces connected to linuxbox, INTERNAL N/W, INTERNET.
>=20
> I am able to ping from INTERNAL to linuxbox. So there is a path
> available in routing table.
>=20
> At present I am snatting the packets from linuxbox to INTERNET at
> ABCD. I have a small doubt regarding the FTP from linuxbox since I
> have to support ftp from linuxbox to both INTERNAL N/W as well as in
> INTERNET.

What kind of doubt ?

> How can I write a rule in iptables present in ABCD where it can decid=
e
> if the destination ip-address of ftp server is within INTERNAL N/W or
> in INTERNET and do natting accordingly.

What kind of rule ? You can check whether the destination address is in
the internal subnet or you can check the output interface. Usually, SNA=
T
rules are based on the output interface.

Anyway, I do not see the relation with FTP. If you use FTP and NAT, you
need to load the FTP conntrack and NAT helper modules (nf_conntrack_ftp
and nf_nat_ftp), but you do not need to write specific NAT rules for FT=
P.
