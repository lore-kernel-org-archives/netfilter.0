From: Jan Engelhardt <jengelh@inai.de>
Subject: Re: Conntrack-tool error -  undefined symbol:
 nfct_filter_dump_create
Date: Wed, 7 Nov 2012 10:40:37 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1211071038070.10969@nerf07.vanv.qr>
References: <1352276726.31157.YahooMailRC@web184806.mail.gq1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1352276726.31157.YahooMailRC@web184806.mail.gq1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karthikeyan Vinayagam <vkarthik@yahoo.com>
Cc: Netfilter user mailing list <netfilter@vger.kernel.org>

On Wednesday 2012-11-07 09:25, Karthikeyan Vinayagam wrote:

>I am getting the following error while running conntrack, this is under 
>under  ubuntu 12.04 (3.2.0-30-generic-pae), compiling latest of 
>libnetfilter_conntrack 1.02, conntrack_tools 1.4
>
>conntrack: symbol lookup error: conntrack: undefined symbol: 
>nfct_filter_dump_create

It would seem that you ultimately do not have libnetfilter_conntrack 
in the required version.
Check for the symbol.

$ readelf -a /usr/lib64/libnetfilter_conntrack.so.3 | grep dump_cr
   112: 0000000000007a90    15 FUNC    GLOBAL DEFAULT   11 nfct_filter_dump_create

(Use ldd on conntrack-tools to find the actual location of the lib)

