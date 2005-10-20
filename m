From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: blocking traffic between two internal interfaces ?
Date: Thu, 20 Oct 2005 08:27:01 -0500
Message-ID: <200510200827.01704.rob0@gmx.co.uk>
References: <20051020052237.E5BB0F4DA@sorry.no-ip-here.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051020052237.E5BB0F4DA@sorry.no-ip-here.net>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Thursday 2005-October-20 00:22, Seferovic Edvin wrote:
> > I would use interfaces, not IP addresses.
> >
> > 	You mean - physdev matching?
> >
> >I mean -i and -o options.
>
> Packet do come in on the eth1 but I dont think that they will leave
> eth2 because ( for example only ) - what happens when I try to access
> services on IP of eth2?

We were talking about FORWARD. Sounds like you are talking about INPUT. 
Yes, users on the eth1 segment will be able to access services on the 
firewall machine using its eth2 (or any other) IP address, unless you 
block with rules in INPUT or OUTPUT.

> Is another routing decision made or are they just kept in eth2?

They're not routed. It's a local destination. So no, there is no output 
interface.

> >That makes sense. See, you can't evaluate why something doesn't work
> > as expected unless you know the whole picture.
>
> I try to keep the whole pic in my head, but when you work the whole
> night long - that is not so easy ;)

I was just trying to make you feel guilty for withholding information 
from your post. :) But indeed, it's not always easy to get the picture 
in your head, and working nights can't help. :)

> > and applied this rule and now I cannot access the 172.20.0.0 net.
> >
> > Any suggestions?
> >
> >Was this not the goal? What is to suggest?
>
> Maybe some other more elegant solution ;) Not every solutions is the
> best one. But sure - goal reached ;) Thank You very much !

Hmmm, 2 rules (4 if you want to REJECT the -p tcp) and total separation 
of the segments ... sounds good to me. But I'm not you. If there's 
something missing, let us know. You can always precede your DROP/REJECT 
rules with exceptions if necessary.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

