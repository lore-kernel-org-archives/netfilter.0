From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: a sort of n00b question here but I'ld like to know.
Date: Mon, 20 Oct 2003 18:24:23 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031021012423.84839.qmail@web40210.mail.yahoo.com>
References: <012901c39770$7d2f2980$0301a8c0@SIMON>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <012901c39770$7d2f2980$0301a8c0@SIMON>
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
Content-Transfer-Encoding: 7bit
To: Simon Garner <sgarner@expio.co.nz>, netfilter@lists.netfilter.org


--- Simon Garner <sgarner@expio.co.nz> wrote:
> On Tuesday, October 21, 2003 1:41 PM [GMT+1200=NZT],
> SBlaze <dagent.geo@yahoo.com> wrote:
> 
> > That's really nice information. Thanks for sharing it with me.
> > However, this still leaves the question I asked yet to be answered.
> > Since it's not an "official" process(I knew that already)does it show
> > up in the CPU usage statistics?
> >
> > ie
> >
> > root@nixn00b:~# uptime
> >  20:32:26 up 11 days, 19:56,  4 users,  load average: 0.00, 0.00, 0.00
> >
> 
> Have a look at the "system" CPU usage visible with 'top'. This should
> show you how much CPU is being used by the kernel itself (which would
> include netfilter). You can also see this with 'vmstat'.
> 
> I'm not sure if the load average would reflect this... load average is
> supposedly a measure of how many processes were waiting in the run queue
> over the last 1, 5 and 15 minutes. Whether "processes" includes the
> kernel itself, I don't know (I'm inclined to think yes, though).
> 
> -Simon
> 
Ok I did that(with top) My CPU usage for both procs is relativly low. They both
tend to idle with other visable processes at 96-100% idle.

root@nixn00b:~# vmstat
procs -----------memory---------- ---swap-- -----io---- --system-- ----cpu----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in    cs us sy id wa
 0  0  27464   5848  22848  44388    0    0     1     2   11     8  0  1 99  0

this looks pretty greek to me...but I was able to make some sence out of it
with  the man page..but still looks fairly normal...

So I guess this still pretty much remains a mystery?

Anyone out there got a clue on this????

=====
In the absence of order there will be chaos.

__________________________________
Do you Yahoo!?
The New Yahoo! Shopping - with improved product search
http://shopping.yahoo.com

