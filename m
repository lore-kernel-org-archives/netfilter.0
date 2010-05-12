From: Michael Hakimi <yalakvar@gmail.com>
Subject: libNetfilterQueue - Non IP Packets
Date: Wed, 12 May 2010 10:36:28 +0300
Message-ID: <AANLkTik86muZUl9m1T4LzHAzYj_-wJGavRljHpGfNGUr@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=54V4xuWUoU/xa4YrFcxDPhkq2/lRGqkpEEl/DVe774k=;
        b=wbQxyfrp3M30gyeq/OXbO2bGU55KwTR/5Kdx9Je6a8cy7bc7WQEDHPIXSQV9nczp/q
         RsREhpP5xdp9NshMIT3N6PLbLZJyYZVPkuq4BegmFxewRTho2vUZMIbcVPk8enDnvjJT
         TfHHEzzqI22F3lz+ce1OKcn4lk4etTPEobgU8=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I have a question regarding the function nfq_bind_pf.
If I call this function with AF_INET, like: nfq_bind_pf(nfqHandle, AF_INET)
Do I limit myself to only IP packets?

Is there a way to capture non-IP packets?

Any help would be appreciated.

Regards,
Mickey
