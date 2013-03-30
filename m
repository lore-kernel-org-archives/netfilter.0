From: Matt LaPlante <cybrmatt@gmail.com>
Subject: logging rsts
Date: Sat, 30 Mar 2013 17:51:17 -0500
Message-ID: <CAFZB6ArMXsC2cwy1SJhNKsKT8-=jyQaYHM384QwwGTvBo8AVeA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:date:message-id:subject:from:to
         :content-type;
        bh=aMn7cdSfeRV6s0lLASAiwpCw7wWX+vZMZY8SJ6Hlxfk=;
        b=dz++130aM1ElSbdxFsir+/GTRcTD8n4n33tD2Mqf9MJnu+AkBmAa+zcPtmxxL4d2Wc
         oivjy3wJ4eiCK+nMBECZP/riZ1AEjMvP/wues+wsLNtzwpWEF2CmSO/PA7OeEw14FOqF
         3NC7UQfHY/YUlr/WwhABTdZwJqltoa1voGBz+Pqs2mo+Q6GWhk+0KgMLLeQaPTVfilrl
         +qVSDsp1SVFysDWI8O+Q8kuRZ8Yq2dvY9SExwJzDoY3nyMpDp+DRmM+OiEiWSGXEKFxa
         VtCoR08Yzr76rbuMKRkfmlUNGuDhLnD2hWLLfdUBXmY70j+SqlWWaeF4yO9RF5KG1gWf
         xTPw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I have a Hurricane Electric IPv6 tunnel routing to my linux firewall
box running both iptables and ip6tables.  My ip6tables config is
pretty simplistic: accepts input and forwarding from the lan
interface, accepts icmp from the tunnel interface, and forwards
related,estabished.  During normal use the firewall is frequently
logging RST packets from 80 and 443.  I presume this is traffic from
web browsing happening on the lan.  My question is just why these
packets get dropped so often under normal operations.  Shouldn't they
be permitted as part of established connections?  I guess I can just
insert a rule to silently drop RST packets before the LOG line to keep
things quiet, I'm just not sure if it should be necessary.


:INPUT DROP [0:0]
:FORWARD DROP [1603:106671]
:OUTPUT ACCEPT [6344:552549]
-A INPUT -i lo -j ACCEPT
-A INPUT -i lan -j ACCEPT
-A INPUT -i he -p ipv6-icmp -j ACCEPT
-A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A INPUT -j LOG
-A FORWARD -i lan -j ACCEPT
-A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
-A FORWARD -j LOG


[32620.217272] IN=he OUT=lan MAC=[...] TUNNEL=1.2.3.4->4.3.2.1
SRC=[...]:1012 DST=[...]:999a LEN=60 TC=0 HOPLIMIT=54 FLOWLBL=0
PROTO=TCP SPT=443 DPT=34712 WINDOW=0 RES=0x00 RST URGP=0
[32623.630174] IN=he OUT=lan MAC=[...] TUNNEL=1.2.3.4->4.3.2.1
SRC=[...]:1012 DST=[...]:999a LEN=60 TC=0 HOPLIMIT=54 FLOWLBL=0
PROTO=TCP SPT=443 DPT=34712 WINDOW=0 RES=0x00 RST URGP=0
[32630.487245] IN=he OUT=lan MAC=[...] TUNNEL=1.2.3.4->4.3.2.1
SRC=[...]:1012 DST=[...]:999a LEN=60 TC=0 HOPLIMIT=54 FLOWLBL=0
PROTO=TCP SPT=443 DPT=34712 WINDOW=0 RES=0x00 RST URGP=0
[32652.293363] IN=he OUT=lan MAC=[...] TUNNEL=1.2.3.4->4.3.2.1
SRC=[...]:1014 DST=[...]:e34c LEN=60 TC=0 HOPLIMIT=54 FLOWLBL=0
PROTO=TCP SPT=80 DPT=44777 WINDOW=0 RES=0x00 RST URGP=0
[32657.887168] IN=he OUT=lan MAC=[...] TUNNEL=1.2.3.4->4.3.2.1
SRC=[...]:1014 DST=[...]:e34c LEN=60 TC=0 HOPLIMIT=54 FLOWLBL=0
PROTO=TCP SPT=80 DPT=44777 WINDOW=0 RES=0x00 RST URGP=0
