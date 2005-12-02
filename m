From: Frank.Mayer@knapp-systems.com
Subject: Antwort: Re: Antwort: Re: Antwort: Re: ipsets for both source and
 target in one iptables-rule?
Date: Fri, 2 Dec 2005 14:33:27 +0100
Message-ID: <OFD3453F7F.C50E7A66-ONC12570CB.004886DF-C12570CB.004A790C@knapp.com>
References: <Pine.LNX.4.58.0512021315040.8267@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0512021315040.8267@blackhole.kfki.hu>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi Joszef & Rob,

> On Fri, 2 Dec 2005 Frank.Mayer@knapp-systems.com wrote:
> 
> > I just realized that I now think I understand what you meant by "But 
why
> > do you specify the protocol?"
> >
> > I could have written the rule like
> >         iptables -A -m state --state ESTABLISHED -j ACCEPT
> 
> Yes, conntrack hold entries of connections you had explicitly let to 
open
> up. So (usually) there is no point to add other matches to the rule 
above.
> 
> Best regards,
> Jozsef

In hindsight, I completely agree with you (I hadn't given my example(s) 
the same scrutinity I usually apply to actual rule sets - if I do have the 
time to do so).
Nevertheless I like to expressly state "-s 0/0 -d 0/0" for 
understandability.

I have one more request, if I may bother you once again:
can you point me to some documentation that clarifies state matching from 
a user's point of view?
I do understand "NEW" and "ESTABLISHED" related to TCP, but their meaning 
for e.g. UDP and ICMP mostly eludes me, as does the "RELATED" state:
under which circumstances is one connection considered "related" to 
another one (does that depend on the interpretation of the respective 
conntrack-module, or is there a general definition)?

Best Regards and many thanks again for your clarifications
- and patience ;-)

Frank Mayer
UNIX Systemadministration
----------------------------------------------------
KNAPP Systemintegration GmbH
Waltenbachstrasse 9
8700 Leoben, Austria
----------------------------------------------------
Phone: +43 3842 805-921
Fax: +43 3842 82930-921
frank.mayer@knapp-systems.com
www.knapp.com

