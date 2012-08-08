From: rahul shrivastava <shrivastavaone@gmail.com>
Subject: issue with ipv4options
Date: Wed, 8 Aug 2012 15:07:23 +0530
Message-ID: <CAE1WnGeP0x8PLJOMAmK9PAMXRJAqEuxZPmTrV_nLBXZXa+5mkA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=wIXHTKjirt+h1usI73LMopOqVm5Q4eMwcOVys8YY6Ng=;
        b=pJUzRZNLVGvnBrjVXvgmmdZAq4uV8gZCb+J9CvDMcY2a2oWS9m5b+ijgE1l8p9Mos5
         mIs1xTX9KslW4LxGATfwkY43YQp0VWKnOREvyzzj6kYAELSxB5hs3ZGEOoeez9pTGu6A
         7/5BooE3Fu0AxSvpNvQz4ioelqhME+Ct8CxANwdABn3rnDQSstNjDBDD0JjFrumfyJjJ
         C2UtBf8lIBTd0TuuGbvYXYQ4qDH9+Q2TXo/+Cmt3xJbl2Y/l+iR1tAuz4PZ8jxaCy6HU
         8Xpvyq/fGAtI7pDMKX/+M9YcMfpp9jsGGw+vMkbz+XrOzYUiTFBX7RXHJSwGmFbp89YM
         psPA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Hi,
 iptables -A INPUT -i eth0 -m ipv4options --ssrr -j DROP
iptables v1.4.9.1: Couldn't load match
`ipv4options':/usr/libexec/xtables/libipt_ipv4options.so: cannot open
shared object file: No such file or directory

Try `iptables -h' or 'iptables --help' for more information.

when i use above iptables command error is thrown for libipt_ipv4options.so file
after compiling xtable-addons i am getting libxt_ipv4options.so

iptable version is 1.4.9.1
xtable version is 1.45

iptables are expecting /usr/libexec/xtables/libipt_ipv4options.so but
xtables-addons are giving me libxt_ipv4options.so. so am not able to
use ipv4options filtering.
please tell me how i can make ipv4options filtering working on my
iptable v1.4.9.1

Thanks in Advance
