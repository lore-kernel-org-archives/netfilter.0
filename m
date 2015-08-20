From: Anand Raj Manickam <anandrm@gmail.com>
Subject: Fails to NAT and Route reply packets for Multiple Interfaces
Date: Thu, 20 Aug 2015 20:28:02 +0530
Message-ID: <CAEyr1FTKc3bbt4UNKooA2VW7=-gthE2C3_rP7-PxvF3LebW7Ew@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=QJOl7zXSIpzvT7NPrFL60NU/DjmmKxQ1xWbv+Xecxj8=;
        b=zVo5PkkB3Ut7wqXyM+6TDatyNBHZaqsX0PeBAfWPHNp/2HVjReRdHzdVz+eKcaCTLc
         fYhmrZZFEqpKC+OUK5l/M+fjEMduYpwS4IaOscbknnOEtUq0NWbvauvTbO6p+Xi38F4f
         6c3pL5LFBrJ4i9zkW2fgUkenLWP2Kr5JJSbBm84Ph0E04QYoXdGFpTXJylmzxWUHnY65
         2hI0S1gPE5K0T8tFLOqGWw2WdnHN27XlxxGTtcb8qWv5w7Lg3wD1AQ2NvDmgZl5+ftvR
         bLZ513HuaLDJfxBJkkQ+WvhJkGye8Q8hGPH7rwbA38d8O3+dgW3JtBkubXy2jHZhgf0i
         3UKw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>, Anand Raj Manickam <anandrm@gmail.com>

Hi ,
I have a multi nic router setup.

172.0.0.1/24  |---------(eth1)(Internet)
eth0(LAN)----|
                      |---------(eth2)(Internet)

When both the Links are up and connected , the NATTING / ROUTING fails
to route the packet back to the LAN on one of the Links in most cases
it eth1 .
Eg
172.1.1.1->100.1.1.1  routed to eth1 , which(i m MASQURADING) SNAT's
to x.x.x.x ->100.1.1.1
there is reply from 100.1.1.1->x.x.x.x. I see the packet in the
PREROUTING Mangle table and also in TCPDUMP . But after that the
packet is lost.
I did try to log the packet in FORWARD , mangle table , it did not reach here .

Conntrack -E , also show the SYN_RECV state for the packet.

But when only one link is in connected state , it works fine. Also
,when both the links are up it routes fine on eth2. The connectivity
of the links are fine as i m using this in a private setup.

I m using fwmark ip route table to route the packets on the particular
interface .
I m using Linux Kernel version 3.12.14 .

Can someone shed some light this ?

Thanks,
Anand
