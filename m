From: don-nfil2@isis.cs3-inc.com (Don Cohen)
Subject: u32 question
Date: Sat, 19 Dec 2009 18:33:12 -0800
Message-ID: <19245.36072.654916.551426@isis.cs3-inc.com>
References: <20091219231018.B79C41A8193@isis.cs3-inc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20091219231018.B79C41A8193@isis.cs3-inc.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org, Mike Kuketz <mike@kuketz.de>

Don Cohen writes:
 > 
 > This example doesn't seem to work for me.
 > Does it work for anyone else out there?  
 > 
 >  $ iptables -A OUTPUT -m u32 --u32 "0>>22&0x3C@12>>26&0x3C@-3&0xFF=0:255"
 >   -j LOG --log-prefix "TCP with payload *** "
 > I've tried some examples without the @ and they seem to be working but
 > I don't get anything in the log when I do this:

A little more data - this seems to work when I replace the -3 above
with 0.  It now occurs to me that the problem might be that I'm using
a 64 bit machine and the -3 translates to #xfffffffd rather than
#xfffffffffffffffd.

(Mike, are you using a 64 bit machine?)
