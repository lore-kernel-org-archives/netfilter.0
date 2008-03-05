From: Scott MacKay <scottmackay@yahoo.com>
Subject: 'queue' on 64-bit
Date: Wed, 5 Mar 2008 03:56:09 -0800 (PST)
Message-ID: <516187.96464.qm@web52409.mail.re2.yahoo.com>
References: <20080305114602.GA22664@piper.oerlikon.madduck.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080305114602.GA22664@piper.oerlikon.madduck.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter discussion list <netfilter@vger.kernel.org>

Hi, right now I have a need to implement an interface
using the queue mechanism under the older netfilter
design (for kernel 2.6.9-55) under a 64 bit kernel.

Are there any issues which I need to watch out for as
far as any alignments or the like when using the
library to set up/receive/set verdict?

-Scott


      ____________________________________________________________________________________
Looking for last minute shopping deals?  
Find them fast with Yahoo! Search.  http://tools.search.yahoo.com/newsearch/category.php?category=shopping
