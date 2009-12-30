From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Why "No buffer space available"?
Date: Wed, 30 Dec 2009 13:10:24 +0100
Message-ID: <4B3B4330.4050304@netfilter.org>
References: <cc73a9220912281846h6a337b76ud7d9d1f61371f21e@mail.gmail.com> <cc73a9220912281849qf25a81evdb6082197d037917@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cc73a9220912281849qf25a81evdb6082197d037917@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Medialy <medialy@gmail.com>
Cc: netfilter@vger.kernel.org

Medialy wrote:
> Hi,
> I have written a program to log the nat behavior. the program works
> well when traffic is low. But when the traffic reaches 1Gb, program
> always error.
> According to the previous discussions about this problem, I even set
> the recv buffer size to 50MB and the error still exists.

Increasing the buffer size would not solve the problem, that will only 
delay the ENOBUFS error. There are several reasons why you may hit ENOBUFS:

a) your program is too slow to handle the Netlink messages that you 
receive from the kernel at a given rate. This is easier to trigger if 
the handling that you perform on every message takes too long.
b) the queue size is too small, but this does not seem to be your case.

ENOBUFS basically means that the kernel has to drop Netlink messages 
because your user-space program cannot back-off.

> For every callback, format the data and then put it into the queue
> directly.  The formating of data causes less then 1 second for 0.65
> million records.
> Errors always occurs  when there are less than 10 log records.

I don't understand what you mean here above.

BTW, if you use a recent Linux kernel (>=2.6.30) you can set these two 
socket options not to get ENOBUFS error and to try to improve ctnetlink 
reliability.

int on = 1;

setsockopt(nfct_fd(h), SOL_NETLINK,
            NETLINK_BROADCAST_SEND_ERROR, &on, sizeof(int));

setsockopt(nfct_fd(h), SOL_NETLINK,
            NETLINK_NO_ENOBUFS, &on, sizeof(int));
