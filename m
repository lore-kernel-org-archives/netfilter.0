From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re[2]: how to negate a limit match?
Date: Sun, 2 Nov 2003 06:32:00 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0311020630160.10439-100000@localhost.localdomain>
References: <109595440117.20031102124948@lf.lv>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <109595440117.20031102124948@lf.lv>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peteris Krumins <newsgroups@lf.lv>
Cc: iptables mailing list <netfilter@lists.netfilter.org>

On Sun, 2 Nov 2003, Peteris Krumins wrote:

> Wednesday, October 29, 2003, 9:12:01 PM, you wrote:
> 
> jso> Hallo Robert,
> 
> jso> On Wed, 29 Oct 2003 13:31:10 -0500 (EST)
> jso> "Robert P. J. Day" <rpjday@mindspring.com> wrote:
> 
> >> 
> >>   it's not clear from the man page how to reverse the meaning
> >> of a limit match.  if i want to accept everything *over* a given
> >> limit, i'm supposed to use the "!".  but where?  is it like
> >> this?
> >> 
> >>   -m ! limit -- limit ... etc etc ...
> jso> -m limit ! --limit ...
> >> 
> jso> Take a look at http://iptables-tutorial.frozentux.net/ . There will you
> jso> find a good tutorial for iptables.
> 
> 
> Limit cannot be negated...

from the iptables man page:

limit 

  This module matches at a limited rate using a token bucket filter.  A
rule using this extension will match until this limit is reached (unless
the ! flag is used).  It can be used in combination with the LOG target to
give limited logging, for example.


  so the man page clearly suggests that the limit match can be negated.
i'm just not sure how one would do it.  what's the syntax?

rday


