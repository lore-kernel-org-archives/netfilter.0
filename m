From: "dravya" <dravya@magma.ca>
Subject: Re: Has MASQUERADE been fixed???
Date: Tue, 21 Sep 2004 11:44:44 -0400 (EDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409211544.i8LFii3N016684@webmail1.magma.ca>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter mailing list <netfilter@lists.netfilter.org>


Thanks for the reply,

I have already looked at Rusty's patch, however it is for kernel 2.6.9(-rc1.bk12). Where
the ipt_MASQUERADE.c code is different and I don't understand the code in its entirety for
me to attempt to make changes. I was wondering if someone can translate that patch to a
kernel 2.6.5 patch. I posted a message on the netfilter-devel list but no reply from there
either.

again suggestions are welcome

thanks

dravya


On Sep 21, Jason Opperisano <opie@817west.com> wrote:
> 
> On Tue, 2004-09-21 at 11:11, dravya wrote:
> > Hi all,
> > 
> > I have just switched to Fedora Core 2 and thus kernel 2.6.5 and I still am witnessing the
> > change of ip address on my 2 ppp links. (ie. packets with the wrong src ip are going over
> > the links). 
> > 
> > I believe the netfilter core team is aware of this problem and is currently working on it.
> > I am working on it too. It would really help me if someone could narrow down the places in
> > the kernel code I should be analysing. Currently I am looking at ipt_MASQUERADE.c and
> > ip_nat_core.c . So far I have only put printouts to see where the problem might be. 
> > 
> > Any suggestion/comment/tips are greatly appreciated. I have posted a couple of messages
> > regarding this topic but I have received no reply. I believe my last post was on Sept 15
> > with no reply. 
> > 
> > Thank you very much
> > 
> > Dravya
> 
> did you try out rusty's patch for 2.6 at:
> 
> https://lists.netfilter.org/pipermail/netfilter-devel/2004-September/016708.html
> 
> i would also be surprised if there are developers that read this list
> that do not read -devel...
> 
> -j
> 
> -- 
> Jason Opperisano <opie@817west.com>
> 
> 
> 

