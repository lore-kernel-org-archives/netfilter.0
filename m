From: Drag0n <dragon@atlantacon.org>
Subject: Re: ipt_TTL
Date: Fri, 20 Feb 2004 19:46:10 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1077324370.4252.3.camel@drag0n.the-weyr.local>
References: <200402210014.46664.lazcorp@mail.bg>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200402210014.46664.lazcorp@mail.bg>
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
To: netfilter@lists.netfilter.org

	On Slackware 9.0 and 9.1 you need to make sure you are booting from the
newly compiled kernel. As of 9.0 Patrick moved the default kernel
location to /boot/vmlinuz, but the standard make bzlilo comand still
moves the new kernel to /vmlinuz. I normally get around that by removing
the /boot in lilo.conf. 
	

Drag0n
dragon#atlantacon.org 

On Fri, 2004-02-20 at 19:14, LazCorp wrote:
> Hi,
> i'm using slackware 9.1
> I'ts have sommting different betwen slackware 9.1 and other Unix/Linux  
> operation systems?
> I try to install patch-o-matick with new kernel (2.4.22 - original of slack9.1 
> CD's) 
> patch-o-matic-20031219.tar.bz2
> ./runme --batch base/TTL
> everything across fine..
> after that i compile the kernel..reboot END..
> $iptables -t mangle -A PREROUTING -i eth0 -j TTL --ttl-set 64
> iptables: No chain/target/match by that name
> :(
> 
> $locate TTL
> /usr/lib/iptables/libipt_TTL.so
> /usr/src/linux-2.4.22/net/ipv4/netfilter/ipt_TTL.c
> /usr/src/linux-2.4.22/net/ipv4/netfilter/ipt_TTL.o
> /usr/src/linux-2.4.22/net/ipv4/netfilter/.ipt_TTL.o.flags
> /usr/src/linux-2.4.22/include/linux/netfilter_ipv4/ipt_TTL.h
> /usr/local/lib/iptables/libipt_TTL.so
> 
> any idea?
> and sorry for my bad english..
> 
> 
> 
> 


