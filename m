From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Extracting info from frag packet in pre route hook
Date: Thu, 5 Jan 2012 22:21:22 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1201052218330.26877@frira.zrqbmnf.qr>
References: <CAKbcA9KrD4eR0tcHG4_g7JvfOZv0MH+UinESt+GNRJb4YiquRQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAKbcA9KrD4eR0tcHG4_g7JvfOZv0MH+UinESt+GNRJb4YiquRQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vivek rajagopalan <vivvek.r@gmail.com>
Cc: netfilter@vger.kernel.org

On Thursday 2012-01-05 06:31, vivek rajagopalan wrote:

>Hi,
>
>I wrote an LKM and I am trying to get UDP port information from the
>first fragmented packet received in PRE_ROUTING hook as follows
>
>struct iphdr *iph = (struct iphdr*) skb_network_header(skb);

You want: struct iphdr *iph = ip_hdr(skb);

>struct udphdr *udph = (struct udphdr *)(iph + (iph->ihl)*4); //or
>(struct udphdr *)(skb->data + (iph->ihl)*4) and other such methods

You need

  struct udphdr *udph = skb_header_pointer(...)

