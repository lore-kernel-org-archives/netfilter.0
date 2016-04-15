From: Archie <highsky@gmail.com>
Subject: PCRE text search engine (ts_pcre)
Date: Fri, 15 Apr 2016 22:28:34 +0900
Message-ID: <CAN4GSsfzRfJ2-J0nK5diC3hQG8+x9FKj0eBneXDwnhuz30yZag@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to;
        bh=UDSHoVrgNLan7lRNULv4O3haG6GhQbDG9F1+n8A+L9U=;
        b=m6g/mz68yxQ9k9QUDqA6KPIdupOObXCm+crpaBa6hXXQrMO4UIfrFKYrQwtYCzvUbS
         mdSfUqsFbYjijO2nkwcCbG8V10NPlJwVbWTTS/UrbaPfhReHP72rp16FbuCW3CSzeCGI
         gFSTCI8TE4yVwpqTG7U11hbG0XkuCX1qur08AolniObRlbhzmmvPtcP78wM7Gb2fLEoK
         oBG7DJAdxqFIDsAmffy+5yj5NK7WeYdVkQ1PjgrHgOaSjPJ6qWc6+H4FH2EUZC6z4DMp
         IKMp5yMh6W1iAW4rUiBmMsrw4uVs1XvLF2w8z5OyjMhTQKluLQsr5ZYGaJ1DcOL4kpND
         p1lQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

PCRE2 has been ported to linux kernel.

https://github.com/xnsystems/kpcre

You can filter packets using PCRE syntax like below.

iptables -A INPUT -p tcp -m string --string "/[Hh]ello.+World
[^/r/n]{20}/i" --algo pcre -j DROP

I hope it helps. :)

Best regards,
Seongmyun Cho
