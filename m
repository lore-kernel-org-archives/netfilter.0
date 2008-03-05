From: Scott MacKay <scottmackay@yahoo.com>
Subject: 'queue' on 64-bit (unrecycled)
Date: Wed, 5 Mar 2008 05:06:58 -0800 (PST)
Message-ID: <36687.37978.qm@web52412.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter discussion list <netfilter@vger.kernel.org>

(sorry about the recycling)

Hi, right now I have a need to implement an interface
using the queue mechanism under the older netfilter
design (for kernel 2.6.9-55) under a 64 bit kernel.

Are there any issues which I need to watch out for as
far as any alignments or the like when using the
library to set up/receive/set verdict?

-Scott


      ____________________________________________________________________________________
Never miss a thing.  Make Yahoo your home page. 
http://www.yahoo.com/r/hs
