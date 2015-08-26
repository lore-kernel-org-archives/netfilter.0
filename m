From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: how to use hash:ip,mark in iptables ?
Date: Wed, 26 Aug 2015 14:39:19 +0530
Message-ID: <CAA5aLPif6jVbzvaLNWStY-Y_6uqva+cS4Wi8sXTNkJ5GG55CBg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=DHjo8mlqwOTHTb3IzDWr4TIWjXdiuymgdUkw5zhI9qs=;
        b=GazKpk8f5Vu+32RQiBf7AyF/2yEmqhYnf1aqLYRrNg5fPIIxVS6OECTc2tQfCHXzMz
         NDxPN8PLbFtpm64BBYJM1MRGHl2JnQv0m6taqR8AYM4/4riufTCdu5ld8UkAGeRoxitN
         QjIGgpyV4stSX3Am9emWtvKSMG7N1amgf+6e2mJZG/g+Z0gNRlDFBFksfiDXctNkZ7t5
         7eZakeuWfBX5TDaXZfHJZ8PWNezRPNTYYoJZR1hj7zl8x91ZA80Om+/yZdpBGxuSLt7w
         luwWuG1usC2rRn7IlTXq2JBxylPGcTVu1Ru6tcTa3usXr3JAsqYdAh6ntltgXM4RlUSk
         lvDw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

how to use hash:ip,mark in iptables ?

I can create ipset, but how to match it in iptables?

something like -m SET --match-set src,mark

or something else altogether?
