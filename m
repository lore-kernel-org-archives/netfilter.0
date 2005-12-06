From: Nick Drage <nickd@metastasis.org.uk>
Subject: Re: DMZ Setup Question
Date: Tue, 6 Dec 2005 13:04:22 +0000
Message-ID: <20051206130422.GC21572@metastasis.org.uk>
References: <1133367720.22295.45.camel@syslinux.marketlinksolutions.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1133367720.22295.45.camel@syslinux.marketlinksolutions.net>
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

On Wed, Nov 30, 2005 at 11:22:00 -0500, Jay Zorzi wrote:

Left in for context....

> My colleague and i are having a disagreement about our network firewall
> and routing policies.  First the setup information.
> We have a Bridge Router running iptables and ebtables as our external
> firewall.  Behind that we have a DMZ that contains machines with valid
> external addresses.  Between the DMZ and our internal network there is
> another firewall.  Our choke firewall.  The choke firewall is doing NAT
> in order for our internal network to surf the Internet but for our DMZ
> machines to talk to our internal machines we are just using routing, no
> NAT.

Onwards....

> Now here is the disagreement.  Because the internal machines are using
> a private network address my colleague is concerned that we are
> violating Internet rules/etiquette by having this internal private
> ip's routing to our DMZ machines that have valid Internet IP's.

Not at all.  It may technically be against an RFC but you're not
affecting anyone's routing tables using this method so it's not a
problem.  I've seen large ISPs use such internal address ranges on their
networks before so I wouldn't worry.

> He is also suggesting that using nat is more secure.

It is, sort of.  Without NAT if someone compromised a DMZ box and
somehow your choke firewall permitted inbound connections then the
attacker couuld have a go at your internal hosts from the compromised
host.

If you used NAT it would mean someone could compromise a box in the DMZ
and still not get to your internal hosts, unless you specifically
forwarded inbound connections to a port on the external interface of the
choke firewall to an internal host. 

So without NAT you have to do something dumb to be vulnerable, with NAT
you have to do something dumber.  Seeing as things work at the moment
I'd be very tempted to leave things as they are.

> Can someone help us settle this disagreement?

Hope the above helps :)

-- 
deviants are sacrificed to increase group solidarity
Jenny Solzer

