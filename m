From: "Manfred Stock" <manfred.stock@gmail.com>
Subject: Re: Controlling an iptables-match from userspace
Date: Tue, 30 May 2006 09:36:53 +0200
Message-ID: <815d745e0605300036w271c0491k7b9a3d2bd2b28627@mail.gmail.com>
References: <815d745e0605230442x24c596a2w6e97b7fb83dfeba@mail.gmail.com>
	<200605260000.56259.max@nucleus.it>
	<815d745e0605281119g1ab45281h80f080b760399469@mail.gmail.com>
	<200605290136.34804.max@nucleus.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200605290136.34804.max@nucleus.it>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

On 5/29/06, Massimiliano Hofer <max@nucleus.it> wrote:
> On Sunday 28 May 2006 8:19 pm, Manfred Stock wrote:
> > Definitely. Adding a new setsockopt option as mentioned in the Howto
> > would be another possibility, but it at least feels a little weird if
> > you can create a socket, set a special option on it and as a result
> > you have influenced the behaviour of netfilter... Nevertheless it's
> > fairly easy to use on the kernel side. Probably netlink/nfnetlink
> > would be another (not file based) alternative.
>
> Feasible, but I wouldn't like to implement it this way.
> If you find a compelling reason not to go for the current multiple files
> approach I can create a single file that receives batches of commands.
> The only reason this would be necessary would be in order to have transations
> of multiple simultaneous changes, but I think we would be solving the wrong
> problem.

Other than that, I currently don't see a reason to do it with one
file. To some degree such a transaction is already possible as one
could define the same condition in several rules - probably not that
flexible, but possible. Having several files is imho also easier to
use from user space, as one does not need to parse them for writing to
the right place.


> > netfilter match. But after a short look at
> > Documentation/filesystems/configfs/configfs.txt I would say that
> > configfs was intended for this kind of stuff. As for /proc, I don't
> > really know what to say, but my feelings are that it should rather not
> > be used for new non process related things - they have duplicated some
>
> Many people think that /proc is in a sorry state. The current trend is not to
> accept patches that use /proc for anything new that is not process related.
> I'm still using /proc in order to maintain backward compatibility, but I was
> already considering a transition to /config. Another thing holding me back
> was the lack of other modules already using it. There is no accepted naming
> convention and I wouldn't like to keep moving my files.
>
> Anyway I'll soon release a new version of condition that uses configfs.
>
> I'll put the directory name to popular vote:
> - /config/xt_condition (this seem the preferred one by the configfs
> documentation);
> - /config/netfilter/xt_condition (this would be more clear if other netfilter
> modules ever wanted to use configfs);
> - ... (fill in the blanks);

Maybe one could do it similar to /sys, which would imho result in
something like /config/net/netfilter/matches/xt_condition/.
Personally, I would prefer the first variant (/config/<modulename>).
The problem might be that if others really start using configfs,
/config could become quite cluttered. But as most of the modules
loaded on e.g. my system are device drivers, which imho will/should
rather use /sys for most of their configuration, this probably won't
happen.

Best regards
Manfred

