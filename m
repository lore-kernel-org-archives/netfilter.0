From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Netfilter vs commercial
Date: Mon, 9 Aug 2004 16:56:04 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408091656.04699.Antony@Soft-Solutions.co.uk>
References: <20040809093022.5842e85e@mgalepc.utilitran.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040809093022.5842e85e@mgalepc.utilitran.com>
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
To: netfilter@lists.netfilter.org

On Monday 09 August 2004 4:30 pm, Michael Gale wrote:

> Hello,
>
> 	I know this question has most likely come up a few times and most people
> ask about performance and through put. But my question seems to me a little
> different.
>
> I would like to know how people on this list ... which I know might be a
> biased opinion feel how a Netfilter firewall box .. properly configured
> would compare in security to a commercial firewall.

My response to this is that netfilter has a better security record than most 
commercial firewalls, based on the number of patches, alerts or security 
updates announced for each.

> I do not want to compare performance or stats on through put but the
> strength of the firewall. The reason I am asking is to at the moment we are
> using Netfilter based firewalls which I have setup Squid and Frox and many
> other application level filters.

The other half of my response is that as soon as you start running any 
applications on the same machine as netfilter (and a proxy server definitely 
counts as an application), then you are immediately reducing the security of 
the entire system to that of the weakest component.   I would be willing to 
bet that netfilter is not going to be the weakest component.

If someone has the choice of breaking into your house through a steel front 
door with 5-lever locks and deadbolts, or else walking around the back and 
breaking the single-thickness glass on your kitchen door, the security of 
your front door is fairly irrelevant to the security of your house.

> Now some people in the company want to replace them with CheckPoints or
> WatchGuard firewalls. Which is fine ... security should be done in layers
> ... but the way I see it I will still need the linux boxes to run squid and
> frox

I believe those proxies should be running on separate machines from the main 
firewall anyway - because that does give you defence in depth, and multiple 
layers - whereas running several things on one machine gives you a very 
shallow depth, if you follow my meaning :)

Besides, if you are happy running netfilter on your Squid / Frox proxy, then 
by all means continue to do so, even with a dedicated Firewall in front of it 
as well (no matter whether that machine is running netfilter or Firewall-1).

> unless the appliance allows you to install software from other sources
> (most likely not) or use custom config files (like my own squid.conf --
> most likely not).

Often for the reasons given above - the vendors don't want you running unknown 
applications on their security servers, and possibly giving their machines a 
bad name when some software they don't know about has an exploit used against 
it.

Regards,

Antony.

-- 
Anything that improbable is effectively impossible.

 - Murray Gell-Mann, Nobel Prizewinner in Physics

                                                     Please reply to the list;
                                                           please don't CC me.


