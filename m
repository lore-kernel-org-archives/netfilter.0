From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Status of iptables target support in ipset
Date: Sat, 27 Oct 2012 09:26:30 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1210270916590.2637@blackhole.kfki.hu>
References: <CABpXQ7aX_LtYxP5UCo454-V9yu07kc8BpUBesCWy-4V_2ZqRvw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="110391812-1912830798-1351322790=:2637"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CABpXQ7aX_LtYxP5UCo454-V9yu07kc8BpUBesCWy-4V_2ZqRvw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: =?ISO-8859-15?Q?Csord=E1s_Csaba_Ifj=2E?= <cscsordas@gmail.com>
Cc: netfilter@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--110391812-1912830798-1351322790=:2637
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 26 Oct 2012, Csord=C3=A1s Csaba Ifj. wrote:

> I would like to ask when will it possible writing such rules as
> mentioned in $SUBJECT.
>=20
> For example:
>=20
> ipset new foo hash:ip
> ipset add foo 192.168.1.1 -t filter -A FORWARD -j LOG ... -t nat -A
> POSTROUTING -j SNAT ... -t mangle -A PREROUTING -j MARK ...

That's still on the todo list of ipset. Also, it requires some (small)=20
changes in the netfilter core itself. After adding some locking=20
improvements to ipset, hopefully I can start working on the subject.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
--110391812-1912830798-1351322790=:2637--
