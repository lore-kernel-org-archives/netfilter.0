From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: kernel 2.6.28/iptables <=1.4.2 not working together?
Date: Sat, 14 Mar 2009 11:32:32 +0100
Message-ID: <49BB87C0.4030200@plouf.fr.eu.org>
References: <alpine.LNX.2.00.0901311807001.24298@kennis.local.lan> <49883751.6010700@plouf.fr.eu.org> <alpine.LNX.2.00.0903141103050.20196@quad.local.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.00.0903141103050.20196@quad.local.lan>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "J.O. Aho" <trizt@iname.com>
Cc: netfilter@vger.kernel.org

J.O. Aho a =E9crit :
> On Tue, 3 Feb 2009, Pascal Hambourg wrote:
>> J.O. Aho a =E9crit :
>>>=20
>>> iptables -t mangle -A OUTPUT -p tcp --dport 20:21 -j TOS --set-tos =
16
>>>  Keep in mind that ipt_TOS has been merge into xt_dscp and modinfo =
on
>>>  xt_dscp gives an alias list with ipt_tos.
>> Since kernel 2.6.25, ipt_TOS has been merged into xt_DSCP (target),=20
>> not ipt_dscp (match).
>=20
> So back to my question, how to rewrite the rule to work with target=20
> instead of the old match?

You do not have to rewrite the rule. But since the TOS target is now=20
handled by the xt_DSCP kernel module, you must have this module enabled=
=20
in your kernel configuration (CONFIG_NETFILTER_XT_TARGET_DSCP=3Dy or m)=
=2E
