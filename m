From: Jeremy Audet <ichimonji10@gmail.com>
Subject: Re: Service names
Date: Wed, 20 Dec 2017 15:18:28 -0500
Message-ID: <CA+A7n+iG06Tp9oaYCWUDPsoqV=JN4BVQZHtPvxqA8ZTQhAfmqg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=bhzr+DaRlYke4UP1g+8y2Q0XTx8Qq0SQaGV300XHFCA=;
        b=kODCpImQ3f7+iuoQp/crSXmTedJG9uPLJWaDG+I4dsBqETii5JNvbnG8XEDcOACVhe
         /KEtmdi6Rl46iS1kP1BPlDv5CU/pjrVcW0xCQkOBDGXIHKK32r3bMA504fsOw2Xa4e8r
         Em/aRThdcc7Lfy4EuSmCG2XzVa1PiD71bbOU4fZB11a+I7uuZQaX+f56pQoWEP54cev0
         j8xNBKd0LaFhKrl2s/QCXV5QTYzaym+BFEaIF2nPrF2jCJcxrZMiI/SVNgju9kdxjKa9
         gbikQJNzMH4k1B0mA/80yjYv96H/iSChtgBaLhaflHEsN7A3fG+lCZHcDAymjf+dlGe2
         TOpQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Apparently, ProtonMail is incapable of sending good quality plain-text
emails. I'm sorry about that. Here's what I sent earlier, and
hopefully gmail can do plain text right.

Hi, The nftables 0.8 release notes [1] state:

> * Replace getaddrinfo() by inet_service internal lookup table, we don't
>   rely on /etc/services anymore, so we have a predictable input from the
>   parser side.

Questions:

* Is there some way to view the name-to-port mappings exposed by
inet_service, aside from digging around in source code?
* Is there some way to provide insert custom name-to-port mappings
into the inet_service lookup table? Or is this a terrible, horrible,
no-good idea?

Thanks,

-Jeremy Audet

[1] http://www.spinics.net/lists/netfilter/msg57664.html
