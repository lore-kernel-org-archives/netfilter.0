From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: changing rules at a defined time
Date: Wed, 24 Dec 2003 13:42:04 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312241342.04779.Antony@Soft-Solutions.co.uk>
References: <20031224092936.GB27890@staticky.com> <200312241011.14770.Antony@Soft-Solutions.co.uk> <20031224132604.GA1942@linux.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031224132604.GA1942@linux.local>
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
To: Netfilter ML <netfilter@lists.netfilter.org>

On Wednesday 24 December 2003 1:26 pm, Payal Rathod wrote:

> Hi,
>
> Thanks for the mails all of you. I am also going to look into
> patch-o-matic later. I have a couple of doubts now.
>
> On Wed, Dec 24, 2003 at 10:11:14AM +0000, Antony Stone wrote:
> > I really disapprove of a default ACCEPT policy on FORWARD.
>
> Why? I can DROP everything later.

1. If you first set a default DROP policy, then add rules for the packets you 
want to ACCEPT, there is no point at which your firewall is allowing traffic 
you don't want to pass.   This is a Good Thing.   If you set default ACCEPT, 
then add rules, and finish with a DROP, your firewall is allowing everything 
right up to the point when that final rule gets added - and depending on your 
ruleset, this time may or may not be significant.   Personally, I want it to 
be zero.

2. What if your script encounters some error whilst it is processing, before 
it gets to add the DROP rule?   Then you are left without one, and an open 
firewall (how quickly will you notice this?)

3. If you put a DROP rule at the end of your ruleset, you must be careful when 
adding more rules later on, since if they go after the DROP, they will not do 
anything useful.   A DROP policy is guaranteed to take effect *after* all the 
rules, so you don't have to worry about fitting them in before the final 
rule.   Position in the table becomes much less critical.

> > iptables -P FORWARD DROP
> > iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> [...]
>
> > Then at 16:00, use a cron rule to run:
> >
> > iptables -A FORWARD -i $INTIF -s 192.168.0.0/24 -j ACCEPT
>
> Should that be iptables -I or specifically -A?

Well, if you use a default DROP policy, either will do.   If you have a final 
rule DROPping packets you don't want and an ACCEPT policy, then you must 
insert this rule somewhere before the existing final rule (so -I is a 
convenient way to do this, but that then prevents your ESTABLISHED, RELATED 
rule being the first one, which is a good idea for eficiency).   See my point 
3 above in reply to your first question.

> > At 17:00 use a cron rule to run:
> >
> > iptables -D FORWARD -i $INTIF -s 192.168.0.0/24 -j ACCEPT
> >
> > The only thing I can think of which this solution which you have to
> > decide whether you're happy about is that connections currently in
> > progress at 17:00 will not be cut off - users simply won't be able to
> > make new ones until 16:00 the following day.
>
> You mean a person logged on to MSN can continue being logged on
> throughout?

I don't know.   It depends whether such a session uses a single uninterrupted 
TCP connection, or multiple connections one after another.

An SSH session, for example, if started between 16:00 and 17:00, would be 
allowed to continue until the user logged out.

HTTP sessions, on the other hand are (nearly always) extremely brief, so a 
user browsing websites would find they couldn't continue after 17:00.

It depends what your users are doing as to whether preventing NEW connections 
after 17:00 will interfere with what they already started doing or not.

> So, do I FLUSH the rules through cron to prevent this?

No, you have to clear the connection tracking table, which is quite difficult 
to do (and cannot be done on a per-connection basis - either you keep them 
all, or you lose them all).

Regards,

Antony.

-- 
Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer

                                                     Please reply to the list;
                                                           please don't CC me.


