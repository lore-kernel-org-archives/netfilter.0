From: "Walter H." <walter.h@mathemainzel.info>
Subject: IPtables and String Match
Date: Thu, 24 Aug 2017 14:58:24 +0200
Message-ID: <3c4797dd17135f05badc81d9656c7e86.1503579504@squirrel.mail>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mathemainzel.info; s=dkim11;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:To:From:Subject:Date:Message-ID; bh=4BGM4D9u6xvGYhN2izXaKTKhs2Kprlb9wrNGe/38vp0=;
        b=wo6rSDgg0qzXrNgUis6cva/KKaPTqdnJP0O1IU8mZ3EIBErx5SrM2EP0uoyZkF+ezNUGnXOW54YHgo469oZEO+YCEfm6rAQvs3ZP44LmVGOP4vvQyUP2ntXgomp6NflIIyeEFTKWyFIZsnWYvGPN6LaY+VhRVdnnVf33ZhyUAHs=;
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

-N VERIFY-HTTP
-A VERIFY-HTTP -m string --to 61 --algo bm --string "GET /w00tw00t.at." \
                        -j LOG --log-prefix "IP[HTTP-SCAN]: " --log-level 7
-A VERIFY-HTTP -j ACCEPT

and

-A INPUT -i eth1 -m tcp -p tcp --dport 80 -m state --state NEW -j VERIFY-HTTP

I would expect that HTTP requests like

wget http://thishost/w00tw00t.at.SANS

would be logged, but it isn't

why?

Thanks,
Walter

