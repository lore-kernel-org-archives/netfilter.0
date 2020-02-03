From: Miriam Rico <miriam.rico@enigmedia.es>
Subject: Is it possible to differentiate a nmap port scan from a syn flood attack?
Date: Mon, 3 Feb 2020 09:51:09 +0100
Message-ID: <CAAKiOS-Roh1_qnv-_C-GVSbv-oBSr-GWdPDnoars=jbSdiTMnA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=enigmedia-es.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=bvnm7Qo8Fjj7sMOqKgLeiu8hbFvGMCxGeaxZOhe9GIg=;
        b=UnA0wtEF1xErmqtvuEqHXYp2Ra2MuzuzfVRE1QvZdr+34NUvQltnWnJIrbMZIASjxC
         jXzx0Emk4WvqqtYYtBLq2CprcMKQo/CAcFZ3qUffFaDLBjdDkdDvFG5YbftglY8evzmt
         4FmJEf/lemX3RaMCTbLw2uSIBADaSBMo43mfpxAI2QmKoauMrAFFueh1MjUstVApqI2Z
         MwMgyCm9dBq5cXi//21y0pGKpF8wQshblJ78hunRVvxfhxqkGyfUntR1FIihYm9o5D1t
         li8M6JE+5Wy800/pDk5cQcjn5P//vuSp6CIFCKWZ99k47RLJsDPSAWe1wz1oERJ0dCsD
         SKiA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I am trying to log the different attempts of attacks such as a tcp
port scan, a udp port scan, a syn flood attack, ... arriving at a
computer.

I would like to classify attacks received in sections such as warning
and critical. Warning would be port scans and critical syn flood
attacks. However, I don't get the necessary rules to be able to
differentiate a syn flood attack of a tcp port scan.

Is it possible to differentiate a nmap tcp port scan from a syn flood attack?

I am using Ubuntu 18.04 with Kernel 4.18.

Thanks in advance,
