From: Felix <credzba@gmail.com>
Subject: Packet performance impact of using netfilter
Date: Thu, 13 Dec 2012 17:02:37 -0600
Message-ID: <CAOZ=-EVnWbK74S=2RES5jo2U6crFSWv+R1uTNRDUmv=oY=6J3g@mail.gmail.com>
Reply-To: credzba@gmail.com
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:reply-to:date:message-id:subject:from:to:content-type;
        bh=qTXCheifpcDf8Glx/5oqe40qxTnS7BAJonecIzS1Sjg=;
        b=Vu3kF+CRA++HCRoAmhg0/dacoyU8v6c13VZV+61Mec4NK1vZqnN1bMFsNKhBdsgN49
         QMOQEfTPy82CcjuqZSdQeO5DtFW8wWSluQdp2OIbCBgXARWLNrwuatmWNCcgLbDOC0RS
         TahBeh4+XuPIPAvXK1rseKFLJLb1B1lGujF10nXXlntHDXpkNf3BL3/QI3MxDTooCnqu
         qF+4xMrtc+Z8Mb0VuDOZpy/IJfL+GDuDqE3Jfj5HSiWpGbslhyv53eurasyU5PsGrWfT
         rK4OyPha90ureCKjNH/1jC5wGIBjtbJ8MW50vtwQR6SxuX5QaWmvWQQCSG0hmL7tIA6P
         XaRw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org, Andrew Collins <bsderandrew@gmail.com>

I have a load balancing implementation using neighbor discovery packet
control, and I used nfqueue to route the neighbor solicitation packets
to user space. In user space I make the decision of which real vip
should answer, and generate the appropriate neighbor advertisement.  I
then use the nfqueue disposition to drop the solicitation packet so
linux doesn't respond.

During my design review, a concern was raised as to the performance
impact using netfilter has on the non-selected packets.
By that, I mean the performance of answering the neighbor solicitation
is not a concern, but if the implementation of netfilter in the kernel
causes a performance problem for the other packets being processed on
that same nic and/or ip then it is a serious concern.

Does anyone have ideas on the performance impact of netfilter on
non-selected packets?

Thanks,
Credzba
