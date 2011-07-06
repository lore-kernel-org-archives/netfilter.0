From: "Nikolay S." <nowhere@hakkenden.ath.cx>
Subject: Re: iptables wildcard delete
Date: Wed, 06 Jul 2011 23:09:27 +0400
Message-ID: <1309979367.11393.4.camel@hakkenden>
References: <4E148360.1090001@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E148360.1090001@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: netfilter@vger.kernel.org

iptables -S | \
   sed '/-[jg] myChain'/ s/^-A/-D/;t;d' | \
   xargs -L1 iptables

=D0=92 =D0=A1=D1=80=D0=B4, 06/07/2011 =D0=B2 16:46 +0100, Jonathan Trip=
athy =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Hi Everyone,
>=20
> Is there some method where I can delete specific rules based on only=20
> some known rule elements?
>=20
> For example, let's say I wanted to delete all rules with a target of=20
> "myChain"
>=20
> Thanks
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


