From: Oguz Yilmaz <oguzyilmazlist@gmail.com>
Subject: connmark problem
Date: Tue, 26 Jun 2012 11:38:21 +0300
Message-ID: <CAAo+KFkwRHnyxPPaEjbhzBJaB-x3qf5w_6ogg-dJQipqP4npyg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=kG+xOVLzO1v4TZEESySGUF6PxxzWrmiHUmBoGDIuPPI=;
        b=ocjduZwuKXmGGzsen5m3MkmdMwWfeIwUA54m4vIONJ/c1WdxvP57yftTQzrlTlqqHN
         iFfwpRFSQo+zYC8miFyzqlpD+z0HFoT9o8hs9lvMkgyg2S4Cld+HAUmiMdP6FwQ+NFgw
         J2i9X14xcgC+CtRGA6b8U8VetU83dxYR1y0KWTJ+3NjYESthXZH7VU1TGDtrkcmmXZtU
         kFhJZ2H0PdtuxvBpS1vkcxo0xCYxNPIGzTmRqP5T27ST3pHQKkQ99I75PrJLMOGe4QU+
         cFabfobcYLe+A41vK6ZjdvqVBrGQRKhDy1jj8zD86OgedUk54CHsmrjy4lqFKaZeTjma
         xRGg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

Hi

I use connmark in raw table. Please look at the following -L output.
At the beginning of the chain I copy packet mark to the connection. -m
mark matches packets. However -m connmark not matches. It is clearly
visible from packet counters.
How can we explain this?

Regards,
O=C4=9Fuz.


-t raw
Chain PREROUTING (policy ACCEPT 61M packets, 32G bytes)

 8173 4803K ACCEPT     all  --  *      *       127.0.0.1            0.0=
=2E0.0/0
 127K   35M CONNMARK   all  --  *      *       0.0.0.0/0
0.0.0.0/0           CONNMARK save
    0     0 LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0           CONNMARK match 0x12/0xfff LOG flags 0 level 6
prefix `ACCEPT:
'
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0           CONNMARK match 0x12/0xfff
 7897 4074K LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0           MARK match 0x12/0xfff LOG flags 0 level 6 prefix
`ACCEPT:'
 7897 4074K ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0           MARK match 0x12/0xfff
