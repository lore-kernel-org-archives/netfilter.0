From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ANNOUNCE] ipset 6.19 released
Date: Sat, 11 May 2013 12:42:56 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1305111241450.29329@blackhole.kfki.hu>
References: <alpine.DEB.2.00.1305092214320.25002@blackhole.kfki.hu> <20130510123223.GQ8305@localhost> <alpine.DEB.2.00.1305101758420.27743@blackhole.kfki.hu> <518D803B.5010702@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <518D803B.5010702@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dash Four <mr.dash.four@googlemail.com>
Cc: Andreas Herz <andi@geekosphere.org>, netfilter@vger.kernel.org

On Sat, 11 May 2013, Dash Four wrote:

> Jozsef Kadlecsik wrote:
> > Some examples:
> > 
> > a. Traffic counting from clients
> > 
> > # Create the set, fill with elements
> > ipset n clients hash:ip counters
> > ipset a clients ...
> > # Match in a rule
> > iptables -A ... -m set --match-set clients src -j ...
> > # List regularly the set and process the counter values
> > ipset l clients
> > 
> > b. Combined time and traffic limiting
> > 
> > # Create the set, fill with elements
> > ipset n guests hash:ip counters timeout $((2*60*60))
> > ipset a guests ...
> > # Allow traffic up to a given a limit or until timeout
> > iptables -A ... \
> >   -m set --match-set guests src --bytes-lt $((8*1024*1024)) ...
> > 
> > There are some subleties of course: if the set match rule is negated
> > 
> >    .... -m set ! --match-set foo src
> > 
> > that is independent from increasing the packet and byte counters for the
> > elements which matched the lookup in the set - the negation happens at rule
> > evaluation level.
> > 
> > As the updated iptables-extensions manpage shows, there are new flags to
> > suppress updating the packet and byte counters at different levels if one
> > matches a set from multiple rules.
> >   
> Jozsef, where is this updated iptables-extensions manpage you speak of?
> 
> The latest released version of iptables is 1.4.18, which obviously does not
> include any of the above since it was released before ipset 6.19. I've just
> looked at the main iptables git repo and there aren't any git logs since that
> release with anything related to ipset. In the ipset sources, apart from the
> main ipset man page, there is nothing there which describes the above iptables
> match options.

As I wrote in the announcement, it's in the "next" branch of the iptables 
git tree yet.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
