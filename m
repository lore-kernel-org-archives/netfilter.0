From: Julian Gomez <kluivert@tm.net.my>
Subject: Re: STATELESS
Date: Wed, 17 Sep 2003 19:34:36 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030917113436.GM3850@propaganda.localdomain>
References: <02ba01c37c46$bb7a5f60$798014ac@matthew> <200309161256.15286.gdh@acentral.co.uk> <1063716386.31093.160.camel@raylinux.internal> <20030916131153.GA16559@cannon.eng.us.uu.net> <1063720447.31093.166.camel@raylinux.internal> <20030916141505.GB16559@cannon.eng.us.uu.net> <plopm3isnshj1n.fsf@drizzt.kilobug.org> <20030916155001.GE16559@cannon.eng.us.uu.net> <1063731433.784.25.camel@elendil.intranet.cartel-securite.net>
Reply-To: kluivert@tm.net.my
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1063731433.784.25.camel@elendil.intranet.cartel-securite.net>
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
Content-Transfer-Encoding: 7bit
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

On Tue, Sep 16, 2003 at 06:57:13PM +0200, Cedric Blancher spoke thusly:
>Le mar 16/09/2003 ? 17:50, Ramin Dousti a ?crit :
>> > Can I ask you why do you want  to turn off the conntrack?
>> I don't. I just wanted to learn from the people who were saying "just don't
>> load the ip_conntrack..."
>
>I assume that if someone wants to fallback on stateless filtering is for
>saving load on his box. I can miss something, but I really don't see
>another reason. Once ip_conntrack is loaded, all packets are tracked
>anyway, weither you use state match or not. Yes, one can write a whole
>stateless ruleset with conntrack running, but what's the point : the cost
>implied by a rule with state matching and one without is the same, as
>state flaging is done anyway !
>
>That's why assuming that stateless is for save load implies ip_conntrack
>module removal. But, as it relies on conntrack, NAT is broken. It is as
>simple as this.

(snip)

In regards to system load (stateful vs non-stateful) -- the following paper
states that might not always be the case. YMMV of course.

http://www.benzedrine.cx/pf-paper.html

Furthermore, the pf performance tricks do seem rather nice to me :-) But
I'm not a coder, so the logic complexity might be excessive.

