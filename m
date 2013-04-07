From: Yonatan Broza <yonatan.broza@gmail.com>
Subject: Some netfilter log messages are missing a log prefix
Date: Sun, 07 Apr 2013 17:31:24 +0300
Message-ID: <5161833C.4090807@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=Wx3kDvaiKSiDfPF0MQCmV8A2zMonEumQmQmEzmAcnI8=;
        b=QaEUL+1OgeL7hxYZG+s1/eTIJcsOD/EbMUESZb9omutjqXgCCCKlDTQRQXq4vC5oz4
         bPaveTUaLy3tITvwTpTo35CNWAs4FpKrbp2+z37O0XCo0CmnJpeLHux3Tz4W+kUx4D53
         CgCCXWifP6zygtPTz5al9ls7NHamm94d4QqfxXO7rlm2mAVNOykF0VxxyTUrDXjpQGCx
         +6Kf3FghS/oo4P4240EHpkJdIJAwfZoNDpY6GLeCdKHm8O8NTJyvHvL1hd1S4uQZJgac
         4WFoDrTHSE5X+X6YG+NXgMUWasYmXWtlbGN2LOk+nZFoIWd8QXTe//N9xXhXqU/RPf+5
         CwQQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi list,

I added logging rules to all of netfilter's built-in chains using the 
following script:

https://gist.github.com/anonymous/5330491

All logging rules get the correct --log-prefix argument (verified by 
using "iptables -t table -L -n -v" commands; also verified that there 
are no other logging rules present).

Why do I still get some log messages in syslog that don't have a log 
prefix at all?

Additional info:
# iptables --version
iptables v1.4.14
# uname -a
Linux debian 3.2.0-4-amd64 #1 SMP Debian 3.2.41-2 x86_64 GNU/Linux

Thanks.
