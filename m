From: "Rosario Pingaro" <rpingar@italycom.it>
Subject: Re: compilation problem rhat el4
Date: Sat, 13 Aug 2005 14:47:19 -0400
Message-ID: <002e01c5a037$6edb2bf0$0401a8c0@casa>
References: <001601c5a028$5c89d500$23d8b2d5@iserver1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

when I run "make KERNEL_DIR=/usr/src/linux" it gets the right extensions:
Extensions found: IPv4:CLUSTERIP IPv4:layer7 IPv4:recent IPv6:ah IPv6:esp 
IPv6:f
rag IPv6:ipv6header IPv6:hbh IPv6:dst IPv6:rt

when I run "make KERNEL_DIR=/usr" it gets only IPv4:recent

I think for this reason I don't have layer7's module compiled.

I need help, step by step on how to fix the "error including kernel header 
in userspace; use the glibc headers instead! make"

Hope some one can help.
Thanks
Rosario


----- Original Message ----- 
From: "Rosario Pingaro" <rpingar@italycom.it>
To: <netfilter@lists.netfilter.org>
Sent: Saturday, August 13, 2005 12:59 PM
Subject: compilation problem rhat el4


I would like to have the l7-filter funtionality on my redhat el4.

So I downloada the latest iptable-1.3.3 and the last patch from l7-filter

But trying to compile the patched files I get this error:
#error including kernel header in userspace; use the glibc headers instead! 
make: *** [extensions/libipt_layer7_sh.o] Error 1

I found several posts about it without any useful solution.
In fact if I use "KERNEL_DIR=/usr" I get the header from userspace so 
everything is compiled but not the layer7 module "libipt_layer7.so".

I checked if everything into the kernel (about packet filtering and layer7) 
is activated, and there, everythings seems fine.

Just to note that "libipt_layer7.h" is not present on my system.

Where is my problem?

Thanks
Rosario



