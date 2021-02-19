From: Psyspy 22 <psyspy2020@gmail.com>
Subject: libnetfilter_queue example
Date: Thu, 18 Feb 2021 17:57:35 -0700
Message-ID: <CAFqmWq_i8Qrc8pKeS_fEM5QeEYOwps5YFfGkFcOY9QJ8NJTtpQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=ahU50AiOr/ZM2bRI96G1IsN2Zyl/d5rcZmTVKl8yGFc=;
        b=dF0HgxrjigkqGEIz0LUkgTGqPSCnUBKlilTkKGNAMOpKoEI4qB8cleKpeLQWF/zaId
         yi/W7adAz9jMi0S4YNFD9/Ppa9fs0a+enkiPQX1fnyy8xQ5CRPRACxdBe/IBdGtlun3w
         nybOWHn4sNC+WlX3i8QlwpA6+bgSGxjOHQFohX7LKAQeq/Cmm4Nf9JbsaapNP+2NWXkb
         1+d/NqfNrY9ePj9df2ci/rDThetnHQDIsyMlhix/rDmqR+g56rWvEp4wc9WdEQZVFRBb
         6imeR+uKdTDPk6z7r7hEsNd0y00OWt4qSCAeOj4MGomCTMdzWzkeeXKmQTCHRbtv7h1p
         k+/g==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I am trying to write a simple application using netfilter_queue. There
is this example in the git repo:
https://git.netfilter.org/libnetfilter_queue/tree/examples/nf-queue.c
I also found this example:
https://www.apriorit.com/dev-blog/598-linux-mitm-nfqueue

The former is more verbose and seems to use libmnl calls while the
latter seems to use libnetfilter_queue calls. Which one should I use?

Thanks,
psyspy
