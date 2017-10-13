From: "Walter H." <walter.h@mathemainzel.info>
Subject: Probably bug detected with ip6tables ...
Date: Fri, 13 Oct 2017 11:49:06 +0200
Message-ID: <1b6eda16c4c70db5c0bb1824a002c98a.1507888146@squirrel.mail>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mathemainzel.info; s=dkim11;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:To:From:Subject:Date:Message-ID; bh=l0VbHabwEp8Ij2fnxHIaDLWW5M0k4iPu2riPdtNW4G0=;
        b=vx/3G9HFd8LAG/INXQdzZlm0zteD+haKekbju2swAiT8jszFlPtdzDX9Cx+GaELBz6cDZkX0X6MC0QQyQn2U+4JydmVAARG9NSwBGYxxMb1T85iRvDNPNwYm2zF6Cm0IlznoxIFGhnm9TPOG2/ccPHVFHEyaVq+RHcuaZVNMvII=;
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I have a virtual server at a hoster, where I have a full /64-prefix,
so I declared a few addeesses with special numbers ...

e.g.  pi = 3.141592653589 and the IPv6 address is [prefix:3:1415:9265:3589]
there is also a special number below 1, the IPv6 [prefix:0:5772:1566:4901]

now the bug:

this works:
-A INPUT -i eth0 -d prefix::5772:1566:4901 -m tcp -p tcp --dport 25 -m
state --state NEW -j ACCEPT

but this not:
-A INPUT -i eth0 -d prefix:0:5772:1566:4901 -m tcp -p tcp --dport 25 -m
state --state NEW -j ACCEPT

Greetings,
Walter

