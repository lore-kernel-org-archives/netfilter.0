From: Saravanan Chanemouganandam <schane@osmozis.com>
Subject: iptables - Couldn't load target error
Date: Wed, 19 Dec 2007 12:21:56 +0100
Message-ID: <200712191221.58597.schane@osmozis.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org
Cc: busybox@busybox.net, linux-arm@lists.arm.linux.org.uk

Hi all,

I have some problem with iptables (v1.3.8) and extension supports libraries 
installed to the buildroot's root filesystem (/lib/iptables) running on 
Xscale pxa270. 

iptables with MASQUERADE support throws Couldn't load target error. The 
following strace shows that it tries to open libraries in the /lib and in 
the /usr/lib instead of /lib/iptables.

Can anybody precise me, why it is not looking into /lib/iptables for the 
dynamic libraries?

#strace iptables -t nat -A POSTROUTING -o br_wan -j MASQUERADE shows 
....

open("/home/sara/BuildRoot/buildroot/project_build_arm/uclibc/root/lib/iptables/libipt_MASQUERADE.so",)
open("/lib/libipt_MASQUERADE.so", O_RDONLY) = -1 ENOENT (No such file or 
directory)
open("/lib/libipt_MASQUERADE.so", O_RDONLY) = -1 ENOENT (No such file or 
directory)
open("/usr/lib/libipt_MASQUERADE.so", O_RDONLY) = -1 ENOENT (No such file or 
directory)
munmap(0x40006000, 698)                 = 0
write(2, "iptables", 8iptables)                 = 8
write(2, " v", 2 v)                       = 2
write(2, "1.3.8", 51.3.8)                    = 5
write(2, ": ", 2: )                       = 2
write(2, "Couldn\'t load target `", 22Couldn't load target `) = 22
write(2, "MASQUERADE", 10MASQUERADE)              = 10
write(2, "\':", 2':)                      = 2
write(2, "File not found", 14File not found)          = 14

thanks
Sara
