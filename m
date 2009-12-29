From: Medialy <medialy@gmail.com>
Subject: Why "No buffer space available"?
Date: Tue, 29 Dec 2009 10:49:56 +0800
Message-ID: <cc73a9220912281849qf25a81evdb6082197d037917@mail.gmail.com>
References: <cc73a9220912281846h6a337b76ud7d9d1f61371f21e@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=ZnmI/92MyN6pL1oICj4xt6UTf7n5Ey03SP3xv200tzE=;
        b=sebSWNW7GZfn+gITs0ayBT80P/PEA2b4tNpM2Ub5+DOjuM+mxCg2ASvCBKc+zONWua
         Kz9BGhXlZWcWZcx1MkQl8AxpdDNl6mUtsrjjWwwc5+uP1SSwm8F/z/hqX7JlGx2Zsmwv
         dsiw2naWj5/nQD98KiEw5qSRxs03UcPyi5/KQ=
In-Reply-To: <cc73a9220912281846h6a337b76ud7d9d1f61371f21e@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi,
I have written a program to log the nat behavior. the program works
well when traffic is low. But when the traffic reaches 1Gb, program
always error.
According to the previous discussions about this problem, I even set
the recv buffer size=A0to 50MB and the error still exists.
=46or every callback, format the data and then put it into the queue
directly.=A0 The formating of data causes less then 1 second for 0.65
million records.
Errors always occurs=A0 when there are less than 10 log records.
Is anyone who can help?
Thanks.

Setting:
=A0=A0=A0 Redhat Enterprise Linux 5
=A0=A0=A0 libnetfilter_conntrack-0.0.100
=A0=A0=A0 libnfnetlink-1.0.0
=A0=A0=A0 recv buffer size: 50MB
=A0=A0=A0 nfct_open(CONNTRACK,=A0NF_NETLINK_CONNTRACK_NEW|NF_NETLINK_CO=
NNTRACK_DESTROY)
=A0=A0=A0 1Gb nat traffic, 0.65 million records per minute
=A0=A0=A0 circular queue size: 1 million

Error:
=A0=A0=A0 nfct_catch error: No buffer space available

Program Structure:
=A0=A0=A0 Callback:
=A0=A0=A0=A0=A0=A0=A0 lock;
=A0=A0=A0=A0=A0=A0=A0 if log number > MAX_LOG_NUM:
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 discard
=A0=A0=A0=A0=A0=A0=A0 else:
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 put log in circular queue
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 log number +=3D 1
=A0=A0=A0=A0=A0=A0=A0 unlock

=A0=A0=A0 Thread 2:
=A0=A0=A0=A0=A0=A0=A0 lock;
=A0=A0=A0=A0=A0=A0=A0 if log number >0 :
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 get lock number
=A0=A0=A0=A0=A0=A0=A0 unlock
=A0=A0=A0=A0=A0=A0=A0 process log data in circular queue
=A0=A0=A0=A0=A0=A0=A0 lock
=A0=A0=A0=A0=A0=A0=A0=A0log number=A0=3D log number - log number proces=
sed
=A0=A0=A0=A0=A0=A0=A0 unlock
