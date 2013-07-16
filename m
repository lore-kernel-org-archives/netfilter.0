From: Ricardo Klein <klein.rfk@gmail.com>
Subject: Help with Load Balancing
Date: Tue, 16 Jul 2013 00:23:38 -0300
Message-ID: <CADuigkViSbrbHoO_8-htS-6yRvEqi5MoRdB32N=MSexyjxS1Hg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=zKRMt0T/A/kO2fNZ8j0n1SJ/7WgMqEr+0vebDnXo6Ds=;
        b=hrNCXi9SPolxURRtbIfYD4tiRiE34qJnMSC/xVcpL5lR5ZjXAw1d1UsBt1rNJ44xJ6
         RrWNCq1AjDobxhZxLqHYoilP9XmFNM5mjolyFWzMuBn/bIsinWrwxNoKnzvqhW/BvUKo
         q9o04a6wJCXi8OXHZnXjT3C09J7d8fAHlcp4oqoPska2SkiTWTOMlMKsar0QuGrUxo4H
         QDJrzlLIzKC6wpFpJmncv/KyqDG38JPbPS0mmp0TVsnF2ZoHMa+Xy6uGp6XfKtR1Dman
         OFtIELNrJnBCNQFfogkHmNyuDPFTdTkRohLye30R/ff+y4GbaHEvRwFgpsM/BHTl+edF
         /IuQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

I think IPRoute is the one who should make the magic, but, if anyone
can help me here, even pointing me in the right way....

I know I can split my 2 connections in a static way, making lan subnet
A go trough uplink 1 and lan subnet B trough uplink2, but, there is
any way to make this "automatic" like "Hey iproute2, use the least
used uplink to let users fly"

I know, if user A is using uplink1 it should go trough that link until
the end of the navigation, but, later in new requests he should be
able to start the connection using uplink 2 if uplink 1 is starving.

Is there any way to reach that with Linux?


--
Att...

Ricardo Felipe Klein
klein.rfk@gmail.com
