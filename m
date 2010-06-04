From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: Advanced Logging
Date: Fri, 4 Jun 2010 07:47:14 +0530
Message-ID: <AANLkTinkq6e66NTi4PSkAF5fa1do9pj8BlzB18xrJGHz@mail.gmail.com>
References: <AANLkTimgYvZZ80VgAU4kpLyqKwOMo6u81QCDhX_lD72p@mail.gmail.com>
	<AANLkTilirP3XipLJewk9fbW_ePm2kZb9QzxdvReyUrDv@mail.gmail.com>
	<AANLkTikt1N0vb0Y0S_akVrvvcboyXfEjU_97tqgEK0jz@mail.gmail.com>
	<alpine.LSU.2.01.1006032043580.16179@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=8IcaPFr7sbpd/7+8+GvlniImLCScxLJSqajIPwBq0ss=;
        b=pw0p/nEuZEmR3Icl7B/bhItGDFRICI9FyuHKt1bC0aYPW91a747D0K6EfZOGMpU2xG
         ViYwjUJTTiroG1/6fphPj3yk7+6dzUBCGQEI/+UG9kKH2CCwWIcukcjdeio+MI6JGgpo
         AkRUp6sgCHQjkKoaovkAZUxgaHkO88iNvYxak=
In-Reply-To: <alpine.LSU.2.01.1006032043580.16179@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Netfilter mailing list <netfilter@vger.kernel.org>, ulogd@lists.gnumonks.org

On Fri, Jun 4, 2010 at 12:32 AM, Jan Engelhardt <jengelh@medozas.de> wr=
ote:
>
> On Thursday 2010-06-03 20:15, ratheesh k wrote:
>>2010/5/30 Tom=C3=A1=C5=A1 Vl=C4=8Dek <tomasvlcek@gmail.com>:
>>> Maybe psad (Port Scan Attack Detector) is that what are you looking
>>> for. Check http://cipherdyne.org/psad/index.html.
>>
>>I gone through the link . It seems to be heavy for my embedded applic=
ation .
>
> Yes it looks complicated from a developer POV. I myself think
> why would it have to put up with analyzing log messages
> (which are known to be not overly precise) when direct delivery
> with libnetfilter_queue/_log seems like a more ideal goal -
> eliminating the extra trip through syslog and the fs.
\
Thanks Jan .
ulogd demon could be modified to do analysis of packet  to find out
what of kind of attack has taken place ?


-Ratheesh
