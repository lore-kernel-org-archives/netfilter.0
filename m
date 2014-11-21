From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: iptables logging using ulog : which can handle high traffic, writing
 in db or json or xml?
Date: Fri, 21 Nov 2014 18:06:22 +0530
Message-ID: <CAA5aLPimjDRd4X5uJYEtFp=j8miNBiy7r=HoqGwanNZQM2hFEA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=1K6nq1Oyon+lCipr9KiBBTPmJtJSpLQDf4jASZVeQd0=;
        b=Z9S7KPzVM9V5Xv0rsH9Bi4Q+erlM+ciH6J0FH+Ab8t1TpOr7wsx7tDmsEptyoLSQLM
         e6lQhGQanA3iBiSZ8aoi5vELq/ThsGhaGRre8ljuFY1O8gmFxDUIo47SR6sS/H1e6It+
         bw3B19/MD2O7oD1GezDJp8OzTB0WQ+In83sbMf2EdMIwc7XTX8TMUsE60ysAOjHjpdKo
         iypSfZu+xdbn9tiQCcY+5EII8yVyCoFNmw/qC6csUsD6iooAofPYxdb3K1HrD7skhtdz
         W+HUR0e9PSyrXXvUSxEAKJ8SrUTQfOS8BIaHUwbjW3rSFtXdjJCOTAvwtY4fFh9y86dl
         abeA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

i want to do logging of traffic iptables rules.
Traffic can go upto 10000pkts/sec.

While using ulog and writing in mysql db, I could not get good
results. Max around 300 pkts/sec were able to handle. Further traffic
was delayed in db.

Then I used json, it was able to handle around 1700 pkts/sec, beyond
that there is traffic loss in json file.

Is there any other mode which can be faster than json without losing
any traffic?
