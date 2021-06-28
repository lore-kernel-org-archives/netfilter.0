From: Psyspy 22 <psyspy2020@gmail.com>
Subject: libnetfilter_queue: Access conntrack info
Date: Sun, 27 Jun 2021 22:07:18 -0600
Message-ID: <CAFqmWq_4_8ubgpfdEfhhQ=+7YbKCrPp=aTXsixAeYrK5VA+B2w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=ONeomOns0iFcEhjDVpaYAneENoIUv67H1dqluGQDSZE=;
        b=LWXNoGgCgatCBNV4zG+ZL+3CgMkWKK7NUM4/2cweAnwbS719rboz/YbtIKSNDdIits
         Zm8ufPiuJB/r6qJVfkBQJUaGMO0GzVyHTv4MTpLjiWbU3iIacFTosCYmwLTnv3M9HYTM
         3r4z0sWTiKK2eQUhpezreJUmnlMNKxNCJQ5PFojO0RQS2x9RyClaa8m2ZvbPp8CjUi3Z
         jQwE9Es3uAFxUuApXPzVOgR86PMcTilHIooOKdpRAxmJ6tiFdW9aI+nw5OacLauu2Oq1
         aRYEPFUz8E97d3YUjiOHHR587lxXYazSxkuyHuWBkE5l7i5Q3Z3tJtLWqpk9468CYZNy
         HwAw==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

Good morning! I am using the nf-queue.c example from
libnetfilter_queue repo. In the queue_cb() function, I am trying to
get the conntrack info but this condition is always false.

if(attr[NFQA_CT])

I can see the flow in conntrack -L output. Anyone know what I am
missing? Appreciate your help!

Kind regards.
