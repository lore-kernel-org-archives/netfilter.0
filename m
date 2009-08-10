From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: libnetfilter_queue ---- set_mode function not returning .
Date: Mon, 10 Aug 2009 13:56:59 +0530
Message-ID: <cfeab66d0908100126g54834d7au51f7444d6edcefcb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=UZUo+Jdy0u97L4vju20yP5JAK6ybS/pUSeUO80Kz11s=;
        b=szi0I0WXhe0nGieeRrE5hQqKSBlAgojKWgAnK2I6bvYtja3/GFVYKXnYH016etxJZM
         S8QB4bq5WjaXk6a+WcTq2ols3816yLXm1a5l10TOoM8GnkAOqNwCa5+QCss5ealEsxbR
         ET+ZGRmTp/ke2D3I/xAPzsA07plsHxjTC+s28=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi ,

 I have following code


nfq_set_mode(qh, NFQNL_COPY_PACKET, 0xffff);
printf ("RAT");


The program got stuck after calling nfq_set_mode . What i meant is ,
"RAT" is never got printed up .  What vould be the problem ?? any hint
is greatly appreciated .


Thanks,
Ratheesh.
