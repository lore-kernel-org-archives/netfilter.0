From: Mark Moseley <moseleymark@gmail.com>
Subject: Re: use of the limiting options
Date: Tue, 25 Jan 2005 12:17:22 -0800
Message-ID: <294d5daa0501251217b1935c4@mail.gmail.com>
References: <Pine.LNX.4.53.0501251248340.24829@altaica>
	<Pine.LNX.4.53.0501251306320.24829@altaica>
	<Pine.LNX.4.53.0501251327570.24829@altaica>
	<294d5daa0501251137328fa4ff@mail.gmail.com>
	<Pine.LNX.4.53.0501251340370.24829@altaica>
	<294d5daa05012511513465fcc1@mail.gmail.com>
	<Pine.LNX.4.53.0501251355270.24829@altaica>
Reply-To: Mark Moseley <moseleymark@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.53.0501251355270.24829@altaica>
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
To: Tib <tib@tigerknight.org>
Cc: netfilter@lists.netfilter.org

It's used very often for logging, so that the logging doesn't swamp
the firewall's disk. Imagine you're dropping 100 packet/s and want to
log what's going on. You'd want to have the logging rule limited to
something like 1/s or whatever.



On Tue, 25 Jan 2005 13:56:25 -0600 (CST), Tib <tib@tigerknight.org> wrote:
> 
> You're kidding o_O
> 
> I guess it makes sense.. the connections will trip that rule until it is
> satisfied and then move onto the next. That's.. bizarre.
> 
> <EOL>
> Tib
> 
> On Tue, 25 Jan 2005, Mark Moseley wrote:
> 
> > Heh, forgot to CC the list on my original reply, sorry.
> >
> > Makes sense on the --limit-burst. :)
> >
> > As far as adding the DROP/REJECT after that, once the connection limit
> > in the --limit rule has been reached, it will simply just fall through
> > the next rule (i.e. it doesn't do any implicit DROP'ing on its own).
> > So the rule with the --limit just matches up to the rate in --limit
> > and then doesn't match. Without a rule later on (or a policy to
> > DROP/REJECT), any overflow will just get accepted.
> >
> >
> >
> > > Yup - once I saw an example of someone USING the limit options it made
> > > sense :]
> > >
> > > The only thing --limit-burst does is say 'you have x many free tries
> > > before you fall under the rate limit of Y/time restrictions'.
> > >
> > > So on mine, you can effectively connect twice in short succession before
> > > you are cut back to once every 10 minutes (6 per hour).
> > >
> > > > Be sure to add a DROP or REJECT on the same match (unless the default
> > > > policy is already that).
> > >
> > > I don't follow why to do this - explain?
> > >
> > > <EOL>
> > > Tib
> > >
> >
>

