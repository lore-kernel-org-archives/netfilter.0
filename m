From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: INT_MIN INT_MAX ULONG_MAX
Date: Fri, 28 Nov 2008 15:39:27 +0100
Message-ID: <4930029F.6090705@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter list <netfilter@vger.kernel.org>

Hi List,

I dowloaded the latest iptables git repo and tried to compile.
But I got these error messages:

../include/linux/netfilter_ipv4.h:53: error: 'INT_MIN' undeclared here 
(not in a function)
../include/linux/netfilter_ipv4.h:63: error: 'INT_MAX' undeclared here 
(not in a function)

libipt_ah.c: In function 'parse_ah_spi':
libipt_ah.c:36: error: 'ULONG_MAX' undeclared (first use in this function)
libipt_ah.c:36: error: (Each undeclared identifier is reported only once
libipt_ah.c:36: error: for each function it appears in.)

... and friends.

These errors can be corrected with inserting the "#include <limits.h>" 
line in each source file....

Why do I get the error message?

Thx,

 Swifty
