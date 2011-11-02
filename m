From: Sergey Naumov <sknaumov@gmail.com>
Subject: NF_STOLEN and packets dropping
Date: Wed, 2 Nov 2011 16:18:20 +0300
Message-ID: <CAH3pVZNtYOUHCGzbxi1bO-rMiZRjHgY-N=PW-72mKSSoOzjBFA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=OXyVZMVYUCosZievGhERB+S1G4IojctE34SmkGqcjD8=;
        b=tQzzGwNKeDEKKWn5j14BUZ087ikqqg1+L9QEGnaFPLLoIDNy4tgncoc8PuGyxy7aDZ
         Rn1xD+RYveShbr/HdCa5MQE9dtzqqSL5uxvJ4P/KcopIZhe0c87mKJVFLEuljMrW0ex2
         6l3QcZqVsOnSmIcbg877SSGb5fvvsfJt39e9o=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello.

Is there is a place in linux kernel where I can determine whether
packet was dropped or not?
Looking at source code I can guess that if we got NF_DROP while
iterating through chains, we can determine that packet was droppped,
but what about NF_STOLEN? Can stolen packets be accepted? If yes then
is there a single place where I can "beep" on dropped packet, or I
have to examine each hook separately?

Thanks in advance,
Sergey Naumov.
