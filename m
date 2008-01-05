From: Jorch <news-groups@jorch.net>
Subject: libnetfilter_queue and IMQ
Date: Sat, 05 Jan 2008 18:38:20 +0200
Message-ID: <477FB27C.2050905@jorch.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Is there any way to use libnetfilter_queue based userspace queue program and
IMQ based shaping in same system?

I have tested combination for two days now and noticed that every time
traffic goes to IMQ target the queue program will die and throws seg.fault 
immediately.

Any ideas??

Regs.
-jori luoto
