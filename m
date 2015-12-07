From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Packet disappears after DNAT?
Date: Mon, 07 Dec 2015 09:06:02 +0100
Message-ID: <56653DEA.6040506@plouf.fr.eu.org>
References: <CAKmUPx5_sDgRSUQuZmXoCxPnuN3Z0q4df5XECvR7gzY6F3gpDA@mail.gmail.com>	<5662BD03.60004@plouf.fr.eu.org> <CAKmUPx40SPPjAjQa2LyKMwQu=Qrd+Cfi1FjmQR5Oap8hQPL8Vg@mail.gmail.com> <56653CCC.6020603@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <56653CCC.6020603@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Scott Bronson <bronson@rinspin.com>
Cc: netfilter <netfilter@vger.kernel.org>

Pascal Hambourg a =E9crit :
> Scott Bronson a =E9crit :
>=20
>> Maybe I can DNAT the source MAC too?  :)
>=20
> I guess you may SNAT the source MAC address. It might do the trick

Oops I sent too fast.
I do not think that ebtable can SNAT before the bridging decision.
