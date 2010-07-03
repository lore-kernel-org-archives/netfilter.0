From: Paul Jack <aunty@edenrdfarm.com>
Subject: is tbf really classless ?
Date: Sat, 03 Jul 2010 17:17:54 +0800
Message-ID: <4C2F0042.2020209@edenrdfarm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

hi all

i am completely new to this so am probably missing something terribly 
obvious. I have found in "A Practical Guide to Linux Traffic Control" by 
Jason Boxman . .

"As of Linux 2.6.1, tbf is now a classful qdisc. By default it will 
behave as it did in prior versions of Linux. The classful variant 
automatically creates a class with a minor node of 1. The major node 
number will be what you assigned to the tbf qdisc. You can attach both 
classless and classful qdiscs to the new tbf in 2.6.1 and later."

and also in the comments within net/sched/sch_tbf.c . .

 * Authors:    Alexey Kuznetsov, <kuznet@ms2.inr.ac.ru>
 *        Dmitry Torokhov <dtor@mail.ru> - allow attaching inner qdiscs -
 *                         original idea by Martin Devera

and . .

    With classful TBF, limit is just kept for backwards compatibility.
    It is passed to the default bfifo qdisc - if the inner qdisc is
    changed the limit is not effective anymore.

everywhere else i have looked only talks of tbf as a classless qdisc - 
even the man page.

I have run:

root@vanessa:~# tc qdisc add dev wlan0 root handle 1:0 tbf rate 100mbit 
burst 10kb limit 1kb

and when i try to add a class to this root qdisc i get:

root@vanessa:~# tc class add dev wlan0 parent 1:0 classid 1:1 tbf rate 
24kbit burst 1kbit limit 1
Error: Qdisc "tbf" is classless.

was tbf's classfullnes only temporary ? is there something wrong with my 
kernel ?
i am running kernel 2.6.29.6-smp on slackware 13.0

all help greatly appreciated,
aunty


