From: "Ian Brown" <ianbrn@gmail.com>
Subject: Writing a rule to change udp source port with iptables - noobie
Date: Tue, 16 Oct 2007 16:47:52 +0200
Message-ID: <d0383f90710160747n2790d1d0jad9ba67253c03d55@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=sDo3YUDb1q2EVwr5XJRtCoNqpZ9tSy2ei0ddbxqCTqk=;
        b=CUaQBm+Yb63vZAQ/9/BAbZVL8fGMBoPUySASSNLbdCCIetKpkJrbi2ITxXq3wDRiUYt9ScuH7hWyBpTk8k+nNib77puAmsvM6OCuFvuFHBmES2TZXXi5EHntRwDEBgEBCC1jDJi46wkN/qlbowkVoym9I7BxV2IS2TmKXUPL4Gc=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello

- Could someone please tell how do declare a simple iptables rule
which will change a specified udp source port in UDP packets having that port
to another specifed port?

For example, change all incoming UDP packets which have UDP source port 100
so thay will have UDP source port 200 instead ?

second: where can I find the archives of this mailing list ?
I see only broken links ?

Reagrds,
Ian
