From: Ryan Pagquil <ryan_pagquil@axisglobal.com>
Subject: Re: where can i find libipt_ipv4options.so?
Date: Thu, 15 Jul 2004 08:19:33 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1089879573.8703.18.camel@mis1>
References: <1089710409.3044.224.camel@mis1>
	 <200407141407.44978.fabrice@netfilter.org> <1089793795.3044.245.camel@mis1>
	 <200407151332.58949.fabrice@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407151332.58949.fabrice@netfilter.org>
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
To: fabrice@netfilter.org
Cc: netfilter@lists.netfilter.org

Fabrice,
	when i about to install the new iptables there are some errors appeared
so my setup has been terminated, here was the very last error it
prompted me:

/usr/src/linux-2.6.5-1.358/include/linux/config.h:6:2 #error including
kernel header in userspace; use the glibc headers instead!
make: *** [extension/libipt_ah_sh.o] Error 1

what seems to be the problem here with my installation? currently i'm
running iptables-1.2.9-2.3.1 in Fedora Core2.

please help, thanks!


On Thu, 2004-07-15 at 05:32, Fabrice MARIE wrote:
> Hello,
> 
> On 14 July 2004 pm 16:29, Ryan Pagquil wrote:
> > fabrice,
> > 	i'm new in patching iptables, would you mind if you give me some
> > instructions done by you, so that i can based my procedure with the one
> > you have done? 
> 
> This should help:
> http://www.netfilter.org/documentation/HOWTO/netfilter-extensions-HOWTO.html
> 
> > why does some package of iptables in other distributions includes
> > libipt_ipv4options.so? just curious....
> 
> Which distribution ships with ipv4options already patched in ? I haven't seen
> any distro doing that yet... just curious ... which distro are we talking about ?
> 
> Have a nice day,
> 
> Fabrice.
> --
> Fabrice MARIE
> 
> "Silly hacker, root is for administrators"
>        -Unknown
-- 
Ryan


