From: Olivier <oza.4h07@gmail.com>
Subject: Multiple protocols in conntrack tool filtering
Date: Fri, 6 May 2022 12:00:29 +0200
Message-ID: <CAPeT9jhDM4i+xE3ynHd4z++b-cvd57THBJw28iNst8RRgziSdA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=lAJ7ptLukLHamAsOjbUmAiTm+hPdoE4CJHUvUS8gSsQ=;
        b=oX4bPwZrTxVjeM34hgHV+rqqw+U4BNzOcOGj656lhJazAmx8Qz+OrbVtLd+r6u9C+c
         fjwr0t5mWgvCIJs+gb73hhGI+D3ixWB9D0pLzcOp5HU2hqbeejHGL0DuhW7djwhCehcH
         BBXvE1vQ5+M63qgExUW7D819T11x8QQilLHTl/Yd7lf74DCGt1K2HbvT9uPEKmpisT/g
         zB8w4qfhNAoIKEwckG5XxDWQaFc4w3uJq0fhDf+A+YSfj49PnRwX/PclY4ChAor+UvKO
         +eeH3L0ALmocnE53ftCQYlJN/JGN+j6X2lQ33G3rTEqNIcyQKcplYFO5DLrA8Ty2mSW4
         WB8g==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

Current conntrack --proto filter allow a single layer 4 protocol to be
specified (se [1]).
Could it be possible to either:

- define a way to pass several protocols (meaning protocol1 OR protocol2)
- define a accept several instances of --proto argument to be passed

[1] https://manpages.debian.org/bullseye/conntrack/conntrack.8.en.html

Best regards
