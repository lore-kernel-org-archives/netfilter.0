From: "J.O. Aho" <trizt@iname.com>
Subject: Re: kernel 2.6.28/iptables <=1.4.2 not working together?
Date: Sat, 14 Mar 2009 11:04:42 +0100 (CET)
Message-ID: <alpine.LNX.2.00.0903141103050.20196@quad.local.lan>
References: <alpine.LNX.2.00.0901311807001.24298@kennis.local.lan> <49883751.6010700@plouf.fr.eu.org>
Reply-To: "J.O. Aho" <trizt@iname.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-1781105998-1237025083=:20196"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49883751.6010700@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1781105998-1237025083=:20196
Content-Type: TEXT/PLAIN; charset="iso-8859-15"; format="flowed"
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Feb 2009, Pascal Hambourg wrote:
> J.O. Aho a =E9crit :

>> The one of the lines (the others are similar, different port numbers)=20
>> looks like this:
>> iptables -t mangle -A OUTPUT -p tcp --dport 20:21 -j TOS --set-tos 16
>>  Keep in mind that ipt_TOS has been merge into xt_dscp and modinfo on
>>  xt_dscp gives an alias list with ipt_tos.
> Since kernel 2.6.25, ipt_TOS has been merged into xt_DSCP (target), not=20
> ipt_dscp (match).

So back to my question, how to rewrite the rule to work with target=20
instead of the old match?


--=20
      //Aho

  ------------------------------------------------------------------------
   E-Mail: trizt@iname.com            URL: http://www.kotiaho.net/~trizt/
      ICQ: 13696780                                         Skype: jo_aho
   System: Linux System                        (PPC7447/1000 AMD K8/2500)
  ------------------------------------------------------------------------
             EU forbids you to send spam without my permission
  ------------------------------------------------------------------------
--8323328-1781105998-1237025083=:20196--
