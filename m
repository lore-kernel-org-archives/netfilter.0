From: Piyush Joshi <pj.netfilter@gmail.com>
Subject: How to block proxing https connection ??
Date: Mon, 2 Mar 2009 10:40:31 +0530
Message-ID: <52da25120903012110p23d6d3b4l4a568eaf8af6c495@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=aFAWHikMAb0Pm1Gk9E+is/481UVVTZr4+7c2/4003/4=;
        b=QMwDoqMT/onc/mykZpxKByPMOKbKLvcSv3NTL1yJ0Gg8GVbWSS2M8imX/4yvGfOx2g
         SmehGIUKLOD9Zg9p5LJxsRF8Q8dvGOBC5jmBgUnxAk56NndBNfUxqPX9M9BMlwU/71Aj
         5ZnXJiQx3VaA86q7Kd79WEnU8q/S6JIfB3OMU=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Dear All Expert,
                         I am new to this list and have a question
regarding netfilter. We are successfully running netfilter and now we
are seeing that some users using malicious tools to go to the internet
by creating https connection to outside proxy and open banned sites,
Is there any patch for iptables to prevent this ??


Thanks Regards

Piyush Joshi
