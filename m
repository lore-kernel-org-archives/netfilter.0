From: Akshat Kakkar <akshat.1984@gmail.com>
Subject: Error in IPSET : Unknown argument `skbinfo'
Date: Wed, 9 Aug 2017 17:31:20 +0530
Message-ID: <CAA5aLPj4ZA-wDtsW7C+rt7a9X9_T+jrzxWV1pdfCUWYu7jiLTg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=m4iZzvhgvZGmxYmiAI83BkCpwgn8pk+cRFFT7EMCgas=;
        b=t9is5+u9YrVXUtRtByWPIxDLiBkpYkWeaV8aJDVbc4eAUEbeIHl7kCaG2GuX8hqSal
         WOe1f8RSl/RfjLk08LXWJeGN6qp+MI0SrdeIZjbjOdOk4NRdsDe6vwua2Kf2UhwE1Y5L
         VzGFmW3LNsxcy6aLlIpymrzCjLu6zDCyXKGSGitq9sxvxwz5vF+39o2vNchNyXh0uOSM
         ZZdgvSr9t1e9m7uHpClwNeWqPpsgzORUu/VltgZVd+loEIcAjSX1nD5uIhC1tUHgCLzA
         NY8xGPO80NhR2htt66zt2YfBnvxQirhBdhXQ75Zghxw2/qAVUdOWCK0vsRDL/VUERL4C
         AGaQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

my ipset version is 6.32. OS is CentOS 7.3. Kernel is 3.10

when I execute following command,

    ipset create foo hash:ip skbinfo

I get error as

   ipset v6.32: Unknown argument: `skbinfo'

Please help.
