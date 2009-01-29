From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re[2]: install patch-o-matic on fedora10
Date: Thu, 29 Jan 2009 13:01:22 +0100 (CET)
Message-ID: <alpine.LSU.2.00.0901291300250.12992@fbirervta.pbzchgretzou.qr>
References: <E1LSBtG-0006O1-2y@web07.mi6.kiev.ua> <alpine.LSU.2.00.0901281711530.20921@fbirervta.pbzchgretzou.qr> <E1LSQuO-0001Ds-RQ@web04.mi6.kiev.ua>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <E1LSQuO-0001Ds-RQ@web04.mi6.kiev.ua>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Ivanov <handler@ua.fm>
Cc: netfilter@vger.kernel.org


On Thursday 2009-01-29 08:01, Alex Ivanov wrote:

Don't strip Ccs!

>Yes, I have this file, but I have so:
># iptables -m nth --counter
>iptables v1.4.1.1: Couldn't load match `nth':/lib/xtables/libipt_nth.so: cannot open shared object file: No such file or directory
>I'm very litle know about this matter so please help me install it

I just said that '-m statistic' is what you should use.
