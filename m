From: Jason Opperisano <opie@817west.com>
Subject: Re: confused fw block int and ext traffic ..
Date: Wed, 24 Nov 2004 10:08:45 -0500
Message-ID: <1101308924.3687.17.camel@hubcap.ljm.dom>
References: <41A48567.9070507@genion.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41A48567.9070507@genion.de>
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
To: netfilter@lists.netfilter.org

On Wed, 2004-11-24 at 07:58, Lars Nixdorf wrote:
> hi,
> 
> i want to make a ruleset, that protect the intranet. Ok, no Problem. But 
> it should also protect the "internet". That means only .. simple :
> 
> ruleset extern_to_intern:
> 	allow some ports to fw
> 	allow some ports through fw to some hosts / subnets
> 	deny all
> 
> ruleset intern_to extern:
> 	allow some ports (most of them) to fw
> 	allow some ports trough fw to some hosts in internet
> 	deny all
> 
> ruleset vpn-connections
> 	allow all to intranet and fw
> 	deny all (also traffic to internet)
> 
> ruleset for special handling
> 	some nats / port forwards intern <--> intern
> 
> ruleset for masquarading
> 	masq. all behind offical ip
> 
> My interfaces are:
> 	eth0 - intranet interface
> 	eth1 - internet interface
> 
> 
> .. short lines from my configs :
> -----------------------------------------------------------------------
> -N extern
> -A extern -m state --state ESTABLISHED,RELATED -j ACCEPT
> -A extern -i $INTERNET -m state --state NEW -p tcp --dport 22 -j ACCEPT
> -A extern -i $INTERNET -m state --state NEW -p tcp --dport 25 -j ACCEPT
> -A extern -i $INTERNET -p 50 -j ACCEPT 
> 
> -A extern -i $INTERNET -p 51 -j ACCEPT
> -A extern -i $INTERNET -m state --state NEW -p udp --dport 500 -j ACCEPT
> -A extern -j DROP

at this point all your traffic gets dropped and nothing else you've
typed is worth the screen space it's taking up.

> -A INPUT -j extern
> -A FORWARD -j extern

see?

<snip>

-j

--
"It is better to remain silent and thought a fool, than open your
 mouth and remove all doubt."
	--The Simpsons


