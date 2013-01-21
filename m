From: Prashant Batra <prashant0100@gmail.com>
Subject: netlink queue to implement ipsec
Date: Mon, 21 Jan 2013 17:29:40 +0530
Message-ID: <CAG+XuE4sKZp8TwT4f_eXmEV0efGFWgKOFPB4ShvNOfZsOh9+Xw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=g+XrTsV/HDo60niXfXpVRmyIf9eCkaAWn49/Pis/Gx4=;
        b=lOYxATmGAAq0/EBaHpVaCvFXysVieYZg0LV9pW5LYjuOqtkZ9lO7dg7qQCdB7jAgvU
         i7ZV+MvdZ9jk3A9QiU/7FJ1zWKPZVRqtSYi8lCWET+eybBZTY/DUcs0W2aKKD1Y0IGNX
         /DVs2MJvPtZz9t/c7G6GSbAiF/gmLXjmiP/KKkdr+W1PX80or46F+bVvDdbceTTSHE1A
         l0cas+Ft/nNnLXU+IQP4kIUavXnmQCnUHale3+c3rvUyUmneh3VOhB5mqCuUu4+h42cU
         +NrzgahoVDyxNXZjuohw1r6Tp85EZiptq8C2NkbslWFi6AI73qvKzuZukxSQrVphgoak
         LT1A==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi Guys,

Guidance is needed to verify small user space ipsec application design
using netlink socket.

The architecture looks something like this-
- Install iptable rules (to match certain ipsec policies) and get the
packet in user-space using nf_queue target.
- Do the IPSec part and send the processed packet out.
- To optimize use memory mapped IO as in https://lwn.net/Articles/512442/
- An important point here is - Kernel transport and IP stack will be
building the complete IP packet, data of which comes from some user
space process like (ssh), so the iptable rule has to be applied after
IP layer, maybe post routing.

Is it a feasible thing?

Please provide your comments.

Thanks,
Prashant
