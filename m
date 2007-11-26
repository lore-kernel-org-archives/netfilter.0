From: "Ben Young" <innrevival@gmail.com>
Subject: conntrack-tools and kernel 2.6.22
Date: Mon, 26 Nov 2007 14:04:40 -0600
Message-ID: <34f8e8a30711261204ge069052rf956aef7184be64a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=sTB6IRAKfpyM1LDyZ53EnoTYdV2S2CDiYkYamwu+VyM=;
        b=JWrFMCfq7Y8XSgJP+s/I9UaK0EOiuk3VtvY/bxh3E5DTjJyl1JHPAkqdts1W5ruBVvXGLKTQlifllXyrbvjBKif9KxfLO1uUE16NmHMHzI/LVy9mit52RcZaWFpvtqUBNpje3nnjAhiW464UAVqKmwqQ9+WV+323tZ+UOqzWaZc=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I have been working on switching some systems over to kernel version
2.6.22.  In the transition, conntrack-tools has stopped working on
these systems.  Depending on which commands I issue to conntrack, I
get one of the two errors below, neither of which is particularly
helpful in diagnosing the problem.

Operation failed: Can't open handler
Operation failed: sorry, you must be root or get CAP_NET_ADMIN
capability to do this

Does anyone know why conntrack wouldn't work on kernel 2.6.22 when it
works just fine when I'm running 2.6.17 or 2.6.18?  Or have any
suggestions for how to go about determining the root cause of this
issue?

FYI, I am currently using these versions of the conntrack tools:

libnetfilter_conntrack: 0.0.81
libnfnetlink: 0.0.30
conntrack: 1.00beta2

Thanks,

Ben
