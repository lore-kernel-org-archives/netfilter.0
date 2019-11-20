From: Elias Valea Peri <eliasvp@gmail.com>
Subject: Doubts about netfilter + nftables and module
Date: Wed, 20 Nov 2019 13:29:51 +0100
Message-ID: <CAPar=unRE+rOGVEnvJfvgLKAz3hBa+azm-gb6kPsP-kUz5MLOw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=382+KCntjYuqDinC+gJLHqMHUNKvNMg5eIT6B9SL1cE=;
        b=ac0uutaFQ7+zoN1jEgYb8nNqpKf17sEpBLRfhXdVQkAWIcB8jS/hfVbcvq222nMuXI
         KW1OBgIPgIZs4/fRI0cNcUqCp9uI6nOOk0UHEoe1qVKABXk32wUZgSqPhTVeXk8A2UBU
         UlR2E4lZAVdKhjAy8Fsb/1JiuBji6/wamyKMMWoVtPcTSjHUZ4iUNT56W11WFRQ3MbGF
         IuzLJSMyVUHFdFydx8FJk/DOW2MexEkoB2BghUyw7W3T6Zcip54C5xJNuDbvugJLWOxP
         3US3EPEt2nxq5BGjkOL+kV7+FuDcB4SkgXUinkEpRbpaRErIcT7jn/eOr4K/vtXQiMYC
         oPAg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hi to all, we=E2=80=99re migrating our systems from netfilter + iptables to
netfilter + nftables.
We=E2=80=99re looking for information about which modules we want/need to l=
oad
for our needs and extensions we want to use.
Looking for documentation about, we aren't capable to find a
description of what does each module. For some modules, we see easily,
just by its filename, what does but for others it isn't easy.
We've downloaded our kernel sources, look for doc at netfilter.org,
www.kernel.org/doc, etc... without success.
Does anybody knows where we can find for each nf_*.ko, nfnetlink_*.ko,
nft_*.ko ... file the functionality/extension that implements each one
????

Thanks a lot for your help

Elias
