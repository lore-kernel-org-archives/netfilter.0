From: tom <tom@t0mb.net>
Subject: nfq_unbind_pf and nfq_bind_pf return values different in 2.6.23
Date: Thu, 14 Feb 2008 01:46:03 +0000
Message-ID: <47B39D5B.9080804@t0mb.net>
Reply-To: tom@t0mb.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I haven't touched C for a while now, and have been using python.  I used
to rely on python ipqueue, which uses ipq, but it has problems in 64bit,
and rather than fix it myself, I decided to try the netfilter queue, as
implemented in python nfqueue, given that the netfilter queue is
supposed to make ipq obsolete anyhow, and the author of python ipqueue
now recommends nfqueue.  Unfortunately, it seems that nfqueue has been
broken as of kernel 2.6.23 due to changes in the return values of
nfq_bind_pf and the unbind equivalent.  The code expects 0 to be
returned, and complains of failure otherwise.  I was just wondering if
someone could tell me how to interpret the return values and then I can
fix nfqueue. 

At the moment, this is the problem unless I just fudge it so it doesn't
bail out at this point:

localhost Wall # python testq.py
NFNETLINK answers: Invalid argument
Traceback (most recent call last):
  File "testq.py", line 53, in ?
    Queue = NetfilterQueue()
  File "testq.py", line 44, in __init__
    self.queue = nfqueue.Queue(False)
  File "nfqueue.pyx", line 226, in nfqueue.Queue.__new__
StandardError: nfq_unbind_pf failed

If I fudge it so as to just print out the return codes, I get this:

localhost Wall # python testq.py
NFNETLINK answers: Invalid argument
-22
NFNETLINK answers: Device or resource busy
-16


Any help much appreciated.  Thanks. Tom.

