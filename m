From: Vincent Lim <vincent.lim@nestac.com>
Subject: Re: How to  load these modules?
Date: Fri, 20 Dec 2002 15:32:49 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E02C7A1.1446C5B5@nestac.com>
References: <20021220032315.3B1701D110BCC@sm181.163.com>
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
To: bobo <boboaq@163.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>, "bobowd@sohu.com" <bobowd@sohu.com>

bobo wrote:
> 
>      Hello  all:
> 
>            While I am studying iptables,I read such contents from a tutorial as bellow:
> 
>   "the rc.firewall.txt neede the following options to be compiled to kernel or as modules..
> 
>   .CONFIG_PACKET
>   .CONFIG_NETFILTER
>   .CONFIG_IP_NF_CONNTRACK
> ..........
> 
>    I find some moudles of REDHAT 7.2 in /lib/modules/2.4.7-10/kernel/net/ipv4/netfilter,
>  but the modules'name are not the same as the above.  There are about 20 modules in the directory.
> 
>   Why?
> 
>   How could I do?   How could I get these modules?

I did a check on /usr/src/linux/net/ipv4/netfilter/Makefile and found
the following line:
obj-$(CONFIG_IP_NF_CONNTRACK) += ip_conntrack.o

This (I think) means that if "CONFIG...." is selected, then the module
that corresponds to this selection is ip_conntrack.o

then in /usr/src/linux/net/Makefile

subdir-$(CONFIG_NETFILTER)  += ipv4/netfilter

I think this meant that all modules in ipv4/netfilter would be needed
for that selection.

-- 
Vincent Lim
Software Engineer
NESTAC Solution Sdn Bhd
vincent.lim@nestac.com | +(6012) 659-6609

