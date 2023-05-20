From: Glen Huang <heyhgl@gmail.com>
Subject: Re: Why tproxy to 127.0.0.1:port doesn't make packets go through the
 input chain with iifname lo?
Date: Sun, 21 May 2023 07:07:01 +0800
Message-ID: <E442FE0A-FCDA-4CE9-9C17-E7C73949BA67@gmail.com>
References: <B4205731-F80B-4A87-B932-8749C51A06FB@gmail.com>
 <CAPFYX+JE_9UhOe_Oe7CsHBdZ4-kY=fi=zyfPt_DYFDRXwOnmqw@mail.gmail.com>
 <CAKcfE+bo1hJXF4M1rm2KfWGZ7meYKtfWfGBd6+Rktd2XiUMfdg@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.7\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684624026; x=1687216026;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:sender:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WQAzSmixb3nMviZLF5EMdM3ezzlkUccYsXB3HQ23Tig=;
        b=OUOT4mcxRTthsgZr8KqKznU8B9Wo6ZLVrHU1a5I2EDEMidHrpg+dFWppGPjYry+i5T
         Dyx4bxyoP9TE36zVQZU00YP7q2B/3WCfxnOkXRVwebZrhtoz/qaKVTXgU2j/T8ijkbNj
         BezccoBRG/NE/XoAPcRw8CTnBhKSgKJMFnjMhVYmONnLNEO7Yr3F68fdKU57i/fwwJ5+
         V/6qfOklFDGOGRs8DQmEUGxLpvFDTGgaN+SLZ36RT1Wh4QuGE2KbZnl4Y+Fy8Y6otZdk
         7ambscaetZ7tbnQi25FNbNvrVfwJl1WzrUzJP/Iq12JVZKcj9VuxRkLmuAHiAxN1lUA5
         rYbg==
Sender: Glen Huang <hey.hgl@gmail.com>
In-Reply-To: <CAKcfE+bo1hJXF4M1rm2KfWGZ7meYKtfWfGBd6+Rktd2XiUMfdg@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Balazs Scheidler <bazsi77@gmail.com>
Cc: =?utf-8?B?IkVja2wsIE3DoXTDqSI=?= <ecklm94@gmail.com>, netfilter@vger.kernel.org

Thanks for the detailed explanations M=C3=A1t=C3=A9 and Bazsi.

They answered a lot of questions I had.

I do have a couple of follow up questions if you don=E2=80=99t mind:

> The device in your advanced routing rule "ip route add local default =
dev lo table 100" is not really used for input purposes.

=46rom my test, without "meta mark set 1=E2=80=9D being after the tproxy =
rule, and thus bypassing the previous routing rule, a packet arriving on =
lan lands on no chain after it goes through the filter prerouting chain. =
I assume it gets dropped during the routing decision? With "meta mark =
set 1=E2=80=9D, after going through the filter prerouting chain, it =
shows up in the mangle input chain.

Maybe I missed something, but it seems "tproxy to 127.0.0.1:1234" is not =
enough to have a packet redirected to a local socket? My test belongs to =
the =E2=80=9Copen dynamically=E2=80=9D case you mentioned. I wonder if =
it's due to the conflict between tproxy asking the packet to be =
redirected to 127.0.0.1:1234, and the ip stack's refusal of treating the =
destination as local without the routing rule?

> iifname is not changed by the tproxy rule and the packet content is =
not overwritten either.

This makes sense.

I'm curious about how tproxy works because I want to differentiate =
between packets that intrinsically go through the input chain (which =
should be rejected) and those go through it because of the tproxy rule =
(which should be accepted). I initially thought I could just reject any =
packet go through the filter input chain with iifname being =E2=80=9Clo=E2=
=80=9D. But if it=E2=80=99s not changed, what would be a good way to =
differentiate?

I did found out that with "meta mark set 1=E2=80=9D, the mark was still =
set in the mangle input chain, but it got cleared in the next filter =
input chain. So I  guess it=E2=80=99s a dead end.

>  It does not need to be in the nat table, in the iptables times we put =
it in mangle IIRC.

I did use mangle in my real device, but mistakingly typed nat here, =
sorry about the confusion.

Regards,
Glen=
