From: Sergey Naumov <sknaumov@gmail.com>
Subject: match a few ecn-ip-ect in one rule
Date: Mon, 24 Oct 2011 14:48:12 +0400
Message-ID: <CAH3pVZOW=dQ+BrHJOsvQY5DXL-BhnV0uWiTG44JXKdQ_EeXwXA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=seldpYI2qV99kyKD1CkRDU11+r6so/aqcSXqH30dMlM=;
        b=efVVxh0SKs7JAjZ051NMf6Qb11hwu2HIpJZt72IvYzbMITMRMmRv+CvmlG1w4X6mkb
         zpWUlAdQp33JS1vViEbasHSOG+duThfkSs19BxNeGsbchsSb9HbLbCE9c4uTiuVVMRwd
         U4Ovx/3BgJa4tk+nId0elA/wickPABDqRbJWs=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello.

I would like to ask whether

iptables -A CHAIN -p tcp -m ecn --ecn-tcp-cwr --ecn-tcp-ece -m ecn
--ecn-ip-ect 1 -m ecn --ecn-ip-ect 2 -j ACTION

will work as
1) filter by tcp options
2) filter by tcp options and ecn-ip-ect 2
3) filter by only ecn-ip-ect 2
4) filter by tcp options AND (ecn-ip-ect 1 OR ecn-ip-ect 2)
5) some other behavior

the 4-th variant is desirable (the goal is to be able to specify all
desirable options in one rule, or I have to split filtering by ect1
and ect2 on two different rules?).

Unfortunately, it is unclear from the manual.

Thanks in advance,
Sergey Naumov.
