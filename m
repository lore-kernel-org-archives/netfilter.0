From: Reiner Karlsberg <karlsberg@softart-ge.com>
Subject: ulogd + event mode problem
Date: Tue, 23 Jun 2015 10:22:17 +0200
Message-ID: <55891739.4020406@softart-ge.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I am trying to run ulogd in event mode on an embedded system.
Actually I get log info for NCT in polling mode, but not in event mode.
 From ulogd.conf:
stack=ct1:NFCT,ip2str1:IP2STR,print1:PRINTFLOW,emu1:LOGEMU
...
[ct1]
hash_enable=0 #does not work for me
[ct2]from ulogd.log:
ulogd_inpflow_NFCT.c:1399 NFCT plugin working in event mode


May be, some pre-requisites especially for event mode are missing for my embedded system. Any idea ?

Regards,

Reiner Otto



-----
No virus found in this message.
Checked by AVG - www.avg.com
Version: 2014.0.4800 / Virus Database: 4311/10004 - Release Date: 06/12/15
Internal Virus Database is out of date.

