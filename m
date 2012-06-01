From: Aft nix <aftnix@gmail.com>
Subject: Documentation for writing new nf_contrack module
Date: Fri, 1 Jun 2012 20:16:52 +0600
Message-ID: <CAGuaRCs_wVR4Usj6sALb=EDK=7m+3Oy6KNzo0Aui27Xgkbgu8Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=1bGz0BUcHMWZdzH9p6Plw8lSXmliLFzNzf/Dh/IlCG8=;
        b=dirWjUM+WaCvJ+cSlMI807QEV9+kH9PW+IyR9Ha0QAciU6zfHPWUwPX1mZaGmWrfBS
         toiBzDKnToF+DrTysrOrIrgiayY2neArjHhuLkKsHWeV1JnfnryCtMB6vur3kU54Xjrn
         XXn7rzrLRnoufnCgltzaKfFSKnPIOtAEQS4xDlzKiZTXh19Q/Bns6q1ki689d7qYOAT0
         4hjYcbbQ5Ccd8ZH99/Gfe2Y1AP8Wwi/SGqYf08ejZfU0yaxl1WzJiSOCBiIwN27a8Y/V
         VlsoKqsO0qOS2Urdqmf7q8oturAutw6C/Xmf39NiKzychC/9yjPiRFwIKchaJLEyb5Ld
         aDjA==
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

Hi,

I looking for good documention for writing or modifying netfilter
modules. To be exact nf_contrack modules.

The netfilter hacking how to seems outdated and incomplete. So any
other documentaion which can help me?

I'm interested in nf_contrack_sip module, which i will try to modify
as my needs. I've tried to read the sources or nf_contrack_sip, but
without a good background in netfilter core, it seems too much for me.

Any advice or links to kind of documents i'm looking for will be more
than welcome.
Cheers.

-- 
-aft
