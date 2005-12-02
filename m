From: Frank.Mayer@knapp-systems.com
Subject: Antwort: Re: Antwort: Re: ipsets for both source and target in one
 iptables-rule?
Date: Fri, 2 Dec 2005 12:42:27 +0100
Message-ID: <OFAD4EEC06.4666A14A-ONC12570CB.0035DAA4-C12570CB.00404F91@knapp.com>
References: <Pine.LNX.4.58.0512020838530.8267@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0512020838530.8267@blackhole.kfki.hu>
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

> On Thu, 1 Dec 2005 Frank.Mayer@knapp-systems.com wrote:
> 
> > > In my opinion it's wasting of resources to specify any other 
matching
> > > together with '-m state --state NEW,ESTABLISHED' if you set up 
proper
> > > rules for matching NEW packets.
> > I'm not sure I understand....
> > It's true I can (and often do) add a rule similar to
> >         iptables -A FORWARD -s 0/0 -d 0/0 -p tcp -m state --state
> > ESTABLISHED -j ACCEPT
> > as some "catch-it-all".
> 
> The '-s 0/0 -d 0/0' matches buy nothing, they express the default.
> But why do you specify the protocol? Will you enter similar rules for 
UDP
> and ICMP as well? Then netfilter has to process two-three rules instead 
of
> one. And if you already let in the packet which created the connection,
> then the state matching is perfectly enough to match all subsequent
> packets in the same stream.
> 
> Best regards,
> Jozsef

Hello Jozsef,

If the "-s 0/0 -d 0/0 .... -j ACCEPT" matches express the default or not 
does depend on the default, don't they?
Of course, I could do without expressly stating source and destination 
addresses when defining the generic rule, but I don't think that's the 
point you wanted to make, is it?
And yes, if and only if - which is not the case very often, given the 
network setup I have to cope with - I want ICMP and/or UDP from some 
client  to some server, I expressly define such rules.

On several occasions in the past, we had an ISDN connection to Mexico open 
over the weekend, just because some crazy programmer forgot he had started 
a ping to some machine there when he left Friday afternoon. This is why I 
don't generally allow ICMP (ICMP uses on the Internet do not apply for 
these connections).
Similar arguments hold for UDP: some collegue had been connected to a 
remote network abroad, and forgot the printer connection he had configured 
on his notebook there. Therefore windows on his machine queried the 
printer via SNMP every couple of minutes even when he was back in Austria: 
now a way to keep your phone bill low, if you ask me.

This and several other things led me to believe in being as restrictive as 
possible when configuring a firewall, and of course I try to minimize the 
number of rules netfilter needs to process to find a match when designing 
the rule sets.

(Or did I completely misunderstand your statement?)

Best Regards,
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

