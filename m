From: Les Mikesell <les@futuresource.com>
Subject: Re: Need help with basic understanding of IPtables
Date: Mon, 25 Oct 2004 17:14:58 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1098742498.18510.8.camel@moola.futuresource.com>
References: <s17d10cf.018@hpsk12.net>
	<20041025193800.GA24645@bender.817west.com>
	<33D73F71797CC09A67671396@[10.169.6.246]>
	<20041025200130.GS29776@der-frank.org>
	<7513F20F705FE54833EA4134@[10.169.6.246]>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7513F20F705FE54833EA4134@[10.169.6.246]>
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
To: Kenneth Porter <shiva@sewingwitch.com>
Cc: netfilter@lists.netfilter.org

On Mon, 2004-10-25 at 16:23, Kenneth Porter wrote:

> > IP numbers belong to the IP stack and have nothing to do with
> > interfaces.  This idea is completely useless, forget it, this will make
> > things (eg. routing) a lot more understandable.  From this point of
> > view, Jasons posting is IMHO very clear.
> 
> I only point it out because not everyone knows that there's a difference, 
> and may think that the non-NIC interfaces are immune. I remember setting up 
> my first ipchains firewall and thinking it odd that I needed explicit rules 
> for the loopback interface, but it makes perfect sense in hindsight.

The part that I think is weird is that NAT may be tied to an interface
when first applied, but even if routes are changed so that packets
to a particular address no longer go through that interface, any
that have an entry in the ip_conntrack table continue to have
the NAT applied.  Is this intentional?

---
  Les Mikesell
   les@futuresource.com




