From: Jason Opperisano <opie@817west.com>
Subject: Re: Problems to get TARPIT functionnality with iptables
Date: Thu, 14 Oct 2004 16:10:12 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041014201012.GA4310@bender.817west.com>
References: <487eee530410141305460b18ca@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <487eee530410141305460b18ca@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

On Thu, Oct 14, 2004 at 10:05:17PM +0200, Nicolas Martin wrote:
> Hello,
> 
> I'm using Debian GNU/Linux and I'd like to get iptables working with
> the tarpit function.
> I have my 2.6.8 kernel in /usr/src/linux.
> I've downloaded patch-o-matic with cvs as told in the netfilter
> modification tutorial. It created me /usr/src/linux/netfilter and
> /usr/src/linux/netfilter/patch-o-matic (no
> /usr/src/linux/netfilter/userspace as told in the tutorial).
> 
> After that I launch ./runme ./extra/ipt_TARPIT.patch and if I apply the patch :

did you "./runme pending" first?

-j

-- 
Jason Opperisano <opie@817west.com>

