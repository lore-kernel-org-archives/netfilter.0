From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: IPtables problem
Date: Sat, 06 Oct 2007 20:25:02 +0200
Message-ID: <4707D2FE.2070601@plouf.fr.eu.org>
References: <4707B7A1.3090906@pbj-design.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4707B7A1.3090906@pbj-design.dk>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Per J=F8rgensen a =E9crit :
>=20
> The problem is that I cannot get the connection on the extra IP1 to=20
> forward all request on port 22 & 80 - to the machine that is placed i=
n=20
> eth3.

I think that the following rule is wrong :

> $IPTABLES -A FORWARD -i $WAN -d $WAN1_IP -o $PLUTO -j wantopluto

"-d $WAN1_IP" should be removed.

This script is a very early beta version, isn't it ?
