From: Steve Wilson <netfilter@credulous.org>
Subject: Trouble compiling libipt_time.so on iptables 1.3.7 with 2.6.19.2
	kernel
Date: Fri, 02 Feb 2007 17:15:03 +0000
Message-ID: <1170436503.25117.20.camel@clarkew.steve-eddy.net>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello, I must be doing something wrong, but for the life of me cannot
work out what !!

I am trying to use '-m time' in my iptables config, I have never used it
before and thought that as a first step I would upgrade to the latest an
greatest kernel and also iptables source. 

I pulled iptables 1.3.7 and patch-o-matic-mg from subversion, and with
my new kernel all I have basic iptables working, however when I use the
following :-

./runme --download --kernel-path /usr/src/linux
--iptables-path /usr/local/src/netfilter/iptables/ external

to patch Kernel and iptables with code for time, the kernel compiles
fine and I have a module 'ipt_time.ko'. However when I recompile
iptables I do not get a corresponding 'libipt_time.so' created, indeed
when I do 'make' I get the following output :-

 Extensions found: IPv4:CLUSTERIP IPv4:connbytes IPv4:dccp IPv4:quota
IPv4:recent IPv4:statistic IPv4:string IPv6:ah IPv6:esp IPv6:frag
IPv6:ipv6header IPv6:REJECT IPv6:rt IPv6:sctp

Any ideas would be welcome, I have been banging my head against this all
day !!

Thanks


Steve Wilson


