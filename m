From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: l2tp , pptp pass thru mode .
Date: Tue, 27 Apr 2010 21:37:42 +0530
Message-ID: <t2xcfeab66d1004270907x520eb9a0r325a2b8829d9a366@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=PahF5NcoRHhWWZzf7oKtCwhEPtrcxfT2A+ydhO1ZnXY=;
        b=jYEjlIJQaiz43cVjqXjvQC8wBHwuIPuzjsCTESYZiwa4ZlQk1YFtpMjHLT3pW0gt5S
         2+BT94p6vuPiSfetU1KBIat3Ucav3e2+O7RXcy/KLkZ85ZOtmOnMW3tCsCGYFeJPB8jI
         jkMF+cUG6De58fNqrKfAbwrPLjZlBuMyJtAVM=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

My home Router has following iptables rules

iptables -A INPUT -m state --state ESTABLISHED,RELATED  -j ACCEPT
iptables -A INPUT -i  lan-interface   -j  ACCEPT
iptables -A INPUT -i wan-input  -j DROP


iptables -A FORWARD -m --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i lan-interface -o wan-interface -j ACCEPT
iptables -A FORWARD -i wan-interface -o lan-interface -j DROP


pptp pass thru  and l2tp pass thru  works fine  without adding any
extra rule . why ?'

Is it because of ALGs ?

Thanks,
Ratheesh
