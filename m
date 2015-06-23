From: Reiner Karlsberg <karlsberg@softart-ge.com>
Subject: ulogd "compressed" output for connection logging ?
Date: Tue, 23 Jun 2015 11:10:28 +0200
Message-ID: <55892284.1040809@softart-ge.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Performing connection logging, I can do it using
stack=ct1:NFCT,ip2str1:IP2STR,print1:PRINTFLOW,emu1:LOGEMU
However, this generates readable messages, which I do not need, but some type of "compressed" output,
to be examined later on.
Actually, I use gzip on the logfiles, but is there a method to have either "binary" or othrwise "compressed" output ?

Cheers,

Reiner Otto



-----
No virus found in this message.
Checked by AVG - www.avg.com
Version: 2014.0.4800 / Virus Database: 4311/10004 - Release Date: 06/12/15
Internal Virus Database is out of date.

