From: Ninad Adi <adi.ninad@gmail.com>
Subject: QUES : connection tracking
Date: Mon, 21 Jun 2010 13:13:38 +0530
Message-ID: <AANLkTinyiIqkyccSaDciSCbrbOYNPbS8sqA4Mj_VsTHq@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=Pnb2x60/X7bqXFUzyYYD+GNRKHwRTi+SBIH9/kYnuio=;
        b=BVzA0J8cDT3HdwIAsYzCY3CqbSSu6pjHBKRsB3FKdhxpI1BAHrvBzLNTrqdQExPhJg
         Rpu6nix8NBLQDLeINtSrp34Q43S5HY3GJ4sHxejPmwPc82xkgeBH4ecEz1BRcPpZ9RgY
         5L926M0IHbBpO+jG6u+/FTZl/kR8iWOSjjkg0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

QUES:  What code is present architecturally in net/ipv4/netfilter
            directory and what code is present architecturally in net/netfilter
            directory ?

QUES: Why do we use terms layer 5 connection trackers and layer 3
           connection trackers whereas connection is maintained only
at layer 4 ?



Ninad.
