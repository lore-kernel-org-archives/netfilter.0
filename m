From: James Anderson <japanwikidonate@gmail.com>
Subject: quota display in iptables -L
Date: Fri, 9 Mar 2012 09:19:42 +0900
Message-ID: <CAL2t0L5bnu9pX_h01HtvEaurdhDa_QHdc6OeVfy3e4hoKe893g@mail.gmail.com>
References: <CAL2t0L4JR-kPUogudF+vWaypYjQmCPureZE6yM4PjYEVV+XhTg@mail.gmail.com>
 <CAL2t0L4r5ANvRyM=7Spnx68=wMcQCTR7qDH94V4-TRbXCKA-Gg@mail.gmail.com> <CAL2t0L4AjXx8QR22Q5cdh6ndPpmmrr58x-t6HG7kHZ6UadtOBg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date
         :x-google-sender-auth:message-id:subject:to:content-type
         :content-transfer-encoding;
        bh=qZflTp4mW0x6L4IJs4on17UiI7xpZMPhwNCVJTWQEV0=;
        b=pe7je31/zAUmBIXYgiU7fi5ebVe5BDUZN6ABPnpsN4h7bqKSrgQrNEU1gx22XmXWGg
         4czpGL+rldPC+c0rqmw60qzUIuc49QLq/GjbHLgE/PZ/Wr0n8u5/8MWa2/4sy2oO/5iW
         oNVa0QuVWCDSXJz63s096VbLyjAdZ7HFhNQRxOXdKq+tJ+MxFA+ZXFsCKfIyxNmM3FJn
         dqjzruFn/EsG0M8p8kKYkFln/84LpHCXaQ8OiSlbjkbMo3E7q5+Wl520gEa3mBxsmh8M
         eOXUncddFbo1111QN6aS1H/1y0KiJ6XPMkOiTJp/g/fm3L5zbtDbkXgXwX7k/BmUEk4I
         F/4A==
In-Reply-To: <CAL2t0L4AjXx8QR22Q5cdh6ndPpmmrr58x-t6HG7kHZ6UadtOBg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello everyone.

I have been trying to get iptables to stop traffic to the internet
after I have exceeded 29.8 GB and just allow traffic to the local
subnet after that. I did the conversion on google and apparently
29.8GB is=A031997506400 bytes. However tonight when I got home and did
iptables -L -v, I saw this:

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
=A0pkts bytes target =A0 =A0 prot opt in =A0 =A0 out =A0 =A0 source
destination
=A0 =A028M =A0 =A032G =A0 ACCEPT =A0 =A0 all =A0-- =A0any =A0 =A0any =A0=
 =A0 anywhere
!192.168.2.0/24=A0=A0 =A0 =A0quota: 31997506400 bytes
2459K 3621M =A0ACCEPT =A0 =A0 all =A0-- =A0any =A0 =A0any =A0 =A0 anywh=
ere
192.168.2.0/24
=A0 5770 1151K =A0 REJECT =A0 =A0 all =A0-- =A0any =A0 =A0any =A0 =A0 a=
nywhere
anywhere =A0 =A0 =A0 =A0 =A0 =A0reject-with icmp-port-unreachable

At first I thought the quota didn't work, but then I did iptables-save =
-c

*filter
:INPUT ACCEPT [23078834:14787771556]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
[28216466:31997506128] -A OUTPUT ! -d 192.168.2.0/24 -m quota --quota
31997506400 -j ACCEPT
[2475569:3622559686] -A OUTPUT -d 192.168.2.0/24 -j ACCEPT
[24154:2350411] -A OUTPUT -j REJECT --reject-with icmp-port-unreachable
COMMIT

which shows that it stopped at 29.7999998 GB.
Could someone perhaps explain the discrepancy?
Does iptables keep counting bytes even after the quota is full?

many thanks in advance,

James
