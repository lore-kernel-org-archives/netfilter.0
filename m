From: vivek rajagopalan <vivvek.r@gmail.com>
Subject: Extracting info from frag packet in pre route hook
Date: Wed, 4 Jan 2012 21:31:58 -0800
Message-ID: <CAKbcA9KrD4eR0tcHG4_g7JvfOZv0MH+UinESt+GNRJb4YiquRQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=tX1q1nSLVey1qwQQwXPJDmUniKc/rj4rh+CXlOASOdA=;
        b=YFaCA9oGGpPrYX6JSkeNP+5u4Dz2BYX7KuAcozycU+Dog+f1QZzQY3PoGJgmwrypHm
         1YX7I/PkCgN8aLu6YRVBtKWJUZaorLMEUK6iPeDUdsa5LF52rZ5vYpeU/deX9hj0yYq/
         gLoTGLllhBYfEU5ds35W9DqEl4LbPMQChLk7k=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I wrote an LKM and I am trying to get UDP port information from the
first fragmented packet received in PRE_ROUTING hook as follows

struct iphdr *iph = (struct iphdr*) skb_network_header(skb);
struct udphdr *udph = (struct udphdr *)(iph + (iph->ihl)*4); //or
(struct udphdr *)(skb->data + (iph->ihl)*4) and other such methods

However ntohs(udph->source) is always returning 0. This method works
for a non-fragmented packet. I am wondering if PRE_ROUTING is a good
place to do this at all or LOCAL_IN is the correct place. Or is it
that i am trying to fetch the payload from the wrong data pointers?

I am using 2.6.35 kernel

Thanks
Vivek
