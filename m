From: Jason Opperisano <opie@817west.com>
Subject: Re: nat and dns
Date: Fri, 24 Sep 2004 02:51:57 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096008716.9581.62.camel@wolfpack.ljm.dom>
References: <415290B1.5030401@imag.fr> <4152DADF.4090802@pbl.ca>
	<1095976931.5171.12.camel@mistified.sf.bgservice.lab>
	<1095990977.41537ec1b14b5@webmail2>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1095990977.41537ec1b14b5@webmail2>
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
To: netfilter@lists.netfilter.org

On Thu, 2004-09-23 at 21:56, Aleksandar Milivojevic wrote:
> Quoting Dimitar Katerinski <train@bofh.bg>
> Date: Fri, 24 Sep 2004 01:02:11
> 
> > Sorry, a little bit off topic, but I allways go red about such kind of crappy
> > rules:
> > 
> > > Use DNAT target.  In short what you need to do is:
> > > 
> > >    iptables -A FORWARD -m state --state NEW -j ACCEPT
> > 
> > Do you know what you just did? You've just allowed any kind of
> > connections, protocols to any port and from/to any destionation. Cute,
> > isn't it?
> 
> The above was an obvious typo that I made.  It should have read ESTABLISHED, not
> NEW, of course.  It kinda suprised me that it took so long before anybody noticed.

i regret not pointing out in my response that it was obvious to me that
this was a typo, and not any reflection on the poster in any way, shape,
or form.

> Maybe yes, maybe no.  The bottom line is that probability of somebody getting
> burned by not using tcp-flags (or simply syn) option is quite low.  But if
> that's going to make you so much happier person, I can start typing mile long
> examples instead of giving hints. 

precisely.  the rules that get posted here are to illustrate the point,
not our recommendations of what makes a perfect firewall.

i know as well as anyone that the easiest path is to lurk and wait for
typo to pounce upon.

-j

-- 
Jason Opperisano <opie@817west.com>


