From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: [ANNOUNCE] ipset 6.19 released
Date: Fri, 10 May 2013 18:12:40 +0200 (CEST)
Message-ID: <alpine.DEB.2.00.1305101758420.27743@blackhole.kfki.hu>
References: <alpine.DEB.2.00.1305092214320.25002@blackhole.kfki.hu> <20130510123223.GQ8305@localhost>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20130510123223.GQ8305@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Herz <andi@geekosphere.org>
Cc: netfilter@vger.kernel.org

On Fri, 10 May 2013, Andreas Herz wrote:

> On 09/05/13 at 22:28, Jozsef Kadlecsik wrote:
> > I'm happy to announce ipset 6.19. The main new feature in this release is 
> > the per element byte and packet counters for every set type, which is 
> > based on the new internal extension infrastructure. Please read the 
> > updated manpage on how to use counters, initialize or change them.
> 
> Thanks for the release :)
> 
> Can you describe the new feature a bit more in detail?
> I would like too see some use cases for this feature.
> I would guess that every packet that comes through the ipset match would
> increase the counter for the address (element) in the list. But what
> effect does it have, since the timeout has the effect that the element
> leaves the list when it goes down to zero.

If a set is defined with timeout and counters and an element times out, of 
course the counter values are lost.

Some examples:

a. Traffic counting from clients

# Create the set, fill with elements
ipset n clients hash:ip counters
ipset a clients ...
# Match in a rule
iptables -A ... -m set --match-set clients src -j ...
# List regularly the set and process the counter values
ipset l clients

b. Combined time and traffic limiting

# Create the set, fill with elements
ipset n guests hash:ip counters timeout $((2*60*60))
ipset a guests ...
# Allow traffic up to a given a limit or until timeout
iptables -A ... \
  -m set --match-set guests src --bytes-lt $((8*1024*1024)) ...

There are some subleties of course: if the set match rule is negated

   .... -m set ! --match-set foo src

that is independent from increasing the packet and byte counters for the 
elements which matched the lookup in the set - the negation happens at 
rule evaluation level.

As the updated iptables-extensions manpage shows, there are new flags to 
suppress updating the packet and byte counters at different levels if one 
matches a set from multiple rules.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Sciences
          H-1525 Budapest 114, POB. 49, Hungary
