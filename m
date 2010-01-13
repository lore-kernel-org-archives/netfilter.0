From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: find_best_ips_proto ??
Date: Wed, 13 Jan 2010 15:36:21 +0530
Message-ID: <cfeab66d1001130206k1a31dd63nce25e38febb6e947@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type;
        bh=RGe6NvsxTovL2D/U5nj/RzngxD2BgijuW5Laa4B+unA=;
        b=BKcOiChuUirXc2TV9HHHDdl7vPukjeWuZd91JT0j1EkRpi8NiWPM1M0Y8NqS5JRW7m
         Bm/n4ReQMxj+6qY7V5CKMbDcH86Yq+1dYX/cGOxwY1ttBCg10ewgrRqqPXoWjeT9/6zX
         NWaNuVMWon12bY91/2YGq3WNmE6vMNzyNxwUY=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I am looking into 2.6.18 kernel , /net/ipv4/netfilter/ip_nat_core.c .
I could not understand the function  find_best_ips_proto()  eventhough
there is some comments on the code . Could anybody please explain a
little more  ?

Thanks,
Ratheesh
