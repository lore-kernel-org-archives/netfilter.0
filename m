From: Arnt Karlsen <arnt@c2i.net>
Subject: ..migrate 35 big firms, some remote, to a 10/8 net or several
 smaller, was Re: (no subject)
Date: Wed, 12 Mar 2003 03:44:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030312034428.6080bdc9.arnt@c2i.net>
References: <000401c2e755$11080590$5efffacc@fntax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000401c2e755$11080590$5efffacc@fntax.com>
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
To: netfilter@lists.netfilter.org

On Mon, 10 Mar 2003 14:33:26 -0800, 
"William Beattie" <williambeattie@msn.com> wrote in message 
<000401c2e755$11080590$5efffacc@fntax.com>:

> Hello,
> 
> I have a fairly complicated network which I have to maintain
> connectivity with 20 different customers over private line or frame
> relay and 14 remote offices using frame relay.  Most of the customers
> use 10.x.x.x or 192.168.x.x subnets.  In order to not conflict with
> the customer networks I am using all public IP addresses locally and
> at my remotes. (Ya, Ya, I know)
> 
> Now I have a mandate from our corporate IT to migrate/RE-IP my entire
> network to 10.x.x.x.  

..with net-nazi power, I hope?

> Right away with the 10.x.x.x subnets I have been assigned for this
> office I immediately conflict with at least one customer circuit.

..grab some 10.x.y/24 nets and use those to link _everything_ else,
you'll wanna use one as the backbone link net.
  
If you can, try to separate all the site's public servers, into 
dmz's away from each sites lan, you may also want to tunnell 
conflicting traffic, and it is also possible to throttle traffic.

> IPTABLES looks like the way to go but I need some helpful suggestions.
> 
> 
> I need to do source and destination nat because we connect to machines
> on their side and they connect to machines on our side.  
> 
> I need to restrict incoming internet traffic on this firewall to
> basically 5 IP addresses or so and restrict outgoing internet access
> to a list of sites for my general population and full internet ports
> 80, 443, 20:21, 23 for a select group.

..here, check http://tldp.org/HOWTO/Adv-Routing-HOWTO/ to 
learn throttling, tunneling: 
http://www.tldp.org/HOWTO/HOWTO-INDEX/networking.html#NETVPN
and general iptables usage:
http://iptables-tutorial.frozentux.net/chunkyhtml/
( or, we could agree on a good price. ;-) )

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


