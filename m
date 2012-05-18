From: JieYue Ma <xiaoma80.dev@gmail.com>
Subject: ebtables queue/nfqueue target
Date: Sat, 19 May 2012 00:44:07 +0800
Message-ID: <CAJ6iH_iJcdbeziWFdLF9d0vEqjrcQ-ZO3jSP3nFJBwBV-qVyFg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=Yr+1iiR4qGk/AujbDVd2jigiD8UHXcF96Q3EPFtCdhU=;
        b=tikD4ljAQB0UCicapPf7l1MaySJzAy0mKuPRMtwqBBRxdaDq+srrnlooP/ehiGP5Qp
         HgsbLGmXBjRtEyvGnE8PD+X/wqQTOHWCeyquLPTGDRprc2EDhEJVurPkt8ktTVRbKp0j
         T8PiwlZlglRn3TzUmnolWbK3LUyHu/BqySDosaGz1eI5zba3JVsZJ/LWRJsZPAIo6uPl
         DNeuhBHZM9wno25x0lYZXmVDZN/W/DtzlPry++ZBZy+WlR8S/jS7yjarmZ4muP07Wn3g
         iEl9L0BjmuZk3g7m9VF6vG3nERqGAgH1Tb/w63uAZRQQ1IiDQIQPMRM2FGiLfECTcAc/
         6FyQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

hi guys,

has anyone ever tried queue/nfqueue target in ebtables? I'm not sure
if it has been implemented in ebtables, though it has in iptables. Or
does community plan to implement it in the future?

thank you very much

BRs
jerry
