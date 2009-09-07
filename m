From: "J. Bakshi" <joydeep@infoservices.in>
Subject: How to view blacklist ip ?
Date: Mon, 07 Sep 2009 11:27:40 +0530
Message-ID: <4AA4A0D4.3080109@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I am using  blacklist like

``````````
iptables -A INPUT -m recent --name blacklist --rcheck --seconds
$BLACKLIST_INTERVAL -j DROP
```````````

and it is working really well. But is there any way to manage the
blacklisted ip ? Manage means

1> view the ips which are blacklisted
2> manually remove an IP from blacklist
3> manually insert an IP as blacklist
