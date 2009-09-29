From: Steve Fink <sphink@gmail.com>
Subject: CPU usage of simple DROP rule
Date: Tue, 29 Sep 2009 11:31:22 -0700
Message-ID: <7d7f2e8c0909291131m5cd58372ta5907f1612d8fa05@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=mouwrWvbDriDleBfPmNSr7MQpiTxFOvUas2+EvcbdBQ=;
        b=f4w4SIOFOIBsRbk2hv2i9CJP1o7t+hscW+Qly5GsU3e0QHtfUZZV7e40UZek6YJ8+L
         CC3HXlKNavw3yVnXF5rqk3SQOyFB5HP+YsTUC4Sj4lNX49/skxGryOHvanZ6AH2n87po
         pZoZ9FyfZwu4szrlUWjgKEeZoFtmfxYUfGEts=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

(Oops; originally posted onto wrong list.)

I have a single OUTPUT rule (drop a particular UDP host:port) that
eats up a whole CPU core and a half (I have 8 cores total). It is the
only rule I have. It doesn't matter whether I do it in the raw table
or the filter table. This is when I'm just about maxing out 5 gigabit
NICs (outgoing traffic only). The rule matches nearly all of the
packets.

Is there any way to reduce the load, or at least spread it out over all CPUs?

My 8 cores are all at about 30% usage when I have no rules defined
(and the packets are going out to the switch). When I add that rule,
one of the cores shoots to 100%, another to 70% or so. The rest don't
really change.

I'm trying to figure out how to accomplish the same thing with a
blackhole route for comparison's sake, but I can't get it to work --
the packets are still going out.
