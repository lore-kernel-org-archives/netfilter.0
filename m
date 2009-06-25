From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Question about nat filtering with FORWARD
Date: Thu, 25 Jun 2009 12:13:30 +0200
Message-ID: <4A434DCA.3020503@plouf.fr.eu.org>
References: <4161.192.168.1.3.1245837879.squirrel@webmail.decimal.pt>    <33be4bb30906240322x1934b045g5e74e16f012ffcd7@mail.gmail.com> <1072.192.168.1.3.1245839976.squirrel@webmail.decimal.pt> <001d01c9f4ba$316a3c30$943eb490$@info>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <001d01c9f4ba$316a3c30$943eb490$@info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Rob Sterenborg a =E9crit :
>=20
> - Any reply packet in an established connection will be accepted usin=
g
> "--state RELATED,ESTABLISHED". Actually, you don't need RELATED here,
> but it doesn't hurt either and you do need it if you want to forward =
=46TP
> and such protocols.

ICMP error messages (destination unreachable, TTL exceeded,=20
fragmentation needed...) are in the RELATED state. So you need RELATED=20
if you don't want to break ICMP error signalling and mechanisms which=20
rely on it such as Path MTU Detection (PMTUD).

