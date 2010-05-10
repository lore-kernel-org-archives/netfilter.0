From: Michael Hakimi <yalakvar@gmail.com>
Subject: libNetfilterQueue - Capturing all traffic
Date: Mon, 10 May 2010 18:32:42 +0300
Message-ID: <AANLkTilJNKEEx7mnh4pR17imRiyep5VGrspIHbpIiQrj@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=7TGq7AnhHTx3FysTiqLX6TBFRNpeNpPbFZSu/jvOnVc=;
        b=bzjA6DSJUEE2D+5I1PhOOX7MhXSbKv+UmtYngewRUbc0TM6O1zl55hQyZF1axhcvi9
         qruyQvGTQYFYCML6n2HUhMiCHWqY/SyA6MriZg1ykQjfzWkk2uiRGCMwYhW+8vgutK2j
         MVfMyHZJJuKAM53V4At7mVa3j9ErnutyDY9NQ=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I have a "simple" question regarding libNetfilterQueue and can't find
the answer for it.
I am trying to create an application that captures ALL the incoming
traffic using libNetfilterQueue. In the function nfq_bind_pf I need to
supply the protocol family. If I set it to AF_INET I get only IP
packets, if I set it to AF_PACKET the function fails.
I have also tried AF_UNSPEC but that didn't help.

Is there any way to to this?
Thank in advance for any help.

Regards,
Mickey
