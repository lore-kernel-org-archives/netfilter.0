From: tingwei liu <tingw.liu@gmail.com>
Subject: multi-path route can't keep long time connections
Date: Tue, 22 Jun 2010 09:48:09 +0800
Message-ID: <AANLkTimeYhY-lgY2c5dfYQRDZ2oDLpB1U7TzkvyFQh_A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=J2BbeDXMl/zpmbm/l6lDZ992HZg/7ZgtbMaZm1wWx10=;
        b=C0Ck/UBeS7TyLC4YC1zP7LWwK0yJtcReCLbD98eNd2m9bbfCurn+IE2gA2Bh3OQXBE
         NMazl4i2aJzaX4wP5yrJsnk9sWEO1KJOS3VhjvnesX+lx9bmdHay1eyk4qXMEbF/DCx9
         Do3cwjEKBlQUoRCLW0qs/nqQCI1eE+nnuISoA=
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter-devel@vger.kernel.org, netfilter@vger.kernel.org

Because route circularly flush route cache
(/proc/net/sys/ipv4/route/secret_timeval),the multi-path route can't
keep long time connections. The long time connections maybe interrupt
every "secret_timeval" seconds.
Such as:
default nexthop via 192.168.0.1 weight 1
                       via 192.168.1.1 weight 1
                       via 192.168.2.1 weight 1

With a connection cross 192.168.0.1 in the first time."secret_timeval"
seconds later,this connection maybe cross 192.168.1.1,then this
connection will be reconnect.

Anyone can help me?

Your response is pleasure.
