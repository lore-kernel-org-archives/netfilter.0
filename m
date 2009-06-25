From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Question about nat filtering with FORWARD
Date: Thu, 25 Jun 2009 12:18:48 +0200
Message-ID: <4A434F08.4050102@plouf.fr.eu.org>
References: <4161.192.168.1.3.1245837879.squirrel@webmail.decimal.pt>    <33be4bb30906240322x1934b045g5e74e16f012ffcd7@mail.gmail.com> <1072.192.168.1.3.1245839976.squirrel@webmail.decimal.pt> <001d01c9f4ba$316a3c30$943eb490$@info> <4A434DCA.3020503@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A434DCA.3020503@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Pascal Hambourg a =E9crit :
>=20
> ICMP error messages (destination unreachable, TTL exceeded,=20
> fragmentation needed...) are in the RELATED state. So you need RELATE=
D=20
> if you don't want to break ICMP error signalling and mechanisms which=
=20
> rely on it such as Path MTU Detection (PMTUD).

Oops, s/Detection/Discovery/

Note that ICMP error signalling is a mandatory part of IP operation, an=
d=20
path MTU discovery is enabled by default in Linux, and possibly other=20
operating systems.
