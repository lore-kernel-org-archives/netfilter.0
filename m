From: SplitIce <mat999@gmail.com>
Subject: Module match order
Date: Thu, 20 Mar 2014 10:02:03 +1100
Message-ID: <CALFfGYbCou_nVUKgq8BJqFgffbY2TfiOc+VapUTf+1zBk8JTcA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=r0W0L0IKdN/vZScp8//8EsK1GrvYlUUJ5MhEiVL1Auc=;
        b=1BXuj55kx4ru0CmCHuWdP7+N0xu6++8CAWkUPCAT8CH7q2E85/pezU5tmZ40wq2AMi
         BVoC0LBwysqYuS4PGjhWT+e5HmkZsJ16JlZwNwPcO4WnBHEnXf3ACxbSo8Yv2yMnCusJ
         GyQBH15RMjhqCdOumlG3RDxIdFhr09MyaoQxdH1+19FBRALbT6Wnq02ODgF6g5Sjj9Qc
         pVUHiyZpwyKRTLtKIimzdrqQFKlwRx9/f4zhWphvgHhKMH/rFX2PU7d3tQCrVgtml+M8
         bMB27eT+dwcrxPFu7qNi5NBPJTMiDiRVPkq4h6TiE4PAV3xldB+Wwz5jSyiGnKcdVacR
         ye9Q==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

How is the Match Order determined in NetFilter / IPTables. When match
modules such as hashlimit where the act of matching alters an internal
datastructure and other match modules are combined the order can be
very important.

iptables -A INPUT -m statistic --mode nth --every 2 --packet 1 -m
hashlimit --hashlimit-above 200/s ....

With the modules executed in the order statistic, hashlimit the
hashlimit should only get updated 50% of the time. Executed the other
way the hashlimit is always updated.

Regards,
Mathew
