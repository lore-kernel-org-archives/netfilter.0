From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Understanding the Forward and Postrouting chain
Date: 15 Apr 2003 09:23:57 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1050413037.7035.30.camel@alpha.newkirk.us>
References: <PFEDLCHOEGFHBPOGGFGBGEMCCAAA.Chris@globetechsolutions.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <PFEDLCHOEGFHBPOGGFGBGEMCCAAA.Chris@globetechsolutions.com>
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
To: Chris@globetechsolutions.com
Cc: netfilter@lists.netfilter.org

On Tue, 2003-04-15 at 05:52, Chris Partsenidis wrote:
> Greetings everyone,
> 
> While building a complex set a rules for my firewall I have stumbbled
> accross a few problems and would like to know if there is anyone to help me
> clear a few things in my mind.
> 
> If I was to set the Forward chain default policy to DROP, what rules would I
> be required to enter in order to allow e.g my internal network hosts to
> telnet anywhere on the internet ?
> 
> For example take this setup:
> 
> LAN -----------------FIREWALL------------------------ Internet
> 192.168.1.0/24		 public ip: 200.0.0.1
> 				
> In this simple setup, my guess is that Im required to create 3 rules for the
> telnet to work.
> One for the packets travelling from the Lan to the firewall, one for the
> oppisite (internet to the firewall) and then one more
> for the postrouting chain to masquerade the packets. Here is what I've done:
> 
> 1) iptables -P FORWARD DROP
> 2) iptables -A FORWARD -s 192.168.1.0/24 -p tcp -d 0/0 --dport 23 -j ACCEPT
> 3) iptables -A FORWARD -p tcp -s 0/0 --sport 23 -d  200.0.0.1 -j ACCEPT
> 4) iptables -A POSTROUTING -t nat -s 192.168.1.0/24 -p tcp -d 0/0 --dport 23
> -j MASQUERADE
> 
> Would this be correct, and if not, can you please explain why. I'm not to
> sure if loading ip_conntrack would eliminate the need for rule no. 3.

#3 is your problem.  When the reply packets come back through, they are
un-SNATted (un-MASQUERADEd in this case) in nat PREROUTING, before they
enter the FORWARD chain, so you need to match the local IP addresses not
the public one.

However, if you use ip_conntrack, you can handle this with:

iptables -A FORWARD -d 192.168.1.0/24 -m state --state ESTABLISHED -j
ACCEPT

which tells netfilter that anything with a state ESTABLISHED (reply or
ongoing traffic) destined for the specified subnet is ACCEPTed.  The
more generalized and expanded form, which will greatly reduce the number
of rules you actually need to explicitly define, is:

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

This way anything that is part of an already-established connection, or
related to one, is accepted.  RELATED state is netfilter magic.  Some
things like icmp_host_unreachable can be related to an attempted
connection, and RELATED also encompasses things handled by conntrack
helpers like FTP data (active or passive) being related to the control
connection, so all you have to do is ACCEPT tcp port 21 outbound,
EST/REL out and in, and local machines can then use FTP.

> Regards, 
> 
> Chris Partsenidis

j



