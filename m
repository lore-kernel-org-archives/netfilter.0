From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Advanced Logging
Date: Thu, 3 Jun 2010 21:02:36 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006032043580.16179@obet.zrqbmnf.qr>
References: <AANLkTimgYvZZ80VgAU4kpLyqKwOMo6u81QCDhX_lD72p@mail.gmail.com> <AANLkTilirP3XipLJewk9fbW_ePm2kZb9QzxdvReyUrDv@mail.gmail.com> <AANLkTikt1N0vb0Y0S_akVrvvcboyXfEjU_97tqgEK0jz@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikt1N0vb0Y0S_akVrvvcboyXfEjU_97tqgEK0jz@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="utf-8"
To: ratheesh k <ratheesh.ksz@gmail.com>
Cc: =?UTF-8?Q?Tom=C3=A1=C5=A1_Vl=C4=8Dek?= <tomasvlcek@gmail.com>, Netfilter mailing list <netfilter@vger.kernel.org>, Pascal Hambourg <pascal.mail@plouf.fr.eu.org>


On Thursday 2010-06-03 20:15, ratheesh k wrote:
>2010/5/30 Tom=C3=A1=C5=A1 Vl=C4=8Dek <tomasvlcek@gmail.com>:
>> Maybe psad (Port Scan Attack Detector) is that what are you looking
>> for. Check http://cipherdyne.org/psad/index.html.
>
>I gone through the link . It seems to be heavy for my embedded applica=
tion .

Yes it looks complicated from a developer POV. I myself think
why would it have to put up with analyzing log messages
(which are known to be not overly precise) when direct delivery
with libnetfilter_queue/_log seems like a more ideal goal -=20
eliminating the extra trip through syslog and the fs.

