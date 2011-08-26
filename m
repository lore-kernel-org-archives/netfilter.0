From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Theoretical question: need for filter table in the POSTROUTING
 chain
Date: Fri, 26 Aug 2011 09:56:15 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1108260954570.6835@frira.zrqbmnf.qr>
References: <4E5634C3.80908@freemail.hu> <4E56617E.4040704@riverviewtech.net> <4E566A88.2040309@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E566A88.2040309@freemail.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: =?UTF-8?Q?G=C3=A1sp=C3=A1r_Lajos?= <swifty@freemail.hu>
Cc: netfilter list <netfilter@vger.kernel.org>

On Thursday 2011-08-25 17:30, G=C3=A1sp=C3=A1r Lajos wrote:

>
>> How about putting a reject route in the kernel routing table?
> Yeah.. that is an alternative...
> But:
> - I want to REJECT any tcp sessions with tcp-reset,
> - and any other protocoll with icmp-admin-prohibited.
> - I would like to do it in iptables/netfilter.
>
> The main question is: Why do not we have such a table in the POSTROUT=
ING chain?

If they did not go through nat, the packet's computed state was most=20
likely INVALID or UNTRACKED to begin with. And that you can already=20
filter for in FORWARD.
