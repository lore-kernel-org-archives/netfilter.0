From: Roger Sala <rsala@ssci.com>
Subject: nfnetlink_queue interfering with ioctl calls
Date: Fri, 13 Aug 2010 10:10:50 -0400
Message-ID: <4C65526A.1030805@ssci.com>
Reply-To: Roger Sala <rsala@ssci.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi

I have code that makes the SIOCGARP ioctl call that works correctly 
(i.e. it either returns successfully when it finds a match in the arp 
cache or it returns -1).  However when I integrate that same code with 
nfnetlink_queue code it no longer works as expected (i.e. it returns 
successfully (0) whether or not the address was found in the arp cache 
and it doesn't copy the mac address into the struct arpreq).  I searched 
the archives and didn't see anything about this.  Does anyone have any 
idea what could be causing this?

I'm running ...

# uname -a
Linux bugsbunny 2.6.30.9-102.fc11.i686.PAE #1 SMP Fri Dec 4 00:19:26 EST 
2009 i686 i686 i386 GNU/Linux

... and these two modules get loaded when the nfnetlink_queue code gets 
initialized ...

# /sbin/lsmod
Module                     Size  Used by
nfnetlink_queue       7548  1
nfnetlink                   3760  2 nfnetlink_queue

Thanks
