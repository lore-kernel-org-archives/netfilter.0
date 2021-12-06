From: Eric Garver <eric@garver.life>
Subject: Re: delete matching rule like it can be done in case of iptables
Date: Mon, 6 Dec 2021 13:07:11 -0500
Message-ID: <Ya5RTzWTobgCWs0O@egarver.remote.csb>
References: <5e5887f6-69f4-7aca-175c-d4b6faf90eb1@gmail.com>
 <Ya4L/rS/mCwzqt25@salvia>
 <af021a3d-b4d4-28d4-df66-12a16f7977f2@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <af021a3d-b4d4-28d4-df66-12a16f7977f2@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amish <anon.amish@gmail.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org

On Mon, Dec 06, 2021 at 07:00:47PM +0530, Amish wrote:
> On 06/12/21 18:41, Pablo Neira Ayuso wrote:
> > On Sun, Dec 05, 2021 at 05:25:29PM +0530, Amish wrote:
> > > Hello,
> > > 
> > > nftables wiki [1] mentions this:
> > > 
> > > > Note: There are plans to support rule deletion by passing:
> > > > % nft delete rule filter output ip saddr 192.168.1.1 counter
> > > Any idea when will this happen? Because I thought it was very important
> > > feature. (unless I missed an alternate way to do it)
> > > 
> > > I want to migrate from iptables to nftables (from many years) but deleting a
> > > rule via script is not as easy as in case of iptables.
> > > 
> > > Obtaining the handle first and then deleting it is difficult
> > > programmatically.
> > You can use --echo and --handle options to fetch the rule handle.
> > 
> >   # nft -e -a  add rule x y counter
> >   add rule ip x y counter packets 0 bytes 0 # handle 3
> >   # new generation 5 by process 91190 (nft)
> 
> Well then I need to keep recording each rule addition somewhere so that I
> can delete by handle in future.
> 
> Some rules are added manually, some added by scripts. Scripts may want to
> remove manually added rule.
> 
> So its not as easy like in iptables.
> 
> I guess nftables will never get that feature then :(

Maybe you can use a comment to set your own identifier. At delete time
you would have to grep the ruleset (--handle) listing for your comment
then parse the handle.

In the past we've talked about a user cookie/identifier, but it never
got implemented.

firewalld solves it by maintaining a cache of created rules and the
handle they were created with (--echo --handle).

