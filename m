From: Alberto Negri <negri@cs.unibo.it>
Subject: Re: hi all
Date: Mon, 16 Oct 2006 12:24:58 +0000
Message-ID: <20061016122458.56980859@localhost>
References: <20061015171523.3ac5ebe3@localhost>
	<20061016110201.58e06085@localhost>
	<58531.193.173.147.3.1160999859.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <58531.193.173.147.3.1160999859.squirrel@webmail.sterenborg.info>
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

On Mon, 16 Oct 2006 13:57:39 +0200 (CEST)
"Rob Sterenborg" <rob@sterenborg.info> wrote:

LOG_LEVEL=1 :D

The most difficult thing speaking with expert linux user is setup the right log_level :D (when you don't post infos other says you: "post same datails...how do you think we can help you without them?", when you post too many datails...)
Anyway thanks for your replay, Rob! ;)
So debug of those tools will be neglected? 

Thanks all in particular at Rob 
Al

P.S.: the point was not to make my firewall working...the point is understanding why those tools does not work. ;) but if that does not interest at netfilter mailing list...

P.P.S.: sorry for my bad english :P

> On Mon, October 16, 2006 13:02, Alberto Negri wrote:
> > On Sun, 15 Oct 2006 17:15:23 +0000
> > Alberto Negri <negri@cs.unibo.it> wrote:
> >
> >
> > any suggestions? am i wrong Mailing list? ping :) Alberto
> >
> >> hi all,
> >>
> >> i post here after spoke with people into #iptables irc channel in particular
> >> with "Taube". At the end of my problem explanation he suggested me to use a
> >> script instead of iptables-{save,restore} commands, but reading iptables
> >> tutorial in particular here:
> >> http://iptables-tutorial.frozentux.net/iptables-tutorial.html#SAVEANDRESTOR
> >> E i get the advice to use iptables-{save,restore} instead of a bash
> >> script...now i thought to post here... So now my problem:
> >>
> >> Using iptables-{save,restore} on a gentoo box iptables crashes at start up.
> >>  my error message(doing /etc/init.d/iptables start):
> 
> [Snip lots of info]
> 
> I thought that the main benefit of these script was speed when
> saving/restoring rules (someone please correct me if I'm wrong). I don't think
> your ruleset is big enough to notice the difference.
> 
> If you're having trouble using iptables-[save|restore] then you can create
> your own script: it's just a matter of preference.
> 
> 
> Gr,
> Rob
> 
> 
> 


-- 
Undergraduate student at Computer Science, University of Bologna.
Icq number: 79465051
Web page: www.cs.unibo.it/~negri
Gpg-id: 1024D/E96025D7
Fingerprint: 2C6A 3E88 05AB 5B21 82E8  4A80 C357 1E37 E960 25D7

 

