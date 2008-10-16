From: Richard Barry <richard@multenet.com>
Subject: iptables install
Date: Thu, 16 Oct 2008 16:11:41 +0200
Message-ID: <48F74B9D.10907@multenet.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I'm trying to build iptables-1.4.2 for a 2.6 kernel running on an
embedded ARM device (up to now I've used 1.2.11 on a 2.4 kernel).  To
build and install, I run:

#./configure --host=arm --enable-static KERNEL_DIR=$KERNEL_SOURCE
prefix=$BUILD_DIR CC=arm-9tdmi-linux-gnu-gcc LD=arm-9tdmi-linux-gnu-ld
AR=arm-9tdmi-linux-gnu-ar

#make KERNEL_DIR=$KERNEL_SOURCE prefix= CC=arm-9tdmi-linux-gnu-gcc
LD=arm-9tdmi-linux-gnu-ld AR=arm-9tdmi-linux-gnu-ar

#make KERNEL_DIR=$KERNEL_SOURCE prefix=$BUILD_DIR
CC=arm-9tdmi-linux-gnu-gcc LD=arm-9tdmi-linux-gnu-ld
AR=arm-9tdmi-linux-gnu-ar install

In $BUILD_DIR/sbin , I then see "iptables-static".  Is that the binary I
should run? Or put another way, should I rename "iptables-static" to
"iptables" to use the same scripts and apps that expect a binary called
"iptables"?  Why doesn't "make install" name it iptables?  Or am I doing
something wrong on the install side?

When I do rename it to "iptables", and I run iptables on the device, the
output looks like it's still trying to load modules from somewhere, even
though I used the --enable-static option when running configure.  The
output:

--------Output start

modprobe: could not parse modules.dep
modprobe: could not parse modules.dep
modprobe: could not parse modules.dep
modprobe: could not parse modules.dep
modprobe: could not parse modules.dep
modprobe: could not parse modules.dep
modprobe: could not parse modules.dep
modprobe: could not parse modules.dep
modprobe: could not parse modules.dep
modprobe: could not parse modules.dep
modprobe: could not parse modules.dep
modprobe: could not parse modules.dep
modprobe: could not parse modules.dep
modprobe: could not parse modules.dep
modprobe: could not parse modules.dep
modprobe: could not parse modules.dep
modprobe: could not parse modules.dep
modprobe: could not parse modules.dep
modprobe: could not parse modules.dep
modprobe: could not parse modules.dep
modprobe: could not parse modules.dep
modprobe: could not parse modules.dep
modprobe: could not parse modules.dep
modprobe: could not parse modules.dep
modprobe: could not parse modules.dep
modprobe: could not parse modules.dep
modprobe: could not parse modules.dep
modprobe: could not parse modules.dep
Chain INPUT (policy ACCEPT)
target     prot opt source               destination
REJECT     udp  --  anywhere             anywhere            udp
dpt:domain reject-with icmp-host-prohibited

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

------------ Output end

What modules could it be attempting to load?  Or should I disregard it and assume it's working? (It 
looks like it works after a few simple tests)

Regards,
Richard Barry


-- 
Richard Barry
Software Engineer

Multenet Technologies (Pty) Ltd.
P O Box 7155, Stellenbosch, 7599.
The Vineyard Centre, Adam Tas Road,
Stellenbosch, 7600.
Tel: +27 21 882 8811
Fax: +27 21 882 8825
e-mail: richard@multenet.com
website: www.multenet.com
