From: Buddy wu <ejournal4me@gmail.com>
Subject: Re: why can't use connlimit ??
Date: Fri, 28 Oct 2005 15:51:51 +0800
Message-ID: <43a0cdcb0510280051u1fd2aabcv@mail.gmail.com>
References: <43a0cdcb0510272319m69a7a1d4g@mail.gmail.com>
	<64005.193.173.147.3.1130483580.squirrel@webmail.sterenborg.info>
	<43a0cdcb0510280027x6236afeco@mail.gmail.com>
	<50475.193.173.147.3.1130485511.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <50475.193.173.147.3.1130485511.squirrel@webmail.sterenborg.info>
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

2005/10/28, Rob Sterenborg <rob@sterenborg.info>:
> On Fri, October 28, 2005 09:27, Buddy wu wrote:
> > In the System It has libipt_connlimit.so file. but don't have
>
> In "the System" ? Where is that ?
  In /lib/iptables  the system is just a new installation. it is
centos4 and the same to redhat as4. When i install the system, I can
found it in /lib/iptables directory

>
> > ipt_connlimit.ko or .o file. Is this the reason why can't load the
> > connlimit module?
>
> The .ko is for 2.6 kernels. For 2.4 it should be .o.
ya, thanks . and can you tell me the diffrent with .so files?
>
> >      If it's the reason , then need I recombile the kernel?
> >      I have done so, but When I patch the kernel with the latest patch
> > of POM, and comblie the kernel. errors occured. Just like I have said

>
> - So, what kernel version are you using ?
> - What kernel did you try to patch ? If it's a distro kernel (like
> RedHat, etc), try a vanilla kernel from www.kernel.org.
kernel version is 2.6.10, and I download from www.kernel.org
use the POM-20050801 or 20051025. they have the same problem

> Other problems can arise if you use conflicting POM patches (some do
> not play nice when used together).
But I'm puzzled with the errors. it said that the object don't have
'proto' member(the conflicting POM patches can make out these errors?
I think the structure should be same ).
>
> Maybe this thread can be of help to you (if you use a 2.4 kernel) :
> https://lists.netfilter.org/pipermail/netfilter/2004-January/050227.html
>
>
> Gr,
> Rob
>
>
>

