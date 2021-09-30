From: Cristian Constantin <const.crist@googlemail.com>
Subject: nft set load metrics
Date: Thu, 30 Sep 2021 13:21:26 +0200
Message-ID: <CANCV4NMrw5m_-DCwnFGahygVnMGuVnU-RouBCqOsg6QX7z4AKQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=gXrlX9DLy4rF2F3BbCZht3qKhiZyJhLuA7KUt6TuHqM=;
        b=JLmTLI1jTrCcQUrxnPrD+IHpW5O3nWqmgbpRbt9erk8euAKDNHbkAiB9Cw16CClW0r
         AOVQnwcesGxu6ZY23X6vSual8TkNwBt0+l9U3DBdEo4MXUORzJF77Fs6t7NhsWnJz6bj
         bZZqM+tlO66UFXM5gf8h9Q0y3CRVYsB8gbeQUBX/l9Dig3qCVEtxD82hrZQfN+LBd4l/
         y7KCOr+kTpNFFGINPG5T7BxTBRkz4C6GJJYT0u+DWAtFrJ7tbJ9l3BDzgfwCLphICC6y
         jtppM41opU2wyOoAPSl05skBPhhnHNITiTNAI7iGY61vOd5La58quOex7tK78NJsAfpV
         VyUg==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

hi!

is there a way to get from the kernel just some metrics about nft
sets, without getting
all (possibly lots of) elements of the set?

e.g.:

- number of full ip addresses (i.e. /32 prefix for ipv4);
- number of "prefix" elements;
- number of intervals;

thanks,
cristian
