From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: kernel 2.6.28/iptables <=1.4.2 not working together?
Date: Tue, 03 Feb 2009 13:23:45 +0100
Message-ID: <49883751.6010700@plouf.fr.eu.org>
References: <alpine.LNX.2.00.0901311807001.24298@kennis.local.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.0901311807001.24298@kennis.local.lan>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "J.O. Aho" <trizt@iname.com>
Cc: netfilter@vger.kernel.org

Hello,

J.O. Aho a =E9crit :
>=20
> Keep in mind that ipt_TOS has been merge into xt_dscp and modinfo on=20
> xt_dscp gives an alias list with ipt_tos.

Since kernel 2.6.25, ipt_TOS has been merged into xt_DSCP (target), not=
=20
ipt_dscp (match).
