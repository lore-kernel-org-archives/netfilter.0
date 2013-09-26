From: TS R <wmsiva@gmail.com>
Subject: Dropping ESP fragments
Date: Thu, 26 Sep 2013 13:46:05 -0700
Message-ID: <CAGTRDUKQtL_462L7nbbDgiDEz_vdXCUXbbK5_qTTzcLV2QcO9Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=Od4LyBe01pxkIpHpS7XanuEWRtm28+FfmTgPOV4ARQM=;
        b=aiBMaZTUJSVSyRSjUCteStrz1hBCypBh3dTI0sOaz0ylF+7NhtKrk374lcXheevD8/
         YIko34NcjZdMiYVjv92ehy3S4snO7wz0eFr9KmV+98HLptgy/eauUifPPa3agnC9ZDjn
         YiHRhyGqoy7serM5EonBihqJoqeHZQWXTNnSLWLPN4R0LYGNXntTNR5/dB1V8xBRyGj4
         tbvRDhCEZaCgAMhPKjLesnKe0oGA6o8vGGiTCW0efVS0oxVakyar5gJSCxcOY5z1cXdr
         1xc/3e+EFKU+TH3+SiQQ5fvRGrP4jVNa60vcWlmnrBD5K3ncH4nxwRw4vP6r0lh9r+k5
         mnKw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Hello,

ESP based IPsec tunnel (strongswan) is established between systems A and B.
A's outer IP 10.3.20.10 and its inner header IP is 172.16.2.11.
At system B's input, I want to drop ESP fragments coming from system A.

iptables -A INPUT -f -p 50 -m esp -j DROP doesn't seem to work. The
fragments aren't dropped.

Could you please tell me what is going wrong here?



            10.3.20.10
        +-------+
                    +-------+
        |         |172.16.2.11                            10.3.15.20
          |          | 192.168.2.x/24
        |   A    0==============================0   B    0===
        |          |
                         |          |
        +-------+
                    +-------+

-TSR
