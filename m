From: Scott <gneamob@yahoo.com>
Subject: Re: Re: Route traffic per protocol - it is possible?
Date: Tue, 14 Jun 2005 11:28:58 -0700 (PDT)
Message-ID: <20050614182859.47598.qmail@web54307.mail.yahoo.com>
References: <41345.200.40.212.129.1118250147.squirrel@webmail.prolinux.net.uy>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41345.200.40.212.129.1118250147.squirrel@webmail.prolinux.net.uy>
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
To: Gustavo Castro Puig <gcastro@gcp.com.uy>, netfilter@lists.netfilter.org

Hi, I tried with the -p tcp and then with -p tcp -m
tcp options and to no avail, but with a new error:

iptables: No chain/target/match by that name

I have gone through every bit of the command:

iptables -t mangle -A PREROUTING -p tcp -m tcp --dport
22 -j ROUTE --gw 1.2.3.4

..to no avail!!  even if I change PREROUTING to INPUT,
OUTPUT, FORWARD or POSTROUTING it's the same error..
surely someone must know why, I'm out of answers...

--- Gustavo Castro Puig <gcastro@gcp.com.uy> wrote:

> Scott:
> 
>   That wasn't the error. I've seen the error before
> typing and I tested it
> the correct way. It's something related to de
> kernel/netfilter version.
>   Anyway, I'm still trying to find a solution...
> 
> > It doesn't, at least not with 1.2.11, here is the
> > error:
> >
> > iptables v1.2.11: Unknown arg `--dport'
> > Try `iptables -h' or 'iptables --help' for more
> > information.
> >
> > tested with a 2.6.11 kernel.
> >
> > --- Gustavo Castro Puig <gcastro@gcp.com.uy>
> wrote:
> >
> >> Kenneth:
> >>
> >>   It's almost sure to work... but I don't have
> one
> >> of the latest version
> >> of iptables (which includes this feature), so I
> >> can't make it that
> >> way... :-(
> >>   Anyway, I should update my netfilter...
> >>   I'll check it!
> >>   Thank you, Keneth, and if anybody have any
> other
> >> way to do this, will be
> >> appreciated too!
> >>
> >> Cheers,
> >>      G.Castro P.
> >>
[snip]

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

