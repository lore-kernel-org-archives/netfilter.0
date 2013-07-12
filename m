From: Michael Kilian <michael.kilian@gmail.com>
Subject: Using netfilter in a multi-threaded program
Date: Fri, 12 Jul 2013 09:23:40 -0400
Message-ID: <CAHh8oT7QQKpKoa_2TU8W=-UaGqsY0s=vGEL2DL-+70xhLGJr5Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=XRbPFj6jkBvzledlhYiZFRhEZpVtv6LGx1oNQ+pOK7w=;
        b=QBEfSgvcvS50ivFy+KxbrNafw9bwV+tH+G60Y3gawQbuNusgx1LIdWbGQQ0Nc/yMc/
         b9A64T+3vIT9VTzYgv+AgtK4gcXLdEiZSLzsX1TEE72DIRDadbRHg0ZxH3To6JjbXIlN
         1MVrL9J7lqxkCghJlKPiBh+G/pSSzWMwpaz1+RRcynaIIUzWWQcgEYqurQpWmKI3e1sP
         652G/5qiD1pwP/aREROk/lCcSirA42+CrjObnnGTfUDkrtXqcr0c1jxYUCTo/L4IcVE1
         l0Xwy3IEcuwkCKYa6W6uvb/ZW0Gu8wBgzC40jkSt29SozMPutGAa5FIuLh64OwEqbvyf
         Jskw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I am a little confused with using netfilter API's using multiple
threads to access multiple queues presumably to get better
performance.

Is there documentation on what is thread-safe?  How about what can be
run in parallel?

From what I can discern from the API structure you have a single fd to
the NFQUEUE infrastructure (from nfq_open).  All packets flow over
that.

Question #1:  If I have n threads performing recv's on this fd, am I
going to get complete packets atomically?  Are multiple simultaneous
recv's allowed? Or must this be handled with a single thread (and
doesn't this inherently limit the scalability of this)?

Question #2:  If I have multiple queues (for example, using
--queue_balance 0:3), it appears that we only see the multiple queues
in the call back (which I get to by registering the queue number and
the callback to the single nfqHandle using nfq_create_queue).  So is
the flow:  single threaded access to the nfqHandle, but once I get to
the callback I can handle different nfq_q_handles in different
threads?  This seems to only allow packet processing, verdict
rendering etc. to be multi-threaded, but not the initial packet read.
Is this correct?

Question #3:  It appears that --queue_balance 0:3 must relate to the
nfq_q_handles, not the nfq_handle.  Is this right?

Ultimately I worry about how to get 10-20 Gbps through this interface
if I end up single-threaded on the initial receive (see Question #1).
Is there a programming paradigm that allows the recv's to be handled
in multiple threads, across multiple CPUs?  For example, in "normal"
socket programming, content is distributed across the CPUs,
connections can be accepted in parallel, etc.  It would seem to me to
be logical to allow the multiple queues specified with the
--queue_balance to be treated completely independently in the threads.
 And while I am no kernel expert, don't most NICs now deliver the
packets across cores today (they certainly can distribute the
interrupts across cores).

-- Mike Kilian
