From: Roc Bai <buroc83@gmail.com>
Subject: How to redirect the package from eth0 to eth2
Date: Mon, 10 Jan 2011 18:08:10 +0800
Message-ID: <AANLkTik5YfQ4eNzbSVt5QfmaEQnBA=VJ1NbueKgq9nZj__6362.58143135837$1294654110$gmane$org@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=fM2Tw8Me3p9iD5yP8RGudg0NkHCmnqBgmD9LqP6ItRg=;
        b=iNR3VCZUogTnSSFpEa812j1G8Tpg2DflN8BDjb8jH8T+v5qZCB6bO3AYeHLi1rYwP3
         k9gR55axCF91TheODPYthKqTn8kO4lbMjodlYt6X0b/ZGHBGRRGstkLtIWmGR+TgTuF+
         d3Qo6fWgX/HP/yLQsuoK8nfiznxSP13ArZY4w=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buroc <buroc@126.com>

Dear all:
    in my service, there are four net card.  eth0, eth1, eth2, eth3. I
want to forward the data in from eth0 to eth1, eth2, eth3 with
different application protocol. Does some body send me some ideas on
it?

   1) where i should set the hook: pre-routing or forward?
   2) how to make the route select the target port which i hope?
   3) where i can get some simple source code to learn?

Best Regards

Bai Shuwei
-- 
------------------------

Thinking before action, but you are wasting time if you don't do action.
