From: Nick Taylor <nickt@lightlink.com>
Subject: Re: Help need :) How to delete all rules in chain ?
Date: Tue, 28 Sep 2004 16:38:55 -0400 (EDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <Pine.GSU.4.58.0409281634060.17424@adore.lightlink.com>
References: <1096400937.3163.134.camel@alkaloid.netup.ru>
	<1096399581.1940.0.camel@alucard.kanux.com>
	<1096414103.3163.151.camel@alkaloid.netup.ru>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1096414103.3163.151.camel@alkaloid.netup.ru>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Abylai Ospan <aospan@netup.ru>
Cc: netfilter@lists.netfilter.org, Juan Hernandez <alucard@kanux.com>

> > > May be this question in FAQ but I can't find it ;-( I have 3 (or more)
> > > identical rules in one (for example - INPUT) chain.
> > > If I do command:
> > > iptables -D FORWARD -s 10.0.0.10 -d 10.0.0.20 -j ACCEPT
> > >
> > > the first rule is deleted only. Is there any command line option to
> > > remove all identical rules in one chain ?
> > >
> > iptables -F
> >
> oh, no :) I don't need delete all rules in chain :) I need to delete
> identical rules specified by rule.
>
Er, maybe this is a silly question, but how is it that your firewall
chain ended up with three copies of the same rule?  Maybe it's easier to
prevent this from happening in the first place?  Does a second or third
copy of a rule have any use to you?  As far as I can think this would only
make sense in non-terminating rules (like LOG) and rules which match
against something internal to netfilter, like -m mark.  Maybe you could
provide more info on the source and content of the rules?

