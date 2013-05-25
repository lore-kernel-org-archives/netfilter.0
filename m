From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: It is correct to write: iptables -A INPUT -i ppp+,eth0+,tap+
   . . .
Date: Sat, 25 May 2013 14:41:25 +0200
Message-ID: <51A0B175.5050502@plouf.fr.eu.org>
References: <8d3c593ab7094d244e32a6788a950355.squirrel@mail.fisica.uh.cu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <8d3c593ab7094d244e32a6788a950355.squirrel@mail.fisica.uh.cu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: julioarr@fisica.uh.cu
Cc: netfilter@vger.kernel.org

Hello,

julioarr@fisica.uh.cu a =E9crit :
>=20
> It is correct to write:
>=20
> iptables -A INPUT -i ppp+,eth0+,tap+ ...

No. It won't match anything.

> or it is need to write:
>=20
> iptables -A INPUT -i ppp+ ...
> iptables -A INPUT -i eth+ ...
> iptables -A INPUT -i tap+ ...

Yes.
