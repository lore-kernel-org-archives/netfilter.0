From: Anand Raj Manickam <anandrm@gmail.com>
Subject: nftables dports/Multiport
Date: Wed, 25 Sep 2013 14:21:36 +0530
Message-ID: <CAEyr1FS7WQD_H4vzC4-yqXrrwGrqkeodpBtrd5_g8GYpC-T_Ww@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=ZcrWRGhoNH4sF0THS6qJrtMuOjfplLzz/Os+L7vT5qE=;
        b=rxOY43t0rUodgye3IrY9pbwDNUGIBNjR40vOLThVouIs4rR7lQJZ5fc450ElfFwtQS
         kIA+eDtAhny7BAItvGS4l3MoVv2RfPnyfhkvZmQC8lQ703+O+OQu+CMVNYqKFTLpegGq
         6lI0oUg5UddpqSy+FaHaAswLaiVKIYECGjBSAeXDFMM6eL5Xk//CrZmYgFkLmvGJ7wIo
         tcnKQQMqEo90IYC72Bu3L0c/GVAXSEh3ykHoivNCgxl5nEjMhU1muPQBNSC0l41antle
         OVQD83nFaz589hVQSOSZWUf8LICsSEqpZxTaYp0MDdm402gxHQ8QrH98gmgMpQ1NRZVh
         0asA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

How do i add a multiport rule
 nft add rule ip filter output tcp dports 99,200 ip daddr 1.1.1.1
counter meta oif eth0 fails.


I see that the range works,
 nft add rule ip filter output tcp dport 99-105 ip daddr 1.1.1.1
counter meta oif eth0
