From: LakshmiPathi Raju Poranki <raju.poranki@gmail.com>
Subject: Poll on netfilter_queue filedescriptor doesn't work.
Date: Thu, 13 Jun 2013 22:24:34 +0530
Message-ID: <CAD5ayN3cE0Wj08hP2J_LTRHH-ATs5L1WTq26Yu1ojpp-hh1HjA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=Dx6k/xadty1kY20gKtofC/Lqsj0nb/S9RZzrFJch9P4=;
        b=DhBynzMYTQMUWp1GRVxN3HBXqRGr+Gz/Z1WYy4AnQbDAuCFNZYYf7V6Cct+LAHRh6R
         6oq20voxJg74RBTnB/c8JE4/qt/YfGIlC7uw9oEgq9+ctAL92Hfp2n4egVyQLYHWQI3U
         +1Jor9M76Ankhh2+e0EHKRuPrBcs3BHC2zKmUj2BEB51R4lZfuqVK0BAe/vpZETUzSBC
         ItJlnIQnmCT7lGSbIftPZb88bv+qf+c+uWuipQsDU0nbLoNeLAuyctHD6VBvkFV8umQ2
         BaxKs9feKgoW6fc0GE+JqbbIwj/MiYrlDVpHhMdo20jca39n4iKDIQdvbnB9PFxC0hLV
         xbrg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

Poll on the file descriptor returned by nfq_fd() doesn't work. I am
polling for the following events
POLLIN | POLLPRI | POLLERR | POLLHUP.

But none of these events are set when there is a packet on the netfilter_queue.

Can someone please let me know the best way to poll or missing things
on the nfq file descriptor

--
Thanks,
Raju.
