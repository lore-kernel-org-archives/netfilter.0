From: saint <nagajuna@optushome.com.au>
Subject: Re: Consequences
Date: 04 Feb 2003 12:29:54 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1044322193.9025.115.camel@juna.cypherworld.org>
References: <1044278051.9027.50.camel@juna.cypherworld.org>
	 <20030203112909.133454d2.brblueser@uol.com.br>
	 <1044281797.9025.60.camel@juna.cypherworld.org>
	 <20030203124402.62d81f9e.brblueser@uol.com.br>
	 <1044284315.9027.64.camel@juna.cypherworld.org>
	 <20030203130900.75c2bf9a.brblueser@uol.com.br>
	 <1044287458.9025.82.camel@juna.cypherworld.org>
	 <20030203144552.40a47171.brblueser@uol.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030203144552.40a47171.brblueser@uol.com.br>
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
To: Andre Costa <brblueser@uol.com.br>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

G'day Andre.

For the past few months I have been writing my firewall from scratch. 
It was a painstaking exercise working line for line but I learnt alot. 
With my userdefine chains and the methods/rules applied on them they are
correct as far as what I wanted to achieve and syntactically sound.

I bet that using a new grep rule to capture info on eth0 and fixing the
initialisation and setting some policy to ACCEPT would solve my
problems.

At the moment I just execute the script from a virtual console and all
works as expected.  I test the netwrok with nmap and the ports that I
expected filtered are filtered.

Santos.
That's why I love number theory: it's akin to gazing at the heavens.



On Tue, 2003-02-04 at 03:45, Andre Costa wrote:
> > There have been a number of problems that I have but I believed
> > it had nothing to do with syntax errors or any missing rules on 
> > my behalf.
> 
> You can count on that. Both iptables and bash are very sensitive to
> syntax errors, you would have noticed them right away. As for missing
> rules, this is a usage error, so it won't be caught by the software, and
> it could indeed cause all kinds of trouble.
> 
> > I'll have to sit back and study these problems taking into
> > consideration you recommendations ( and Ken's).
> > How far reaching I not sure yet but I will say that I have conflicting
> > chains-> different userdefined chains, default policy of DROP
> > (INPUT/OUTPUT/FORWARD/POST-PRE ROUTING/ MANGLE ) drops everything
> > as expected and remains dropping everthing eventhough I have the
> > service exlicitly and carefully enabled are just some of these
> > problems.
> 
> I am affraid I might not be able to help you with your specific setup, I
> am far from being an iptables expert (my fw setup is very simple because
> I am just watching over my own computer -- no subnet behind me,
> therefore I have only INPUT and OUTPUT rules). However, maybe this piece
> of advice can be helpful: maybe you should start from scratch, paying
> special attention to your needs and keeping complexity to a minimum and
> essential level. Struggling to fix something I don't even understand
> anymore is something I try to avoid as hard as I can...
> 
> > I don't know what's causing them because, as I have indicated, syntax
> > & everthing else is fine.  Ofcourse because I don't know I'm looking
> > for a possible scapegoat and initialisation + ifconfig stuff is one
> > thing I haven't comes to terms with yet -> so hence my suspicion that
> > other things could've been affected by this.
> 
> As I was saying above, aside from the fact that your setup might be
> complex by nature, you might also be suffering from non-trivial, hard to
> spot side-effects, and rewriting fw rules from scratch and testing it
> incrementally (if at all possible, of course) might help you avoid these
> pitfalls.
> 
> > Let you know though when I figure it out.  Personally I want to finish
> > it before my summer break -> then its back to uni.
> 
> Please, do so, it would be valuable experience.
> 
> Good luck,
> 
> Andre


