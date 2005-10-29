From: Buddy wu <ejournal4me@gmail.com>
Subject: Re: why can't use connlimit ??
Date: Sat, 29 Oct 2005 12:00:10 +0800
Message-ID: <43a0cdcb0510282100q5473c6eav@mail.gmail.com>
References: <43a0cdcb0510272319m69a7a1d4g@mail.gmail.com>
	<43a0cdcb0510280051u1fd2aabcv@mail.gmail.com>
	<50262.193.173.147.3.1130490146.squirrel@webmail.sterenborg.info>
	<200510281133.14216.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200510281133.14216.rob0@gmx.co.uk>
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
To: /dev/rob0 <rob0@gmx.co.uk>
Cc: netfilter@lists.netfilter.org

2005/10/29, /dev/rob0 <rob0@gmx.co.uk>:
> On Friday 2005-October-28 04:02, Rob Sterenborg wrote:
> > I also find it strange that you do have a .so, but not a .ko file.
>
> The .so is iptables(8)'s library (SO=3D"shared object). The .ko is a
> kernel 2.6.x kernel module. Never having compiled iptables myself, I
> don't know for certain, but it seems that the iptables libraries are
> independent of the netfilter drivers. One could probably compile a
> fully-functional[1] iptables on a system with CONFIG_NETFILTER=3Dn ...
> the only requirement being access to appropriate kernel sources.
>
do you mean iptalbes can work without netfilter? or I can use
connlimit function just only with a libipt_connlimit.so file? then how
to do it. I try to use modprobe to load the library, but it said to me
that no such module could be found. to load a .so fromat module need a
diffrent way?
>
> [1] Fully-functional only under a kernel with CONFIG_NETFILTER=3Dy, of
> course.
> --
>     mail to this address is discarded unless "/dev/rob0"
>     or "not-spam" is in Subject: header
>
>

