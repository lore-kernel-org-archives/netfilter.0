From: Michael <jlpnetworx@gmail.com>
Subject: Re: masquerading won't flush conntrack cache
Date: Thu, 14 Oct 2004 17:13:43 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <661ba8be041014081326ebea75@mail.gmail.com>
References: <661ba8be04101406175160a81f@mail.gmail.com>
	<1097765447.7688.9.camel@moola.futuresource.com>
Reply-To: Michael <jlpnetworx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1097765447.7688.9.camel@moola.futuresource.com>
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
To: Les Mikesell <les@futuresource.com>, netfilter@lists.netfilter.org

My solution for the moment (which is not really a solution), is to
flush all iptable rules and unload all netfilter modules in ip-up,
when the interface goes up again with the new ip-address. However,
this also flushes all other rules, which were not affected by the
external interface (e.g. from eth0 to eth1 or so) and therefore all
state information is lost.

Michael.

On Thu, 14 Oct 2004 09:50:47 -0500, Les Mikesell <les@futuresource.com> wrote:
> On Thu, 2004-10-14 at 08:17, Michael Hecker wrote:
> 
> > However, when my line gets disconnected and reconnects again, the
> > entries in the cache are not flushed as expected. Now, the
> > masquerading of outbound traffic is done improperly. The outgoing
> > packets use the OLD IP-address, which was valid before the
> > disconnection of the dialup line and not the new one.
> 
> I see exactly the same effect with GRE packets that make it out
> the default masq'd interface before the correct route for them
> is established.  When the correct route comes up, the packets go
> there but continue to be source-NATed with the address of the
> incorrect masq-ing interface. It appears to be impossible to ever
> change a route after an ip_conntrack entry has been established, at
> least when NAT is involved.  Is there a better source for information
> about the ip_conntrack module than this list?
> 
> ---
>  Les Mikesell
>   les@futuresource.com
> 
>

