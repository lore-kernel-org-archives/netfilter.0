From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: cross-compile mips iptables segmentation fault on some
 commands
Date: Wed, 7 Jul 2010 19:14:38 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1007071914030.31991@obet.zrqbmnf.qr>
References: <AANLkTikF1V4vXmLn6FlbdSnr9MMa0qgfa9BWkLajfJoO@mail.gmail.com> <AANLkTilp04X5REt5yyWrlzoUiWQx_OQU2v79VOXa0rzf@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTilp04X5REt5yyWrlzoUiWQx_OQU2v79VOXa0rzf@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: miranoko <miranoko@gmail.com>
Cc: netfilter@vger.kernel.org


On Thursday 2010-07-01 20:00, miranoko wrote:

>I cross compiled iptables for mips architecture and tried running iptables.
>when i do input accept or drop it works.
>but when i do iptables -A xyz it produces segmentation fault.
>other commands iptables -v and save,restore work fine.
>Please let me know what i am doing wrong. what logs should i be
>looking at for this.
>
>/ # iptables -P INPUT ACCEPT
>/ # iptables -P INPUT DROP
>/ # iptables -A I
>Segmentation fault
>/ #

I don't have mips myself. Can you isolate? printfs, gdb, valgrind,
whatever works.

