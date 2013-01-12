From: Lazuardi Nasution <mrxlazuardin@gmail.com>
Subject: Bidirectional ULOG with REDIRECT
Date: Sun, 13 Jan 2013 02:11:42 +0700
Message-ID: <CA+u3GuLXVukyc_wii+GM6frUf-Od6Tt2x1ahc_x6ZpqVchLwSg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=HwPFXgy6u9AslDjLSSOVa3NUes8tRLAUCUU4yrmngrg=;
        b=BGmIlVUmroDLcWgyl2OI17IdXFzUgvVMp59s/OQ/cKy94oDwxJK4Ut/pMka29/uiR1
         mzUl+m4F3OuH5arsLU1lSvD/1mYUmLrmz2mpoz3j9rTrZ+bc8a8aW4FbbdEJq0N4ECWB
         RdyL8aCO3WuMP4ko/8EqSmnjwL6y1AAeOovDAlqPBH3kUQHv8FUecCkxpG+ERuU7ntqu
         HlyFR3yo/eGdN+/K/cE7gTigaO6CDkXqnOgetjjTX1vegCuKR9w35Ekxv5QwdQ51lMPh
         34KeS0TqWy8TEcufk0yrcGeEzl1lIPuviKGWZapq+Dco4qnVJ99ENzuPR6QPwXp+cpfe
         Ugvg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I want to ULOG ingress and egress packet of LAN interface of a Linux
router with local transparent proxy implemented with REDIRECT rule. I
can ULOG ingress by put rule on RAW PREROUTING chain so I can still
get the original destination. The problem, I don't have any idea where
to put ULOG egress rule for still getting original source. I have
tried to put egress ULOG rule on NAT POSTROUTING chain which is the
last chain, but the log only show LAN Interface as source. It should
be another place of de-REDIRECTed of reply packets.

Best regards,
