From: Shawn <core@enodev.com>
Subject: Re: DNAT based on domain name instead of IP address
Date: Wed, 28 Jan 2004 18:01:23 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1075334483.11612.25.camel@localhost>
References: <1075332153.25415.98.camel@child-of-god.holiness.ch>
	 <1075333547.1902.34.camel@jasiiitosh.nexusmgmt.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1075333547.1902.34.camel@jasiiitosh.nexusmgmt.com>
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
To: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Cc: Glen Lee Edwards <glen@holiness.ch>, "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Doesn't apache have the smarts to figure it out on its own? I've never
put squid in as an incomming request proxy server. I don't know that
squid or apache will give you quite what you want though.

1st, determine if you /really/ need two servers (.12 and .13). I think a
single apache can have multiple document roots based on the domain in
the URL requested.

2nd, if you do think you need 2 servers, figure out why exactly and if
you can solve the problem from some other angle.

3rd, if you really need it, I think L7 filtering is how you want to go,
but I can't guide you. I've not yet found a problem to solve with L7 for
myself.

On Wed, 2004-01-28 at 17:45, John A. Sullivan III wrote:
> On Wed, 2004-01-28 at 18:22, Glen Lee Edwards wrote:
> > I have several domains that use the same IP address.  Can I DNAT them to
> > different servers based on domain name instead of IP address using
> > iptables?  I've tried the following, but it isn't working:
> > 
> > iptables -t nat -A PREROUTING -p tcp -d 1st.domain.com --dport 80 -j
> > DNAT --to-destination 192.168.1.12:80
> > 
> > iptables -t nat -A PREROUTING -p tcp -d 2nd.domain.com --dport 80 -j
> > DNAT --to-destination 192.168.1.13:80
> > 
> > Everything is being forwarded to 192.168.1.12 no matter which domain is
> > used.  It appears that the domains are first being translated into the
> > IP address, which is used instead.
> > 
> > Glen
> 
> I'm going to go way out on a limb here and speculate so if someone who
> has actually looked at the code tells you otherwise, please listen to
> them and not me!
> 
> I would assume that netfilter is only operating at layer 3.  I believe
> from an earlier enlightening post from Anthony Stone(?) that all domain
> names are resolved to IP addresses when the rule is loaded and the rule
> uses the layer three information, i.e., the IP address, to evaluate the
> rule.
> 
> It sounds like you need something that will operate on the layer 7 data
> since that's where the url/uri information is going to be.  Perhaps a
> proxy like squid has the ability to redirect traffic based upon layer 7
> information.
> 
> I'm quite curious to see how you ultimately resolve this.  Good luck -
> John

