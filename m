From: Michael Fomichev <fomichev.michael@gmail.com>
Subject: Is it possible to access ip fragments with libnetfilter_queue?
Date: Tue, 28 Apr 2015 09:39:37 +0200
Message-ID: <CAEVBFLi1CZaKyXNMROtmyYScNOo9wYnQOCQrBbDqsxieAGce9g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=6E8t+H+SfycCudruxD7ZWPfuDkZdO2cSi+DmucBH0gU=;
        b=0xWWtND3MTUeXoH1icoqv+2Y6k27fNQaBkNVPZBiMy7Eg8XigySQisonPCjJFAVvly
         fOBfilx6ohKtIRfMQ7sFkgSrob6Eu3X+zEOKJIu8HfRfeOTJmFvBm2aLfyvqPe/ucpSP
         DajFhN1bk4/obPLX91Rt0+OltFeF/Q+e9sI9y2X1Z4ddnNDsZGZCzkFlpyJilkA9ZG6M
         oxu3feLBpqCh3Rx2XXSg9SLn4ekx/gavpvf0yyyo8bWbNYRis0E1RwYt9UywFhtk8LZk
         hovw3ZV8ic6BDGoy8JR1mZoTkZL8mi6ediXEvhXVOzg9Gv+Y9Tut6s39JDgonht5XKVa
         420A==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I am using libnetfilter_queue in C to capture packets. I am setting an
iptable rule to queue the incoming packets that would later be
processed by the userspace implementation like this: iptables -A INPUT
-j NFQUEUE --queue-num 0. I used nfqnl_test.c example as a framework
to implement the capture. Everything works as expected. However, I
noticed that it is impossible to inspect the queue on the level of ip
fragments. That is, if a packet is coming in fragments it is first
reassembled before being put into the queue. But I would like to work
with fragments. So is there a way to enforce that kind of behavior?
What I want to have is a queue where I could observe raw incoming
packets (both fragmented and unfragmented) so I would be able to act
on them accordingly.

I read that the reassembly indeed happens before. On the other hand,
with iptables there is -f flag available so there should be a
"fragmentation granularity" which I am looking for. I also tried
adjusting iptable rules (e.g. iptables -t raw -D PREROUTING -i eth0 -j
NFQUEUE --queue-num 0), but the result is still the same. I can only
observe already reassembled packet which I definitely know that
arrives in fragments.

Any help is really appreciated

Best regards,

Michael
