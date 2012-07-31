From: Peter LaDow <petela@gocougs.wsu.edu>
Subject: Re: Process Hang
Date: Tue, 31 Jul 2012 07:54:15 -0700
Message-ID: <CAN8Q1EcU=06-51PqSQ69DevQSZrG0Y986u35_DEnDFAftgJ-Pw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:date:x-google-sender-auth:message-id:subject
         :from:to:content-type;
        bh=KgpbFRmMYagqNiWN0hiqyAl/SYqzRV0LEkn2Uhq0LiU=;
        b=FwRjpG+lgz0FYoeOJlAhKSP96cuauqKx0OPn5ZxUPf4EaYMCzQGvFlAlKdBqkD45jO
         /wdl3jwvwtTROkDOrAkGXnlRmcEeyHXpTSvuw4GbQ5GsIVpqq4RZz6zUQknrI+2z3kII
         nSCUn7zucxPun9cdLUii8Svi/zwVT+IlCS/lV1UdS6CBqnmcfrKavrT+TJ3dmJxzwUCl
         M3XmC/i07ftRGWfEK60jEK6FHXxejf4OPAlzCqBe1SG9E3wVYNdxuktMa+Z7AYaXM0J2
         kildtynIhdsDIyBw+dt1TegnxTfOd5X4Z2vYWmrQIejm7hQsmT1rcBQI4Jp+gQmn1xWB
         E9bg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Well, I tried a couple of things over last night, and neither revealed
anything satisfying.

First, I compiled in all the debug code for netfilter into the kernel.
 Our test setup ran all night without a single hang in
iptables(-restore).  This is still with 3.0.36-rt58 and iptables
1.3.8.  This, to me, speaks of some sort of timing/race condition or
optimization problem.  Without the debugging information, I can't seem
to determine where things have gone wrong, and with debugging
information I can't get the lockup to happen.

Second, I compiled 1.4.14 (and libnfnetlink) and installed that.  This
is running with our "stock" (no debug) 3.0.36-rt57 build, and no
lockup occurred all night.

The only other issue I can think of is this.  Our standard build has a
linux-libc-dev in our webroot for 2.6.24.  We do not build
linux-libc-dev as part of our kernel build.  So iptables ends up being
compiled against 2.6.24, but run on 3.0.36-rt57.  Could this
potentially induce the type of failure we were seeing?  My compile of
1.4.14 is against the 3.0.36-rt57 linux-libc-dev headers, rather than
the 2.6.24.

Thanks,
Pete
