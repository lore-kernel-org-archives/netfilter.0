From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: nfqueue
Date: Tue, 20 Jul 2010 22:31:58 +0530
Message-ID: <AANLkTinE-tw35KEN1UeiL-NeLJ9MZzO8YugNphFNrGs2@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:cc:content-type;
        bh=F40yNUFWTybxxXUCDdTcFFSbdQJf6qCS5o6ni0HI9Iw=;
        b=AKwv7RIEtc7pZp3UX9CR4AJLsN406LvSqnFtgc/Sg2iTOuVbwTrMv739skoqHcKP7Y
         79u8ZgRvMN8Xg/eHABRUwciM6LH3FOXPu7pnEUGus/VfZ8IVljIyUIRFmO6GCRsBwLTB
         fphM+p5XY8BiFtJExLPuPVy4OpKInUdRPOEMM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter mailing list <netfilter@vger.kernel.org>
Cc: Jan Engelhardt <jengelh@medozas.de>

iptables -A FORWARD -j NFQUEUE

I would change destination address and port in userspace and w will do
accept verdict

1. which hooks p acket  will traverse ?
2. Since routing decision is already made , is there any scope for
route find again ?


-Ratheesh
