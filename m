From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: Limit on number of rulesets?
Date: Wed, 16 Apr 2008 13:51:46 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804161341570.9438@fbirervta.pbzchgretzou.qr>
References: <lou904pmh4hkcovha7fkv9o37vnmt27ud5@4ax.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <lou904pmh4hkcovha7fkv9o37vnmt27ud5@4ax.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: iptables@haveland.com
Cc: netfilter@vger.kernel.org


On Tuesday 2008-04-15 21:18, iptables@haveland.com wrote:
>
>It is still working, and doing its job well - but I think it has reached an
>arbitrary limit. As there are about 60,000 individual addresses banned and
>other rules, could it be that rule ids are short ints?

No, IIRC it is a linear byte stream of concatenated rules.
I have had more than 250000 rules before -- when there's no more
"space", you will get an appropriate error message.

>/etc/init.d/iptables stop also hangs, but ctrl-C then gives this error:
>Message from syslogd@gaia at Apr 15 21:15:31 ...
> kernel: Oops: 0000 [3] SMP
>Message from syslogd@gaia at Apr 15 21:15:31 ...
> kernel: CR2: fffffffb8815b7d0
>
>An interesting problem - but what process would I need to kill to be able to
>release iptables and reload? Or is this even possible if part of the kernel?

It is an oops. Some process likely got killed as part of doing
some operation while in kernel space, therefore leaving something
locked, causing other apps to hang over time and requiring a BRS.
