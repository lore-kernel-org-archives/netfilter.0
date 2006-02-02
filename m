From: Adam Rosi-Kessel <adam@rosi-kessel.org>
Subject: Re: HTTP slower than SSH on client behind iptables
Date: Thu, 2 Feb 2006 09:56:13 -0500
Message-ID: <20060202145613.GA12056@bostoncoop.net>
References: <20060131033519.GA32564@bostoncoop.net>
	<43DF299D.9070105@prosyst.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <43DF299D.9070105@prosyst.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Jan 31, 2006 at 10:10:53AM +0100, Boryan Yotov wrote:
> >On clients behind the NAT box, however, HTTP connections seem to top out
> >around 70 kilobytes per second. ssh connections (e.g., rsync) get the
> >full throughput of the Internet connection.
> >As far as NAT goes, I don't hvae any special settings.
> >Can anyone think of an explanation for this behavior? It doesn't make any
> >sense to me.
> Are you sure, you don't have some kind of a traffic shaping
> active on the NAT gateway's internal interface?
> For example: If tc is used, you could check that using:
> tc class show dev <nat_box_internal_interface>
> and
> tc filter show dev <nat_box_internal_interface>

I figured it out. Apparently I was missing some kernel modules that were
causing wondershaper to behave oddly. I rebuilt the kernel with all QOS
and netfilter configuration options enabled (or built as modules) and now
internal clients can download HTTP at full speed. I suspect there was
some option that was causing tc to not distinguish between interfaces
despite the fact that wondershaper instructed it to only throttle the
external interface. I'm not sure exactly which kernel setting fixed it,
but it is now fixed.
-- 
Adam Rosi-Kessel
http://adam.rosi-kessel.org

