From: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Subject: iptables 1.6.0 parallel build trouble
Date: Mon, 19 Sep 2016 19:22:27 -0400
Message-ID: <20160919192227.6b1f1487@playground>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 MAIL1.WPI.EDU u8JNMU78020488
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wpi.edu; s=_dkim;
        t=1474327350; i=@wpi.edu;
        bh=lFoGOS0NLC6bgPsjp5xuJkRvTM+5Xzf4hh475vM1iJs=;
        h=Date:From:To:Subject;
        b=wOFQU0p6kRUf8qg//muGWSlDhQnyABdGQOYDeBvpCwSjYzBImpcmbyaYzLwSUfObw
         a0GaCdNhm89PK78G5yPSD92ExJlhc/4AwdES5+RcpWzeiPocqOKVV/e4flsz7sTOqU
         2TXF6U8saSLMinSAKrtI1Ji5dfc2HhUlOmNNf3W4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

itpables 1.6.0 been building fine for a while now (though it *has* tripped on occasion, but works the second time through). But today it decided to stop building with -j 8.

I see the commit to add xtables-config-parser.h to BUILT_SOURCES. The patch works.

But I had to bump automake to v1.14(.1); iptables' build insists on using v1.14(.1). Do I need to run autoconf, too?

Thanks,
N
