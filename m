From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Q: remapping IP addresses for inbound and outbound traffic
Date: Tue, 29 Aug 2006 10:07:48 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0608291001030.5247@yvahk01.tjqt.qr>
References: <LKML-nat-0.qq@inCTV.ru>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751191AbWH2IJQ@vger.kernel.org>
In-Reply-To: <LKML-nat-0.qq@inCTV.ru>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Innocenti Maresin <qq@inCTV.ru>
Cc: LKML <linux-kernel@vger.kernel.org>, netfilter@netfilter.org

Hi,

>The software of this box needs to connect all hosts in both networks, and
>also to receive inbound TCP connections.  The evident way is to "remap"
>overlapping IPv4 area of one network to some "place" not used neither in it
>nor in other.  This means that, when we receive a packet from remapped area,
>the kernel should replace the source IP to an "internal representaion". 
>Versa, sending something to "internally represented" IP the kernel should
>replace such IP by its external value.  I clarify these terms so carefully
>because in news:comp.os.linux.networking some people state that I "use terms
>in strange ways" :)
>
>The question is: how to do it? Please, don't say quicky "iproute2" and
>"RTFM".  Iproute2 can do such things when *forwarding* packets.  I need no
>forwarding at all, no *connection* between 2 networks.  I need only to
>*serve* both networks, such that some "external" IPs need to be replaced by
>internally used IP and versa.  All this at one Linux box. No forwarding
>traffic. Only inbound and outbound.

I am working on a small module doing something like that, changing IP 
addresses before the NAT code sees them, in mangle.

  http://jengelh.hopto.org/f/xt_MAP-v0.tar.bz2

I still cannot get outgoing mangled packets (see command below) to reach 
their destination:

  iptables -t mangle -A POSTROUTING -d 134.76.13.21 -j MAP \
    --map-dest 134.76.13.28

ping and TCP packets seem to leave the box (tcpdump), but there are no 
responses (neither negative responses). The destination box's tcpdump also 
shows nothing.
netfilter list, am I missing something like recalculating IP checksums?



Jan Engelhardt
-- 
