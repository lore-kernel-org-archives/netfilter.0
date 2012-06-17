From: Yang Yang <kormny@gmail.com>
Subject: How to fix 'undefined symbol: ip6tc_ops'
Date: Sun, 17 Jun 2012 16:28:39 +0800
Message-ID: <CAMOvP7fwUCn0v+BVYeR7mX9XGu7O1m8fx0YxrW0BeiZYZ2rm=A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=s1AqTnJbWth6O3imXyQwPYvy9ubwudIEeg6X/DcgJiQ=;
        b=MJ4494K+pxd6LVVoAA2Q8LNWlrurV8uIdx/YuqbG3o+4ymRN6GVJ3RVpfYtnLl2K9H
         I1wvjOddli4/P/Cf6HX/BsXd0DomkZghFTcG8ljkhZe9iTRfZWX1gmjKxsmF86GYhaFK
         VysH8F+G2q++L1MUVy4ql54RFwhwcu7D6aZVH4ATdaxEvBki/p7KR8h3ItgjGcDjp8uQ
         cIUpJGQPHd4pry+XA5j89b/TJIQxdJ8PR+cCohW132UfBCE30NAztTchRQ8cSg/1TM3D
         pDYav9iG+T6ewYn5U/N+DvEUQTu57uunX7FfdOGSkBVza6M6JUHaQRUp+TzMxBwbT0y8
         7JmA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I just have cross compiled iptables for my ARM-Linux board, but when I
tried run it, the error 'iptables: symbol lookup error: iptables:
undefined symbol: ip6tc_ops' occurred.

I have no idea how to fix it, is there anyone can help?

here're the details:

s3c6410 (ARM11)
Linux-3.0.1
iptables-1.4.14
Error : iptables: symbol lookup error: iptables: undefined symbol: ip6tc_ops

Thanks.
--------
Regards,
Yang Yang
