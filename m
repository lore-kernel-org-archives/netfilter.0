From: Kiernan George <kbg98@vt.edu>
Subject: Creating a map programmatically using the C library libnftnl
Date: Mon, 27 Mar 2023 14:04:45 -0400
Message-ID: <CAOg40qh_1Fse-qHwBMZW9mQdbMma9VPMbOkr6d1wpF9YeUYdFg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20210112.gappssmtp.com; s=20210112; t=1679940296;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hILz4BgehGAZaw8L5e9syuv3JxXjatjJ7KlOoMySvz8=;
        b=Y0CxM1P9wqntXxz8V17VACtmZk1arPT9iQ+SDOVO9UftFHKyZYGVDd0h+cHe9F+BYF
         Lv/5kaY4EkraDnwHUYFbOMI7DTixPsA0sW4N6hp4IyTaJ4GZqjs07bMI34OBR1CfnEXw
         7cGGJiXAz5ckAGHqUxAa/f58Wo3qYmJI7vEcUpJJlgw3WwnAuhsQW5wkOgP0sSwa/wIk
         0ffu5WCx7qF5k4gRYlzFl2vTo/ruvr3GgD27DTr8hGwx8WWzBdiTRNuXh2hu3J9uZ+KV
         RRN+fJwUl+ZUPv3+WChevfQ/Z13fZSdgcHTIpkNhdIi+/DcNvweXwVL7py6L3AuwS8Mz
         wwGQ==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I'm not sure how to respond to my post from earlier today, so I'm just
creating a new one.

I do not need help figuring out how to use the nft command line tool.
I need to figure out how to use the libnftnl C library to create a map
of the following type and insert elements into it:

type ipv4_addr . inet_service : ipv4_addr

I see an example for creating a set in nft-set-test.c, but I'm not
sure how to translate this into creating a map and adding elements to
it. Is there documentation somewhere? Could you write an example for
this use case?

Thanks,
Kiernan George
