From: Ricardo Klein <klein.rfk@gmail.com>
Subject: Ipset kernel panic
Date: Mon, 15 Oct 2012 04:09:59 -0300
Message-ID: <CADuigkXeFM+N89kwzr8pUPKN5A-qccK5-4juYmutYCcq8XHC4g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=+UHs+mrze0My6OD+61AZCExQwBOgyfrXP5P2/Ju5l+I=;
        b=0x0jDIEkEGAYGFsysVxsmUNRItz3jgOgQP0qwDbR2G8xmddS0/AGqgzSyXY1kTFc4M
         EACscYhRUsppJTrl1rRwmMiFNm4tVtZ0i0qM7vR9fb4TuCkhB8uMtispkn/zTnr/WMCp
         02KJZLTR9JeOI+p4dS7exbJe98XEHrM7T3N9thph2GVkplDloT+dK+bcLwMmk//pvgaj
         RFIn53IrDDmid21xrDY75+3c/lJC3k3ujiGVSGK0RD/vgoMtC4YE2xPptIniKluqjsM3
         ve6FsmrKtz75fCfhYCIHl1rsMZ2m5hVya7SKb3552+fX4sdEvgDnc5sRYlSPcXjEEIBm
         E1iA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi there,

When I create a set like this "ipset create test bitmap:ip,mac range 0.0.0.0/0"
and try to list with "ipset list" I got a kernel panic.
ipset v 6.11
CentOS 6.3


--
Att...

Ricardo Felipe Klein
klein.rfk@gmail.com
