From: Lorraine Hall <lorraineehall@gmail.com>
Subject: OUTPUT NFQUEUE UDP destination port is 0
Date: Wed, 14 Sep 2011 22:27:08 -0700
Message-ID: <CALSwv_+xGoQN6b6HjHAYLR70ihXEYTHT-VarkUbt8cvHFsR3mg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=M1gMAfZw1cvAkYleuePc7RrwJZFV/ygIYeo6Avf7gO4=;
        b=Iap3c2i4rlJzumNrYFDRA14Lbk3GUPF0s/sS8sV3zrA4GS9oWtFH+XuT5TUTH9/oks
         hoK9uWRel/bKGQvNqNQiwsFmL0+2QbiNgcCgiv1ReYPrZbov2U7T9H3ekZ+95UdIVkI6
         3KUWPEBjQG/c5AKQ/Dn6RDyeEWA9lCHYEo4uE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I am trying to write a program, using C, that binds to an OUTPUT
NFQUEUE and makes some changes to certain UDP packets.

I'm running into an issue, however, with getting the destination port.
For some reason, no matter what I try, the destination port in the
udphdr struct is 0. The source port is fine, and the packet is
received properly on the other end with the destination port set (I
checked this with wireshark on my own computer). Everything else seems
fine - IP header has the proper info.. it's just the UDP header that
seems messed up.

The basic code I'm using:

struct udphdr *udp=(struct udphdr *)(pkt_data+21);

printf("Source port: %u\nDest port: %u\n", udp->source, udp->dest);

Thank you,

L
