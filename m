From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: can we design a modified fail2ban ?
Date: Fri, 16 Apr 2010 09:28:41 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1004160923230.31861@obet.zrqbmnf.qr>
References: <4BC7E028.8050209@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BC7E028.8050209@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: "J. Bakshi" <joydeep@infoservices.in>
Cc: netfilter@vger.kernel.org


On Friday 2010-04-16 05:57, J. Bakshi wrote:
>
>fail2ban is a popular application to prevent the brute-force attack
>against ssh and also against imap, pop3 etc.. But fail2ban actually
>blacklist the IP and this is what fail2ban has been designed for.
>Now a days [nowadays] we can design the same with iptables.

fail2ban has the ability - if I read its own short description right - =
to
already use various blocking methods, including not only /etc/hosts.den=
y
but also iptables.

>I wonder if iptables can
>provide more liberty to match IP as well as port combination so that w=
e
>don't need to blacklist the IP but only block the attempts from the IP
>based on port. Say more than 3 ssh attempt from IP xxx.xxx.xxx.xxx is
>detected and no more ssh attempt from the same ip is no more possible
>but pop and imap still works. Is it really possible with iptables ? An=
y
>idea ?
>
>Thanks
>
>--=20
>=E0=A6=9C=E0=A7=9F=E0=A6=A6=E0=A7=80=E0=A6=AA =E0=A6=AC=E0=A6=95=E0=A7=
=8D=E0=A6=B8=E0=A7=80
>
