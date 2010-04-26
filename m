From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Blocking all APNIC addresses vs. per-country list
Date: Mon, 26 Apr 2010 16:34:47 +0200
Message-ID: <4BD5A487.3020407@plouf.fr.eu.org>
References: <0414A4FA-32F4-4D94-92E0-FC5CC9B4D646@zconsulting.net> <q2m56378e321004260719i6685af2arc8faa644f555485b@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <q2m56378e321004260719i6685af2arc8faa644f555485b@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Richard Horton a =E9crit :
>=20
> A better option would be to drop ssh connections if the number of
> attempts from a single ip address exceedes an acceptable limit

Preferably the number of *failed* attempts. That's what fail2ban and th=
e
like do.

> can't see many legit uses for ssh where you you connect and
> disconnect multiple times within a 1 minute window)

What about scp ?

> This can be done using either hashlimit or the recent matches...

They don't know about failed attemps.
