From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Weird TCP flags?
Date: Fri, 12 Dec 2003 14:37:39 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312121437.39728.Antony@Soft-Solutions.co.uk>
References: <003101c3c065$f61ad790$13fea8c0@melita.com> <200312121359.27728.Antony@Soft-Solutions.co.uk> <1071240651.1891.71.camel@jasiiitosh.nexusmgmt.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1071240651.1891.71.camel@jasiiitosh.nexusmgmt.com>
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

On Friday 12 December 2003 2:50 pm, John A. Sullivan III wrote:

> On Fri, 2003-12-12 at 08:59, Antony Stone wrote:
>
> > I disagree with this.
> >
> > Making the rule more explicit by matching state NEW is not a bad idea,
> > but it has nothing to do with whether a conntrack table entry gets
> > created or not. If you have compiled in connection tracking, or loaded
> > the module, then all connections which are ACCEPTed will result in a
> > conntrack table entry. There's no way to stop that happening on a
> > connection-by-connection basis.

> I'm sure you know better than I.  I always assumed that NEW was
> necessary before ESTABLISHED and RELATED were meaningful but I have
> never cracked open the netfilter code to confirm that assumption.  Thank
> you for the correction - John
> PS - what, then, is the purpose of NEW? Is it just for identifying new
> connections for some other purpose than access control such as logging?

Some people like to specify NEW in their rules (and some people also like to 
specify the TCP flags, to make sure only the SYN flag is set, and not 
something silly like FIN or RST as well), just to be as specific as possible 
about what is being allowed.

In my opinion, specifying NEW state for FORWARDING rules, when you already 
have a general-purpose ESTABLISHED,RELATED rule doesn't add any extra 
security to your ruleset, but nor does it do any harm.   It's only ever going 
to match the first packet of a connection, as well, so there's no significant 
performance impact.

Antony.

-- 
Success is a lousy teacher.  It seduces smart people into thinking they can't 
lose.

 - William H Gates III

                                                     Please reply to the list;
                                                           please don't CC me.


