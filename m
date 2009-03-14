From: "J.O. Aho" <trizt@iname.com>
Subject: Re: kernel 2.6.28/iptables <=1.4.2 not working together?
Date: Sat, 14 Mar 2009 11:59:01 +0100 (CET)
Message-ID: <alpine.LNX.2.00.0903141157460.20463@quad.local.lan>
References: <alpine.LNX.2.00.0901311807001.24298@kennis.local.lan> <49883751.6010700@plouf.fr.eu.org> <alpine.LNX.2.00.0903141103050.20196@quad.local.lan> <49BB87C0.4030200@plouf.fr.eu.org>
Reply-To: "J.O. Aho" <trizt@iname.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-2120603283-1237028342=:20463"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49BB87C0.4030200@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2120603283-1237028342=:20463
Content-Type: TEXT/PLAIN; charset="iso-8859-15"; format="flowed"
Content-Transfer-Encoding: quoted-printable

On Sat, 14 Mar 2009, Pascal Hambourg wrote:

> J.O. Aho a =E9crit :
>>  On Tue, 3 Feb 2009, Pascal Hambourg wrote:
>> >  J.O. Aho a =E9crit :
>> > >=20
>> > >  iptables -t mangle -A OUTPUT -p tcp --dport 20:21 -j TOS --set-tos =
16
>> > >   Keep in mind that ipt_TOS has been merge into xt_dscp and modinfo =
on
>> > >   xt_dscp gives an alias list with ipt_tos.
>> >  Since kernel 2.6.25, ipt_TOS has been merged into xt_DSCP (target), n=
ot=20
>> >  ipt_dscp (match).
>>
>>  So back to my question, how to rewrite the rule to work with target
>>  instead of the old match?
>
> You do not have to rewrite the rule. But since the TOS target is now hand=
led=20
> by the xt_DSCP kernel module, you must have this module enabled in your=20
> kernel configuration (CONFIG_NETFILTER_XT_TARGET_DSCP=3Dy or m).

Thanks for the reply, I was so sure that I had enabled the module when I=20
built the kernel, but I guess I checked the kernel config for a virtual=20
machine.

--=20
      //Aho

  ------------------------------------------------------------------------
   E-Mail: trizt@iname.com            URL: http://www.kotiaho.net/~trizt/
      ICQ: 13696780                                         Skype: jo_aho
   System: Linux System                        (PPC7447/1000 AMD K8/2500)
  ------------------------------------------------------------------------
             EU forbids you to send spam without my permission
  ------------------------------------------------------------------------
--8323328-2120603283-1237028342=:20463--
