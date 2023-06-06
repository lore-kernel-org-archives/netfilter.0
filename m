From: Tushar Shinde <mtk.tushar@gmail.com>
Subject: nftables: How to stop further chain traversal after accept verdict
Date: Tue, 6 Jun 2023 21:09:32 +0530
Message-ID: <CABQpAL4Me34uEDnOi9t=98w+qnGKw6Op+f+XTB9by1uTdv3iUA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686065984; x=1688657984;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=48Mtm1h5SiSeKPEGR6COTqAY25QVaYAy1qamxwalL48=;
        b=ARUkahUnpnNzr6QC/rvHn+nCGIrt1pzfmznwUyGM0bTeU6hW8OS3RBSjMI91mXdoF+
         L8beYlusZX3ui29ERRL/7CMk1TZ0tt2Bsdb/vJOAMV5Aqw8Qi8mJHCR15d2qx4MlsVmU
         23rbCXtUzFA3659kvevbweDL4dLFCH2yFwNZ7a99JiH50myICoEujOrtdu4lN91QkSg6
         vmCiZNNdE3jMVmPqRnHS5UA5EDb2u1ixccQq67iyiAj+IGspZEWZbS+/3pRLQFsrjp8O
         Peq2WriAoNEffvMqXwoquwP9SoIvAxh4JKwq8jXAiwamTOXA0LXC+FSdnouaGUPZHY/g
         MfuA==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I have asked the same question to super users. But I looks like I need
help from experts.

https://superuser.com/questions/1787416/nftables-how-to-stop-further-chain-traversal-after-accept-verdict

Question is, If there are multiple tables (possibly owned by multiple
teams/projects ), if a rule is accepted by one of the tables in the
chain, how to stop looking into the next high priority chain. Right
now my observation is ACCEPT just stops processing the current chain
and jump to next table. If this is last table then only ACCEPT will
work, otherwise this ACCEPT is useless.
Logs are on SU post.

Kindly correct me if I am wrong.

Thank you,
Tushar.
