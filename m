From: Igor de Paula <igordptx@gmail.com>
Subject: Help use parsing to get a promiscuous level
Date: Thu, 25 May 2023 15:12:02 +0100
Message-ID: <CALDr01RD6Sxgc972JOjAufWP-4akGSHzbA93PaWOPo7uughMGw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685023933; x=1687615933;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/iYOpo8t0Kqe02ZSAZBBgTlQZo/FoPoZZi2ilLyuGBU=;
        b=ATCqMEWjEpurznINcffX/gzVMS/PGpL8NMQ4NB5Obn14OAaHN+x1Rzx5K/JkyNPXcE
         HiMfpc3de8Rl4/4gPJpFqZ4q7hkRjBTz/mdD+aASfNZJFN8ebVyxrf1GhKCoG8R7oYrd
         cuu1p96AKzk8kJaQC+u/iT2amdcpjcE+YsDHuHCsqaVbZsVVSWou4p7RGHnbFoLq2Ycd
         m0CdtZPKpSJHDBxoBwHc9LbrrW/yf6URDVgWqBt4KPTEF8a+qOsfohgb0/m0pfc7fj4q
         MKBP+q6DT12l0wFdBAx2BnrRvQekcLGR84iTyC+fbKUK+735T551IDc4Lxn+Ye7hJ4YP
         vCww==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,
I have a DPDK application holding some ports, and I want to have a
virtio_user port to interface with the kernel stack, For example, I
want to use tcpdump on a virtual interface. So I understand I need to
create a netlink listener which I did. And using some print statements
I am getting a packet on the netlink port when I try to use tcpdump on
the virtual interface.
My problem is that I can't figure out how to parse the packet. For
example I expect that calling TCP dump should trigger a packet to set
a promiscuous flag, and stopping tcpdump should trigger a packet to
disable promiscuous mode.

Currently from the example here:
git.netfilter.org/libmnl/tree/examples/rtnl/rtnl-link-event.c
I have a parser.
But this doesn't give any information. Any help on how to understand
this packet would be appreciated. I thought as there is a next
attribute and maybe nested attributes if I kept getting the next
attribute I might get to the promiscuous flag (30), but I am printing
like 100 of those per packet. And from what I read the payload also
has attributes. This might be a stupid question but any help on
understanding this would be appreciated.

I tried to attach snippets of code but the mail system seems to have blocked it.
