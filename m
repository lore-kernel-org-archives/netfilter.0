From: Tomasz W <tomaszw104@gmail.com>
Subject: integrating netfilter_queue
Date: Mon, 31 Aug 2020 15:26:10 +0200
Message-ID: <17FC430E-239A-4DC3-81CB-8421C81AD040@gmail.com>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=content-transfer-encoding:from:mime-version:date:subject:message-id
         :to;
        bh=dYQNR/V6yl1CvaabH61nYmCKnWVJFrMOfA3JZqB6adE=;
        b=E18BnMLhcSBPKn64131t7ZGlVPRZ3J6jL1epgsoWsmccAYza4NaMTqV3sHTeNOi1RY
         mQM/J05P3nq0q98mkokj/+K+zTCiQxzacb01rn1Vl2eRb+bXDD3t4z/KbbSXnMzrZYIv
         nBeidc78OKAqZNdfXyjgW0LJzjTfu+8N4qC5bHbYbRVGt2ENcsEnqtJ9vHEaHTrk2Ts2
         wE22jMA7grRor3iLvg41jU/wx5A/L646jJDfxbOf2EnuYm56T02m92Peva/9cU8kSk7/
         wF0OM+mfJAQICaf/gZUOUj2JMUL+0IEUKE0rlMvuoO2RfeV+PuYHxOkQDXO3RZyKGSLm
         WN5w==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I would like to ask about the function that would take a pointer to the pack=
et as an argument, and mark it for iptables.=20
Using iptables, I could put in a queue, so those packets would arrive earlie=
r or later in relation to other packets. I have written a software that capt=
ure packets using libtins and check protocol using nDPI=
