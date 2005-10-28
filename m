From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: why can't use connlimit ??
Date: Fri, 28 Oct 2005 09:45:11 +0200 (CEST)
Message-ID: <50475.193.173.147.3.1130485511.squirrel@webmail.sterenborg.info>
References: <43a0cdcb0510272319m69a7a1d4g@mail.gmail.com>
	<64005.193.173.147.3.1130483580.squirrel@webmail.sterenborg.info>
	<43a0cdcb0510280027x6236afeco@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43a0cdcb0510280027x6236afeco@mail.gmail.com>
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
To: Buddy wu <ejournal4me@gmail.com>
Cc: netfilter@lists.netfilter.org

On Fri, October 28, 2005 09:27, Buddy wu wrote:
> In the System It has libipt_connlimit.so file. but don't have

In "the System" ? Where is that ?

> ipt_connlimit.ko or .o file. Is this the reason why can't load the
> connlimit module?

The .ko is for 2.6 kernels. For 2.4 it should be .o.

>      If it's the reason , then need I recombile the kernel?
>      I have done so, but When I patch the kernel with the latest patch
> of POM, and comblie the kernel. errors occured. Just like I have said
> -----------------------------------------------------------------
> CC      net/ipv4/netfilter/ipt_connlimit.o
> net/ipv4/netfilter/ipt_connlimit.c: In function `count_them':
> net/ipv4/netfilter/ipt_connlimit.c:68: error: structure has no member
> named `proto'
> net/ipv4/netfilter/ipt_connlimit.c:94: error: structure has no member
> named `infos'
> net/ipv4/netfilter/ipt_connlimit.c:101: error: structure has no member
> named `infos'
> make[3]: *** [net/ipv4/netfilter/ipt_connlimit.o] Error 1
> make[2]: *** [net/ipv4/netfilter] Error 2
> make[1]: *** [net/ipv4] Error 2
> make: *** [net] Error 2
> ----------------------------------------------------------
> I don't know what's wrong with it . version conflict? or GCC version
> not right? or other reason? I don't know why, can you help me?
> thanks

- So, what kernel version are you using ?
- What kernel did you try to patch ? If it's a distro kernel (like
RedHat, etc), try a vanilla kernel from www.kernel.org.
Other problems can arise if you use conflicting POM patches (some do
not play nice when used together).

Maybe this thread can be of help to you (if you use a 2.4 kernel) :
https://lists.netfilter.org/pipermail/netfilter/2004-January/050227.html


Gr,
Rob



