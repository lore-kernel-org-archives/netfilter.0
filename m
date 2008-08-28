From: =?ISO-8859-1?Q?Carlos_S=FClz?= <csulz@cmet.net>
Subject: Logging nat translations
Date: Thu, 28 Aug 2008 10:10:20 -0400
Message-ID: <48B6B1CC.5010408@cmet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi NF people, I've a question related a Logging issue.-

I'm already making a log with my conntrack session, but I need to log 
the "nated-IP" because auditoring.-

I mean...
the "-j LOG" parameter log the SRC-IP and the DST-IP (src is the IP 
before nat and the dst is... well, U know it.)
I need something like SRC= 10.x.x.x, NAT=200.x.x.x , DST=201.x.x.x
If there is a way to get this, please let me know.

PS: I'm doing NAT with a pool of 3 groups of 200 IPs

thanks in advance.

CS
