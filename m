From: Don Tucker <dtucker@arlut.utexas.edu>
Subject: iptables can't initialize iptables table `filter': Bad file descriptor
Date: Fri, 21 Jan 2011 13:38:45 -0600
Message-ID: <4D39E0C5.5090704@arlut.utexas.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I am running a 2.6.21 kernel on an ARM architecture with iptables 
version 1.3.6. Iptables support is compiled into the kernel as modules:

ts7000:~# lsmod | grep iptable
iptable_filter 2368 0
ip_tables 10952 1 iptable_filter

When I try to use iptables I get an error:

ts7000:~# iptables -L
iptables v1.3.6: can't initialize iptables table `filter': Bad file
descriptor
Perhaps iptables or your kernel needs to be upgraded.

This is the first time I have used iptables. Is there something else 
that needs to be done before I can run the above command?

I am constrained to use the kernel (although I can reconfigure it and 
rebuild it), as it was custom-configured for my platform, but I tried to 
manually build and install version 1.4.9.1 of iptables and received the 
same error. I also read that the "Bad file descriptor" error can 
sometimes mean file system corruption, so I ran fsck on the file system 
and it is clean.

If anyone can suggest things to try to resolve this problem, I'd be very 
grateful.

Thanks,
Don
