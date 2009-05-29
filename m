From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Excluding IP from connection tracking
Date: Fri, 29 May 2009 12:30:13 +0200
Message-ID: <4A1FB935.80908@plouf.fr.eu.org>
References: <4A1FB34B.8060902@conversis.de> <1243592719.4477.40.camel@hsa.vpn.anti>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1243592719.4477.40.camel@hsa.vpn.anti>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Martin Millnert a =E9crit :
>=20
> see -t raw -j NOTRACK.

And make sure NOTRACK is applied to packets in both directions, i.e wit=
h=20
that address as either source or destination.
