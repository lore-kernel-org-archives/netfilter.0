From: Joshua Moore <ridgebacktech@gmail.com>
Subject: Nftables src NAT with port range allocation
Date: Thu, 27 Aug 2020 18:02:58 -0500
Message-ID: <CAK+5afBrW7h=YQ5eCL0DfDguLd44Os=rwe-_1=xWVMaP8nHR9g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=F3sZfxSwW0sSVYCTItmiUEbmq1ebX8fpZysRNMqLFGY=;
        b=XeZGnoxCC3vReKQBYTzuiqLo2hDI13W4MArmEatggoLzM/sQScveyr4Qy/MHhy0wtJ
         89WEbfzYedmsBeAr8vtq1MAq4YkEDyDIYxqM8kp3PG1hUzCK3R96FJHOwKOGYFDAkJFI
         SXgWeFTuicBzrCyd7nVL36/TL45zGfZtmoJaGS9AHEFu7MqfdNwbQyOuRYeyMGBEz71t
         C7ZzSYKz+6+31PxrktcUJRNmVCmUAeDcGbxybyOICeuvjO5JF3/CZqv5/o1PXdNmYMYb
         H/oErkrzrnrQ6mpQzdZXPHw9CLsRO7aa7QZLDoEwBj86HC+3+0QqgCHIbW24ZaW3Yb52
         Iz0Q==
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
