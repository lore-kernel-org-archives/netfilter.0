From: Joshua Moore <ridgebacktech@gmail.com>
Subject: Nftables src NAT with port range allocation
Date: Thu, 27 Aug 2020 17:57:10 -0500
Message-ID: <CAK+5afDKY+yPtOSb4JELDd5k=ezaPXJBjGf1T2waho1MYX_1+Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=F3sZfxSwW0sSVYCTItmiUEbmq1ebX8fpZysRNMqLFGY=;
        b=i5KNKu2j06/MrZUfc91szYIbeAaoY6p5RGmJENqpoARpdEKrniockxD9p8W8taK2FN
         j38ZIgX2PBRq9FARwNVKCYrHR9RaF4xjczJy8Lihm4kw38Psd9xCfbXDDdXKy/AQexAS
         9SeFCc7ZrAGRyGW8bcTSjuKFibKF4ApAOJYdtZNFaHpsu/q2JmB8Gkw+BW1OJ9d2fw4M
         SpBzLrSE9/z+yD+CNH/sojYRRsf/ErmcxkB9327kgCCh+LNSlQo8COhBStwOqhbON8tL
         FRpwnBvaJbc5UD1382RnYRTOLEfI7EX8vh6d3eYk9jhEyZ3W3UAyb1T6GeYvcZmL0vEf
         nMWg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I am wanting to do a determinate src NAT IP/port range allocation
leveraging nftables. For example, for every "original src
address:original src port" there is a mapped "new src address:new src
port". The original source address is known but the original source
port is unknown. The new src address is known and the new src port is
from a known range or ports.

I thought about leveraging maps to do this but I'm unsure of the best
way to dynamically capture the unknown src address. Any suggestions?

Thanks!

-- 
Joshua Moore
