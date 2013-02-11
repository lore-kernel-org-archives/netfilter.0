From: Aaron Lewis <the.warl0ck.1989@gmail.com>
Subject: Modifying data of a multiple packet connection with libnetfilter_queue
Date: Mon, 11 Feb 2013 12:47:02 +0800
Message-ID: <CAJZVxR=SroDrZJvQbiC-KJQLxhc68JOcf5242D9nKpPYyTtvHw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=2gSJUdu5t5BiZ8KYOnBRLxho0VM5ACDg77a5gUFwjFk=;
        b=g/vziq/bo4VQ8w42YzFNFgDeLEraU77kmb4mt5mw0YJjAlMgLXH35MKnA5s0MYrfcU
         160QtlDJXPV0BmVavNZBaLz3G+SSIEJvNRtDm7lzoCJuSYeNBjLmxHH0tEcUNZij7WKC
         eTQCFQV4mE6aWly974ulOzLlc4EiEnwAMH32q1L2m8yexmmdTJna9Y7EEgshbcyNX9Fe
         mtbkVaB34pB4lyjaY79cUDGA+MdPFJxSifjueVUmX6w4uWK8u7XMYO1hvRCnJQNAwfeW
         9SLkkZPpHZxYnT23Ui7i/W0tNpIbZBua3dHzkI64tRI6iAAGkQrFyTukohFhjwIvYysR
         qQ7w==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter mailing list <netfilter@vger.kernel.org>

Hi,

Protocols like HTTP are segmented, so I must rebuild the whole
incoming packet prior to modify it.

But with libnetfilter_queue, you receive one packet at time, and you
just either ACCEPT or do other actions.

Do you think there's a way to let libnetfiter_queue buffer the packet
before sending to userland program?
So that in the callback I will see the whole packet.

Any ideas? Or other alternatives is welcomed!

-- 
Best Regards,
Aaron Lewis - PGP: 0xDFE6C29E ( http://keyserver.veridis.com )
Finger Print: 9482 448F C7C3 896C 1DFE 7DD3 2492 A7D0 DFE6 C29E
