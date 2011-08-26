From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: -j DNAT doesn't accept nonnumerical port
Date: Fri, 26 Aug 2011 09:54:35 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1108260952070.6835@frira.zrqbmnf.qr>
References: <4E565CC0.6050207@mejor.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E565CC0.6050207@mejor.pl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="windows-1252"
To: =?UTF-8?Q?Marcin_Miros=C5=82aw?= <marcin@mejor.pl>
Cc: netfilter@vger.kernel.org

On Thursday 2011-08-25 16:31, Marcin Miros=C5=82aw wrote:

> Hello!
> Iptables accept such line without problem:
> iptables -t nat -A PREROUTING -p tcp  --dport pop3 -j DNAT --to-desti=
nation
> 1.2.3.4:25
>
> Destination port is defined by word. So i wanted to use use the same =
trick in
> DNAT but i've got:
> # iptables -t nat -A PREROUTING -p tcp  --dport pop3 -j DNAT --to-des=
tination
> 1.2.3.4:smtp
> iptables v1.4.12: Port `smtp' not valid
>
> Is it intentional behavior of iptables? I can't see any info about it=
 in man.

At least it is not a regression.

DNAT does not accept names currently, and I can guess this is because=20
of:

Port names can contain pretty much any character except \0, so there is=
=20
no way for DNAT, without symmetric delimiters like '[' and ']' for=20
example, to know from the user specifying "smtp-imap" whether s/he mean=
s=20
the single (fictional) port "smtp-imap", or the range 25--143.
