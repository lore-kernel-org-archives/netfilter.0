From: Georgi Alexandrov <tehlists@hotpop.com>
Subject: Re: Fwd: Linux as router (Gateway Server)
Date: Sun, 13 Feb 2005 13:55:54 +0200
Message-ID: <420F404A.8090909@hotpop.com>
References: <1dceb012050211233357e23dd4@mail.gmail.com>	<1dceb01205021123483860fb86@mail.gmail.com>	<1108216901.4462.27.camel@hubcap.ljm.dom>	<4f3930a705021214026db11902@mail.gmail.com>	<420EB7C3.7040303@hotpop.com>
	<4f3930a70502121833627af1bd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <4f3930a70502121833627af1bd@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Josh Nerius wrote:

>>hello josh.
>>
>>I stand 100% with Jason O.'s opinion ..
>>netfilter/iptables has nothing to do with squid binding to some/any port.
>>whoever had to do his homework ... i beleive has done it.
>>Accessing that port is something different (-i lo -j ACCEPT), but i
>>beleive that's not the case.
>>
>>regards,
>>Georgi Alexandrov
>>    
>>
>
>Hello George,
>
>>From experience...not speculation, I still stand by what I said.
>
>Squid can be a strange animal. In many configurations, the
>communication between child processes relies on being able to
>communicate via the loopback interface of the machine.  Iptables can,
>and and in configurations I've worked with, has caused the same
>symptoms described. Basically, the daemon never gets a chance to bind
>to a port as the initial communication between these child processes
>is broken causing the entire startup procedure to fail. This makes the
>illusion that the problem is related to binding the port when in fact
>the program can't start for other reasons.
>
>This problem *can* be caused by firewall rules in place that prevent
>this communication from happening. If you examine the rulesets posted,
>it looks like he is using policy DROP on the INPUT chain which may
>certainly cause problems with squid if proper rules to allow the
>necessary traffic are not in place.
>
>Another thing to note here, and the reason that I'm of the opinion
>that this could be a netfilter/iptables problem is the fact that the
>original poster seems to have indicated that squid works when iptables
>is flushed.
>
>The last point mentioned above, coupled with the fact that I've dealt
>with this problem during the development of a transparent redirection
>appliance for the company I work for, is why I maintain the opinion
>that I do.
>
>As mentioned before, Jason has a good knowledge of netfilter, but
>apparently not Squid, thus my homework comment.
>
>Thanks, and hopefully this information helps to clarify the
>information I posted. :-)
>
>Josh Nerius
>
>
>  
>
hola Josh,

I did a quick test:
DROP policy on the INPUT chain, and flushed all the rules (as a result i 
couldn't even ping myself)
squid: standart debian/unstable package - unprivilleged user, port 3128.
the result: squid is able to bind to his port fine, with DROP policy on 
the INPUT chain and no rules at all.

regards,
Georgi Alexandrov

