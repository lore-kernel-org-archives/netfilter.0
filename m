From: Nicolas Martin <nico.martin@gmail.com>
Subject: Re: Problems to get TARPIT functionnality with iptables
Date: Thu, 14 Oct 2004 22:28:31 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <487eee5304101413284e973bbb@mail.gmail.com>
References: <487eee530410141305460b18ca@mail.gmail.com>
	<20041014201012.GA4310@bender.817west.com>
Reply-To: Nicolas Martin <nico.martin@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041014201012.GA4310@bender.817west.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

No I did not use ./runme pending first.
If I launch it, same things happen for all the patches except if I
force it says :
Applying patch submitted/01_2.4.19.patch...
Failed to patch copy of /usr/src/linux

It's really strange ... I thought that maybe the fact that
/usr/src/linux was a link to the real source directory could screw
this up but if I specify /usr/src/kernel-source-2.6.8, it does not
work any better ....


On Thu, 14 Oct 2004 16:10:12 -0400, Jason Opperisano <opie@817west.com> wrote:
> On Thu, Oct 14, 2004 at 10:05:17PM +0200, Nicolas Martin wrote:
> > Hello,
> >
> > I'm using Debian GNU/Linux and I'd like to get iptables working with
> > the tarpit function.
> > I have my 2.6.8 kernel in /usr/src/linux.
> > I've downloaded patch-o-matic with cvs as told in the netfilter
> > modification tutorial. It created me /usr/src/linux/netfilter and
> > /usr/src/linux/netfilter/patch-o-matic (no
> > /usr/src/linux/netfilter/userspace as told in the tutorial).
> >
> > After that I launch ./runme ./extra/ipt_TARPIT.patch and if I apply the patch :
> 
> did you "./runme pending" first?
> 
> -j
> 
> --
> Jason Opperisano <opie@817west.com>
> 
>

