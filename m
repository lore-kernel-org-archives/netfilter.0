From: Wenfay <Wenfay@protonmail.com>
Subject: How to use connection tracking with Docker?
Date: Wed, 19 Apr 2023 18:32:21 +0000
Message-ID: <M5YS8Rk8viSk2HTgndeuzRIkRoUCS3QdmBY1ipVmKC8G39wmeXcvDvkspWenagjm5tb1OwjmhJ0KX2uR33CGl51_N_f3GUYK2e3RaBwfBes=@protonmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1681929150; x=1682188350;
        bh=KefQ0DBQ5zC1ftgfVvEa3rxI4DDGBgZ+jqWSP2SORjA=;
        h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
         Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
        b=gInaBOlsRRoZr+HGYjiiycGa3HnTwyw51a0FkoDsBmll6w+izspm97OOgf0r9vnCV
         Zz3Ln8lEczZxObS0miWSwKOGInf6lPKcgA91fYejx+KP/aY4JalvFvgw7XeZNqVbdj
         W2najaUv/K5FBxJx3cjUzKeoa/w21i1kjCr+rrlft+BrDOgwcpVfZhJsyL7mm4lzcr
         MhM8JBXIzO6pzQbBzfALwimQPZ8vq1lmaqBho1TdyHHAvGEekcfDzAiAtblqqCNlhs
         2QdVMH47F+CPssi3U2BILiUirCYjMmrgIEvX5sujqdQgdfG/JIoQxG8UOce+7N43zk
         DWUlCQ/RRFBoQ==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi. First, I want to apologize for writing here, but I really need help and=
 I don't know where I can ask this.

I set up my firewall but I have one problem - connection tracking isn't wor=
king with connections from the docker container.

Minimal, Reproducible Example:
nft add table inet PREROUTING
nft 'add chain inet PREROUTING lower_filter { type filter hook prerouting p=
riority -130; policy drop; }'
nft add rule inet PREROUTING lower_filter ct state established,related coun=
ter accept
nft add rule inet PREROUTING lower_filter ct state invalid counter drop
nft add rule inet PREROUTING lower_filter counter

Works fine in a local machine, but not in the container:
docker run -it debian:stable /bin/bash

Internet not works:
root@7c791721f0c5:/# apt update
0% [Connecting to deb.debian.org]

This rule doesn't work:
nft add rule inet PREROUTING lower_filter ct state established,related coun=
ter accept

It can be fixed, if add "new" state for ct. But this is equal that I disabl=
ed my firewall.

Also, I could add my firewall rules to "input" hook, but I want to keep rul=
es in one place and protect both docker and the local machine. So I use pre=
routing for input traffic and postrouting for output traffic.

Could you help me, please?

Addition info:
Kernel (uname -a): Linux Computer 5.10.0-21-amd64 #1 SMP Debian 5.10.162-1 =
(2023-01-21) x86_64 GNU/Linux
Nft version (nft -v): nftables v0.9.8 (E.D.S.)
Docker version (docker -v): Docker version 20.10.5+dfsg1, build 55c4c88
