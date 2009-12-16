From: Richard Hartmann <richih.mailinglist@gmail.com>
Subject: Does someone have statistics about/experience with tc/qdisk on a few 
	hundred ppp interfaces?
Date: Wed, 16 Dec 2009 10:34:22 +0100
Message-ID: <2d460de70912160134t7a7c387aj9efd315622fcce3f@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=Rh+ykcDfJyWu26n7KIpHSa+wv4dcjvEv+bFO3CUCjcQ=;
        b=Dt6eKpg1xTwGB7D5GNTi81UPcVbtJxzfLBMeaahIIRVsO7LCGtHnLz8SjJG9tDdJVr
         J9nU36RiotwQadu/sjPKiPesIPNk0Qr3MIx7K3+B6jLYSR21dBFxzbBRrZzEmp4+Pi10
         16ZxmPrD3ANjScsbjasbAHgbVvhjpbQd1scNE=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

we are terminating a few hundred DSL customers on Linux machines and
want to introduce traffic shaping for voice, etc.

As we have a full Linux stack both on the CPEs and on our termination
equipment, we are extremely flexible in what and how we want to shape.

The obvious choice is tc/qdisc and while I do have experience with it, I
could not find any numbers about scalability. While I assume that our
workload is not a problem on today's hardware, I'd rather be safe than
sorry.

On reasonably new hardware, how does tc/qdisc handle between one and two
hundred Mbit/s on a few hundred ppp interfaces? If anyone has some
ballpark figures about their own usage and/or a link to a statistics
document, it would be much appreciated!


Thanks a lot,
Richard
