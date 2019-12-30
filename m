From: Changli Gao <xiaosuo@gmail.com>
Subject: Assertion error when using map
Date: Tue, 31 Dec 2019 07:23:16 +0800
Message-ID: <CABa6K_EvuX5EJNNxM+9aESFephAjhos9dmmNmGsZJvjEzHiupQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=/48VSRObCE0Eu+tCrsiewS+ciu/vwzZm77Ie5jssEDM=;
        b=TP5FjHfd82EvU/ygQmCsskz0svAJ+V6fOpVddgjid11GOgCQWTDZQtnrmig+m8C6CI
         oX34THUW6v9wLQ2eArM5l3jBmnbaeWDRycwoyp7gYS82pABxyYCksHVgmUCtHiHwWoV/
         NnkYOMkrQgk0vmA84eTbq3M5BL2S2InBas+yT8zlZJnxzbTm8qgcVHcNyORGqzJpvoFT
         5P9jgxwV30rMOa6xqXQ7v6gRUu3c0Aoz++7G5gqEiPnoWZ26OmMPKL0+e6v6JSYwdlz1
         vuiCpARpICKkaZUAlxT/QCWzQcxY4NROzT9s2kAxqBsIwIJlI+kNAMWZPfsRvMRB/W7e
         DtlA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I want to use map to simplify the configuration of DSCP fields with
the following command:

> ... ip dscp set meta cgroup map { 3000 : 0x2c, 4000 : 0x20 }

But it fails with the following message:

> BUG: invalid mapping expression set reference
> nft: evaluate.c:1426: expr_evaluate_map: Assertion `0' failed.
> Aborted (core dumped)

It seems that the parser recognize the command as a valid one, but the
later evaluation process doesn't think so.

-- 
Regards,
Changli Gao(xiaosuo@gmail.com)
