From: Ryan Pagquil <ryan_pagquil@axisglobal.com>
Subject: Re: where can i find libipt_ipv4options.so?
Date: Thu, 15 Jul 2004 06:32:55 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1089873174.8703.9.camel@mis1>
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

fabrice,

i found it in rpm.pbone.net
http://rpm.pbone.net/index.php3/stat/4/idpl/1296500/com/iptables-1.2.9-1ark.i586.rpm.html ArkLinux is the distribution.

i already patch ipv4options but it still prompts me that
libipt_ipv4options can't be found. what will i do? i also recompiled my
kernel and i boot it up.

please help,


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
Ryan Pagquil
Jr. Network Engineer
Axis Global Technologies, Inc.
Tel. 724-3340 loc. 175


