From: Alon Bar-Lev <alon.barlev@gmail.com>
Subject: cmd-owner alternative
Date: Sun, 5 Dec 2010 21:37:02 +0200
Message-ID: <AANLkTikozmxU44ZNfkB91gsrbyM+ysEvPZPvASfJckEV@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=4JBkpRnhKbpMIjFW7Gbg03M+vj6NgXMgJ/dl6zCtt7Q=;
        b=wqXZlMkIrwMICGKwavloWYUJXUpel74sOIWFalDh+ib/CK1UjaWTRcW2jzGX/oxb3A
         QdEIYlv5Qoy669fjBguq3np6pCOEBtqflN53EXJADrYYhMvjKKoQXYG1alaRjiSQbP78
         G1Rq9CXulOeit+A0mzVaK3XqVZt6alb4Rv/04=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I see that the cmd-owner was dropped some [long] time ago, I do not
know the reason, however I need this functionality.
Is there any alternative for this? I mean to set up a static rule that
assigns specific command-line netfilter acls?

Thanks,
Alon Bar-Lev.
