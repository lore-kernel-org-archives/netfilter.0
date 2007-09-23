From: Gerry Reno <greno@verizon.net>
Subject: Re: fwknop: use with Fedora?
Date: Sun, 23 Sep 2007 09:28:49 -0400
Message-ID: <46F66A11.5000901@verizon.net>
References: <46F5B7F8.2060502@verizon.net> <46F5C161.7090908@verizon.net>
 <46F5CF0C.3060004@verizon.net> <20070923043058.GA2940@minastirith>
 <46F65D0E.6050005@verizon.net> <46F65EBE.30502@verizon.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <46F65EBE.30502@verizon.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Ok, I used the regular SRC RPM because my RPM BUILD ROOT and .rpmmacros 
is different.

The RPMS built ok except for this problem:

+ /usr/lib/rpm/redhat/brp-strip-comment-note /usr/bin/strip /usr/bin/objdump
/usr/bin/strip: unable to copy file 
'/home/greno/redhat/tmp/fwknop-buildroot/usr/lib/fwknop/i386-linux-thread-multi/auto/Unix/Syslog/Syslog.so' 
reason: Permission denied
/usr/bin/strip: unable to copy file 
'/home/greno/redhat/tmp/fwknop-buildroot/usr/sbin/knopmd' reason: 
Permission denied
/usr/bin/strip: unable to copy file 
'/home/greno/redhat/tmp/fwknop-buildroot/usr/sbin/knopwatchd' reason: 
Permission denied

Where is it trying to copy the files?

So I don't know whether this affects the validity of the RPMS but I'm 
going to install them and see what happens.

Gerry

