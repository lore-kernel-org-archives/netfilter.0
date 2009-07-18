From: Michael Mefford <meffordm@gmail.com>
Subject: questions about nfqnl_test.c
Date: Fri, 17 Jul 2009 23:00:30 -0600
Message-ID: <4A6156EE.60909@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=1/3n8cIGMsVOlVSGGfqPbJzbpdCMoTicMylivQJAIP0=;
        b=auy4r4uPEGgFc6335FwL0Y60mNLIFiOTNGEmsYDxB3UF+XhCITMeRxDmEBl1LMvBj2
         T9JYcEJKWLV7hP1+jroa8PLgvcjyv5upwNpRl6azJ9Qdryo2FKHS+h9LwTEv/u/UA5eZ
         r5q3gJYnrtK2NRz7T8jKT+oi+8xrE6anlmivA=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I just have two quick questions.

Towards the bottom of nfqnl_test.c there is the following:

#ifdef INSANE
    /* normally, applications SHOULD NOT issue this command, since
     * it detaches other programs/sockets from AF_INET, too ! */
    printf("unbinding from AF_INET\n");
    nfq_unbind_pf(h, AF_INET);
#endif

Why?  If this should not be 'normally' done, then why is it in here?

Second, what does INSANE mean?  I've never seen this before.


Michael.

