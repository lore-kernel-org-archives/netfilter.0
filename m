From: =?UTF-8?Q?Nuno_Gon=C3=A7alves?= <nunojpg@gmail.com>
Subject: Bug in the wiki
Date: Wed, 6 Jul 2022 10:36:54 +0100
Message-ID: <CAEXMXLRwFcx4UdjFe_15Q26iuT4K=coZLvBgYfkow_8o9=iB9Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=vDfCrKx8zsfifuvVmRfb8eu2ONEp0ijiM5rnG0SpiL8=;
        b=eGyxWyekK2j+I5B2oNgKc6k8ajg1QjHfXb8jCLyr9gkLx/zAwf/dUnmDH5CtHtR0wW
         JT8MTApWATPjzTcEIyFH/zyT5qdU9T5gWaUbdN0kIUMDOUC7eSSzYyGGp6SF6vaOG7EA
         0VINm/ocCBfMi4XiBnKuOUJjMk1j4yo1dYNK0hXi9xhV0i9zB4Zh/m2nJ3/+0po71EsK
         5AKi16VZOxnlaEPDv5SmvumGUqjsNHxC16S6pazKFa6kCF00dq8VrBWdZDdHKTH8KVC9
         BLP7i6UofJE+maoXYt/83jH7RbmC2N/oMOGqsH8B1CHrLZJkn0nSCQIwoW4gmA9+e+HN
         V/pA==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

https://wiki.nftables.org/wiki-nftables/index.php/Simple_ruleset_for_a_server

I believe in this example ct will accept echo-request regardless of
the rate limit.

To fix it, the line

> icmp type echo-request limit rate 5/second accept

Must be followed by

> icmp type echo-request drop

Also the same for icmpv6.

And ct must be moved to the end of the chain.

I suggest this is changed in the wiki.

Thanks,
Nuno
