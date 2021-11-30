From: Vladimir Nikishkin <lockywolf@gmail.com>
Subject: What is the GPRINT output plugin for?
Date: Tue, 30 Nov 2021 10:30:17 +0800
Message-ID: <87y256gyti.fsf@laptop.lockywolf.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:from:to:subject:date:message-id:mime-version;
        bh=JU2cohmdzKt2xJ+8uEQCIarBuw1KPy6ZEopzMfn0dd0=;
        b=DPeidZtAHoe+zWIE9CgQS1IsPRY4H3sWQg/ce45Wk7fp08XVcgsetaTswRTUAffdsh
         K3p6CLi7DKAxz0duMECzU6Rxh7m6MrxVXceZ9QUvoG99EJOcsKJ+FqDI0vRcedlL4Eqi
         bGLgI6SAep8R7D8qafp/gF31CG1uYoUNWsN4QM2eeg/NFW7sBYMW8YUesSBz7m2Bq7L0
         kYKnHkTlbP3X0Yqj8H/EIqYcOYx4pbVLfoa49TWNR5WFrUsOG2D3X0wTLjnQK9ev8toA
         iPa+GoPu+W8UrNdqb9YN5D5nSoq1fAzWK2BByV1oltDGFjnSt/b2F/67qPVMvylpMG/g
         PfSA==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Dear Netfilter users,

I have been recently trying to find out how to efficiently log
suspicious packets passing through my firewall. While perusing ulogd2
examples, as well as netfilter mailing list, I found about the existence
of the GPRINT output plugin.

However, the basic stack suggested in ulogd.conf:
```
stack=log4:NFLOG,gp1:GPRINT
```
did not really work for me, ulogd was complaining about
```
ulogd.c:854 type mismatch between GPRINT and NFLOG in stack
```
And the log file was empty.

I haven't found any other documentation for GPRINT.
What is it and what is it for?

-- 
Your sincerely,
Vladimir Nikishkin (MiEr, lockywolf)
(Laptop)
