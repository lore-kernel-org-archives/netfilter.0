From: "hare ram" <hareram@sol.net.in>
Subject: Re: where is ipt_layer.h
Date: Tue, 3 Feb 2004 12:09:11 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <029301c3ea20$6ed965a0$c2bf09ca@huecal>
References: <012101c3e992$0a5d75a0$c2bf09ca@huecal> <Pine.LNX.4.60.0402020809060.3769@dsl093-017-216.msp1.dsl.speakeasy.net> <014d01c3e998$49b056e0$c2bf09ca@huecal> <Pine.LNX.4.60.0402020844140.3769@dsl093-017-216.msp1.dsl.speakeasy.net>
Reply-To: "hare ram" <hareram@sol.net.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Matthew Strait <quadong@users.sourceforge.net>
Cc: lartc@mailman.ds9a.nl, netfilter@lists.samba.org, l7-filter-developers@lists.sf.net

Hi Mathew

I was not understand

is that what you saying

I need to use any one of the Patch


iptables-1.2.9-layer7-0.4.1.patch

This above patch for Marking the Packets with Iptables right ?

layer7-kernel2.4patch-qos-0.4.1b

this Patch is for TC to work with layer 7 aplication

so what did iam doing wrong

ok take example, i re did my setup like below

extract new kernel
extract iptables source
extract pom
i have just patched only iptables with layer7 patch
(iptables-1.2.9-layer7-0.4.1.patch)
then i patched kernel with POM

make mrproper
make menuconfig
------  here iam not able to see that optiond what mentioned in the docs
("Layer 7 match support" and "Child Level match support". )
make dep
make bzImage
make modules
make modules_install
make install

rebooted with new kernel

iam not able to mark pacjets using iptables
iam getting the following error

 iptables -t mangle -A POSTROUTING -m layer7 --l7proto http -j
 MARK --set-mark 1
iptables v1.2.9: Couldn't load match
layer7':/usr/local/lib/iptables/libipt_layer7.so: cannot open shared object
file: No such file or directory


when i try to compile manually, iam geeting the ipt_layer7.h not found.


cc -O2 -Wall -Wunused -I/usr/src/linux-2.4.22-1.2115.nptl/include -Iinclude/
 -DIPTABLES_VERSION=\"1.2.9\"  -fPIC -o extensions/libipt_layer7_sh.o -c
extensions/libipt_layer7.c


extensions/libipt_layer7.c:21:45: linux/netfilter_ipv4/ipt_layer7.h: No such
file or directory
extensions/libipt_layer7.c:52: warning: `struct ipt_layer7_info' declared
inside parameter list
extensions/libipt_layer7.c:52: warning: its scope is only this definition or
declaration, which is probably not what you want
extensions/libipt_layer7.c: In function `parse_protocol_file':
extensions/libipt_layer7.c:84: error: `MAX_PROTOCOL_LEN' undeclared (first
use in this function)



any suggestion or any proceedure iam doing
correct me give me the right proceedure

hare

----- Original Message ----- 
From: "Matthew Strait" <quadong@users.sourceforge.net>
To: "hare ram" <hareram@sol.net.in>
Cc: <lartc@mailman.ds9a.nl>; <netfilter@lists.samba.org>;
<l7-filter-developers@lists.sf.net>
Sent: Monday, February 02, 2004 8:17 PM
Subject: Re: where is ipt_layer.h


> > i am using the following things
> >
> > iptables-1.2.9-layer7-0.4.1.patch
> > layer7-kernel2.4patch-qos-0.4.1b
>
> You are using the QoS version of the kernel patch and the Netfilter
> (iptables) version of the userspace patch.  You need to either use QoS
> with iproute2 or Netfilter with iptables.
>
> -matthew
>
>


