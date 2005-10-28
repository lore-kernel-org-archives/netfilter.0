From: Buddy wu <ejournal4me@gmail.com>
Subject: Re: why can't use connlimit ??
Date: Fri, 28 Oct 2005 15:27:57 +0800
Message-ID: <43a0cdcb0510280027x6236afeco@mail.gmail.com>
References: <43a0cdcb0510272319m69a7a1d4g@mail.gmail.com>
	<64005.193.173.147.3.1130483580.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <64005.193.173.147.3.1130483580.squirrel@webmail.sterenborg.info>
Content-Disposition: inline
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
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@lists.netfilter.org

In the System It has libipt_connlimit.so file. but don't have
ipt_connlimit.ko or .o file. Is this the reason why can't load the
connlimit module?
     If it's the reason , then need I recombile the kernel?
     I have done so, but When I patch the kernel with the latest patch
of POM, and comblie the kernel. errors occured. Just like I have said
-----------------------------------------------------------------
CC      net/ipv4/netfilter/ipt_connlimit.o
net/ipv4/netfilter/ipt_connlimit.c: In function `count_them':
net/ipv4/netfilter/ipt_connlimit.c:68: error: structure has no member
named `proto'
net/ipv4/netfilter/ipt_connlimit.c:94: error: structure has no member
named `infos'
net/ipv4/netfilter/ipt_connlimit.c:101: error: structure has no member
named `infos'
make[3]: *** [net/ipv4/netfilter/ipt_connlimit.o] Error 1
make[2]: *** [net/ipv4/netfilter] Error 2
make[1]: *** [net/ipv4] Error 2
make: *** [net] Error 2
----------------------------------------------------------
I don't know what's wrong with it . version conflict? or GCC version
not right? or other reason? I don't know why, can you help me?
thanks



2005/10/28, Rob Sterenborg <rob@sterenborg.info>:
> On Fri, October 28, 2005 08:19, Buddy wu wrote:
> >    I want to use connlimit to set the connections of each person to a
> > certain number, but when I add a rule using iptables, error occured
> > like these:
> >
> > [root@server1 linux]# /sbin/iptables -A INPUT -m connlimit
> > --connlimit-above 6 -j DROP
> > iptables: No chain/target/match by that name
> >
> >    I have searched for this problem, someone said it maybe need to
> > load the ipt_connlimit module. I tried it, but it can not work. I
> > doubted that I have the wrong command.
> >    first I use '/sbin/modprobe ipt_connlimit' command ,and then I
> > reaceive the error 'FATAL: Module ipt_connlimit not found.'
> >    second, I use '/sbin/modprobe /lib/iptables/libipt_connlimit.so'
> > and then error comes again 'FATAL: Module
> > /lib/iptables/libipt_connlimit.so not found.'
>
> Do you *have* ipt_connlimit ? (Try : "locate ipt_connlimit")
>
> Also, AFAIK such module would be in
> "/lib/modules/<kernel-version>/kernel/net/ipv4/netfilter".
>
>
> Gr,
> Rob
>
>
>
>

