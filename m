From: "Paul Simpson" <pauljesimpson@hotmail.co.uk>
Subject: Appliying the time patch with pomng
Date: Tue, 17 Jan 2006 21:52:51 +0000
Message-ID: <BAY15-F603F2434F9795ABE50B51E01A0@phx.gbl>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I'm trying to limit the time my kids spend playing online games by blocking 
traffic at certain times of the day.

I've downloaded pomng and applied the patch, but when I try to re-compile my 
kernel, I get the following:-

#make
make[1]: `arch/i386/kernel/asm-offsets.s' is up to date.
  CHK     include/linux/compile.h
  CC      net/ipv4/netfilter/ipt_time.o
net/ipv4/netfilter/ipt_time.c: In function `match':
net/ipv4/netfilter/ipt_time.c:59: error: structure has no member named 
`tstamp'
net/ipv4/netfilter/ipt_time.c:60: warning: implicit declaration of function 
`__net_timestamp'
net/ipv4/netfilter/ipt_time.c:63: error: structure has no member named 
`tstamp'
net/ipv4/netfilter/ipt_time.c:63: error: structure has no member named 
`tstamp'
net/ipv4/netfilter/ipt_time.c:67: error: structure has no member named 
`tstamp'
make[3]: *** [net/ipv4/netfilter/ipt_time.o] Error 1
make[2]: *** [net/ipv4/netfilter] Error 2
make[1]: *** [net/ipv4] Error 2
make: *** [net] Error 2

I have been advised that I need a newer kernel, or an older pomng. Since I 
don't really want to upgrade the kernel if I can ovoid it, I was wondering 
if anyone could tell me which version of pomng I need?

Many thanks,

Paul Simpson

Linux-from-scratch 6.0
Kernel 2.6.8.1
patch-o-matic-ng-20060112
iptables 1.3.3

_________________________________________________________________
Are you using the latest version of MSN Messenger? Download MSN Messenger 
7.5 today! http://messenger.msn.co.uk


