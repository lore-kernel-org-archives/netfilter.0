From: William Taylor <williamt@corp.sonic.net>
Subject: reading positions with the u32 module
Date: Thu, 24 Apr 2014 09:24:25 -0700
Message-ID: <53593AB9.6030706@corp.sonic.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I'm trying to find out if it's possible to read a value from a packet
and skip forward by that amount and start processing the packet from
that offset.
I tried something like this where 28&0xFF was the position where I
wanted to read my value from but couldn't seem to get it to work.

0>>22&0x3C@28&0xFF000000>>@0&0xDFDFDFDF=0x464F4F4F

For a little more context I'm trying to do this so I can block dns
requests that have random hostnames prepended to the domain. The idea being
I can generate a rule that matches the domain and it will work with
whatever hostname is attached to it.

Read 0x03 jump 3 bytes forward then start matching on 0x04666F6F6F0x03636F6D
www.fooo.com : 0x037777770x04666F6F6F0x03636F6D00


Is this possible?  Any help would be appreciated.


Thanks,
  William
