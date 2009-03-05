From: Mr Vandeley <mr.vandeley@gmail.com>
Subject: Nated connection behavior
Date: Thu, 5 Mar 2009 15:02:05 -0300
Message-ID: <87fa72960903051002g75faf755vcf16d10241de04dc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=zizJrC4ab8YvrarOvumO8WGeA0Mnjb1jziITdTbQQTI=;
        b=RvVGzQ0xArCroWTbfs8WyNgNMtXzkfRU5uWpaLfcIYvoR5xFuCH61qdBU204AGrclT
         td2tbJmZ+w6jqrN59u6/Pje49Db9UklmO+9M9YMSH/5xWkVjYH8mGq82vOk6jYIsqBs1
         z4U0V+YfAx8gWxIToV6B2GtcozvIy/EzBP3ac=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,
I have a question related to a NAT connection behavior:

|CLIENT|<----->[ROUTER/IPTABLES/NAT]<---->|SERVER|

Why is it that if I ping SERVER from CLIENT, I see answers comming
from SERVER internal IP instead of ROUTER external IP.

NAT rule on ROUTER is:

iptables -t nat -A POSTROUTING -s <IP SERVER> -o <external eth of
ROUTER> -j SNAT --to-source <external IP of ROUTER>

I know that it is awful too basic question for you guys, but if
someone could explain that I'll be much appreciative.
