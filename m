From: Muhammad Faisal <faisalusuf@gmail.com>
Subject: src-nat only messages in Ulogd2 possible?
Date: Fri, 17 Mar 2017 17:48:00 +0500
Message-ID: <CAAzdDtP=1Crye=tn8Ob=j2J1bdK9_7Uz_azxLH2xed2fqRoScA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=JsbThFqVJe+mfu5Xh1Pc14zMCP92rypdgHJX9Vmx4Qc=;
        b=DtmV7AtWwmLvg2d97lRxDkWBIHihFZlMgZGEs30b9AGXeOBHcrlINNETiirUQreaLx
         Lgqh9wkw+w/NJH4RLvxYIy3DVHsop30rLudS40wvjX9rH2u14Y9eiBCL7y2IPODcnQEF
         LWXgVHuQ3DnS6M5tXEbHCSZE8RBHoGq+jpQceU3vUlNGX7GS4PDXrq55ijkFbQdpRnuT
         yCg9BS+A+Sjk4oYvJfWFu9vJlCAvCIkZkrJgr/RHXtbyoEb3h+i3oPptkNM1dkRgG2Dt
         59aUSIAzIf3oIHhfTYTx5bW12SZhBr+wCfvsNZWFL9aREIOs8vGJHkK43i2FRWLQ+FFq
         9xFw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,
I'm using ulogd2 to log conntrack events in syslog server. The issue
is im interested only in those events which are related to src-nat
this will save disk space.

Any suggestion this can be achieved?


Thanks,
F.
