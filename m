From: "Simon Garner" <sgarner@expio.co.nz>
Subject: Re: a sort of n00b question here but I'ld like to know.
Date: Tue, 21 Oct 2003 14:08:12 +1300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <012901c39770$7d2f2980$0301a8c0@SIMON>
References: <20031021004101.65971.qmail@web40203.mail.yahoo.com>
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
To: SBlaze <dagent.geo@yahoo.com>, netfilter@lists.netfilter.org

On Tuesday, October 21, 2003 1:41 PM [GMT+1200=NZT],
SBlaze <dagent.geo@yahoo.com> wrote:

> That's really nice information. Thanks for sharing it with me.
> However, this still leaves the question I asked yet to be answered.
> Since it's not an "official" process(I knew that already)does it show
> up in the CPU usage statistics?
>
> ie
>
> root@nixn00b:~# uptime
>  20:32:26 up 11 days, 19:56,  4 users,  load average: 0.00, 0.00, 0.00
>

Have a look at the "system" CPU usage visible with 'top'. This should
show you how much CPU is being used by the kernel itself (which would
include netfilter). You can also see this with 'vmstat'.

I'm not sure if the load average would reflect this... load average is
supposedly a measure of how many processes were waiting in the run queue
over the last 1, 5 and 15 minutes. Whether "processes" includes the
kernel itself, I don't know (I'm inclined to think yes, though).

-Simon


