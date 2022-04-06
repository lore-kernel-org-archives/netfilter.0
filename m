From: Joseph Richard <joseph.richard@redhat.com>
Subject: Dropping L2 PTP packets using nftables
Date: Wed, 6 Apr 2022 15:50:08 -0600
Message-ID: <CAC6fUJ3C26tGnLvmwtL5ZeAoyKcAcGx3HzQe_y9bqfVB+ymOHg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649281821;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type;
        bh=OJ7729k46nkYvaSrWV8h2WoGe43tDwJ+vxv3iME9ieE=;
        b=IMzwgV5LyhQTm26yDylqezBW5sviZLyAkX2uTzjITLF/WqqS9sYwel6ahjoFH3aCNO5ZyU
        9plTC3gTOiwqTEBsqJAbaclKOrq5HHm4M1qzp2IisWyDGtanFHENkRDqoOVXDEuxqhG+m3
        rvUPs5h3HYkzfLqr+CBQv9qMvUjLG1A=
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I'm trying to create a rule that will drop every 100th PTP packet
(Ethertype 0x88F7), but haven't found a way to get this working.
This is using a 4.18.0-305.40.2.rt7.113.el8_4.x86_64 kernel with
nftables-0.9.3-18.el8.x86_64.
Is this something that is supported in nftables?  Any suggestions?

