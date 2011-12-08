From: msk@cloudmark.com
Subject: nfqueue vs. tproxy
Date: Wed, 7 Dec 2011 16:25:16 -0800 (PST)
Message-ID: <201112080025.pB80PGIe091691@medusa.blackops.org>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I've been reading up on tproxy and nfqueue.  Just to confirm my understanding
of the two:

Could one write a layer of code that uses the nfq_*() functions to basically
implement what tproxy can do by simply adjusting the destination information
and checksum, and then returning NF_REPEAT verdicts for each?

Thanks,
-MSK
