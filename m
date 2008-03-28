From: Scott MacKay <scottmackay@yahoo.com>
Subject: pre 2.6.14 ip_queue - packet shrink issues?
Date: Fri, 28 Mar 2008 06:07:47 -0700 (PDT)
Message-ID: <923426.65658.qm@web52412.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

With ip_queue, under the older libipq style interface
I seem to be having a problem resizing a mangled
message smaller under 2.6.  It seems like the contents
could be changed, but the receiver got the original
packet size, like the trim failed or something.  Still
need to check the details in ethereal, but from anyone
using ip_queue or noting improvements in the new
style, does an issue like this ring any bells?  Thanks
in advance!

-Scott


      ____________________________________________________________________________________
Looking for last minute shopping deals?  
Find them fast with Yahoo! Search.  http://tools.search.yahoo.com/newsearch/category.php?category=shopping
