From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Redirection to local lan, isn't DNAT method unsafe.
Date: Thu, 1 Apr 2004 23:52:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404012352.27203.Antony@Soft-Solutions.co.uk>
References: <40696C1A.5080400@personalsoft.com.br> <200404011055.45703.Antony@Soft-Solutions.co.uk> <200404011720.57604.Alistair Tonner <>>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <>
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

On Thursday 01 April 2004 11:20 pm, Alistair Tonner wrote:

> On April 1, 2004 04:55 am, Antony Stone wrote:
>
> > My expectation is that people "out on the Internet" cannot connect to
> > your private IPs (because the addresses are non-routable), therefore the
> > question doesn't arise for them.   People associated with your local
> > network (ie: inside your connection point to the Internet) surely aren't
> > a problem even if they do discover the real private IP address?   Or am I
> > missing something here about what you are trying to secure from whom?
>
> 	Actually I can see one other horrible possibility  --- an ISP with a \28
> net -- where the internal network of the ISP is by neccesity a non
> routeable address space, and is natted within the \28 netowork ... or where
> subscribers are all on non routeable addresses and primary connection
> services are on the \28 space....

Hm, I see what you're saying (and yes, there are a lot of ISPs who run 
networks like this), however I still think that if you're making the service 
available to people on a public IP address (NATted by your firewall to the 
real private address), then why are you particularly bothered about them 
accessing the same service, by its private address?

Okay, it's the way you wanted them to do it, but they can't do any more with 
it than they could by using the public IP.

?

Antony.

-- 
This is not a rehearsal.
This is Real Life.

                                                     Please reply to the list;
                                                           please don't CC me.


