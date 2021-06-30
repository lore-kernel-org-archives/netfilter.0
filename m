From: CoD DoC <coddoc37@gmail.com>
Subject: Strange behavior of the ctdir option
Date: Wed, 30 Jun 2021 17:38:35 +0300
Message-ID: <CAHtYmdGHdL98aytRB=YQ3fz3Go5-1h-P+_d6ji4ZEm1x-rQEmg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=qx9OB0dETTgYhShRpseZprFIqKu51AdyEPvVErHu1Jc=;
        b=LzgfyUHEkB9kBSY7p2xozcToYnu9NjfyKKop8gr8vNAkvJQkGc5CJp7S14gf/E3A7S
         S+8kGvWQ73/6cavR8afVOvLNbWtEFwA7tloE1W5qTtm2ss9YSENuU2EG0pfx6/KNH8iK
         oz3/IE+pyv+qu7lIm2XQ5SMliK8DzWwdpXQ5cx79e4RhCJwv3rJ/L0Hp9rjHUozVYHNJ
         1iBzWCjEKD/u+awXTUzcgtMAtQS4IaA04iu595ANepaUeEKLAGdRNyulm6GMWv1jS/tH
         ltCoQKHpcXJ+QYeGsL3p+Xsu9mZXcDP20/jbY39obEMZZrmWs37gkElKgRPVvf6mSjr4
         rOBQ==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello to ALL!

I'm slightly confused about the values of the --ctdir option.

If I understand correctly, the ORIGINAL direction is from the
initiator to the replier, and the REPLY is the other way around.

If so, suppose the following rules:

-A INPUT -p tcp -s 1.1.1.1 -d 2.2.2.2 -m conntrack --ctstate NEW
--ctdir ORIGINAL -j LOGMARK
-A INPUT -p tcp -s 1.1.1.1 -d 2.2.2.2 -m conntrack --ctstate NEW
--ctdir ORIGINAL -j DROP

Then I send a SYN packet from 1.1.1.1 to 2.2.2.2. I assume this is the
ORIGINAL direction. So I expect my request to be logged against the
LOGMARK target and then dropped.
But nothing happens.

Then I change --ctdir ORIGINAL to --ctdir REPLY and repeat my test.
Now I see exactly what I expected: dropped connection and LOGMARK
output. But with the REPLY value of the --ctdir option.

By the way, in the LOGMARK output I see: hook = INPUT ... ctdir =
ORIGINAL ... ctstate = NEW
And I agree with that. This is really ORIGINAL direction, not REPLY.

So where am I going wrong?
