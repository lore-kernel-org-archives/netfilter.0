From: =?iso-8859-1?Q?Andreas_Birkj=E6r_=28ABI=29?= <abi@thrane.com>
Subject: NFQNL_COPY_META not working?
Date: Wed, 26 Oct 2011 11:24:28 +0000
Message-ID: <76B3922156AB24469E781F6224C2239F0151D1@ly-ex-02.thrane.tt.ad>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: da-DK
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hello.

I have been trying to get the the netfilter queue working, everything is seemingly allright as long as I pass the entire packet to userspace. (nfq_set_mode(qh, NFQNL_COPY_PACKET, 0xfffff)).
It should be noted that I am testing this on the nfqnl_test.c which is found here: http://svn.netfilter.org/netfilter/trunk/libnetfilter_queue/utils/nfqnl_test.c

As long as I copy the entire packet to userspace, everything seems to be running smoothly, I can retrieve whatever I want from the packet.

However, I do not want to pass the entire packet to userspace - I just need to check/modify the IP and/or TCP header and then pass the packet along. When I try to use the NFQNL_COPY_META mode, then the program fails. (I am testing this on the beforementioned nfqnl_test.c file with no modifications beside the META mode.

Apparently the nfq_get_payload() function always returns -1.

I have tried searching for an answer, but almost everywhere I look, people are happy passing the entire packet, does the nfqnl_test.c need additional modifications in order to run in NFQNL_COPY_META mode or what?
When using NFQNL_COPY_META mode, I still get some output from the queue (hw_protocol, hook, packet id etc) but as stated, the nfq_get_payload returns -1.

I have not found anything on the official site stating that additional modifications are needed when running in META mode, but I might be overlooking something?

Another small question, I am a little unclear as to exactly what information is passed in META mode. As far as I can understand, the content of the headers are passed to userspace right? Meaning IP/TCP/HTTP... headers are passed but payload is not?

I hope someone is able to help me get to the bottom of this.

Kind regards
Andreas


