From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: basics
Date: 27 Apr 2003 22:47:08 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1051498028.2387.24.camel@alpha.newkirk.us>
References: <2610830283.20030428032413@gazeta.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2610830283.20030428032413@gazeta.pl>
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
To: czesn <czesn@gazeta.pl>
Cc: netfilter@lists.netfilter.org

On Sun, 2003-04-27 at 21:24, czesn wrote:
> Hello everyone,
> 
> Im newbe at iptables, and unfourtunately i got nobody to ask for
> solution, maybe You may help.
> 
> My problem
> 
> I want to create quite tight rules of firewall for my home network. I
> have set deamons like this:
> 
> 
> deamons accessible from ppp0 (internet) and eth1 (local net)
> ftp port 21 tcp
> ssh port 22 tcp
> httpd port 80
> 
> seamons accessible ONLY for eth1 (local net)
> dhcpd port 67 udp
> squid port 3128 tcp
> 
> and some squid proccess work on 32773 udp
> 
> I cant write rules to block everything other than above services.
> I have tryed many solutions, but none of them worked. If anyone of
> You, could help me with that i would be forever in debt.

iptables -P FORWARD DROP
iptables -P INPUT DROP
iptables -P OUTPUT ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp -m multiport --dport 21,22,80 -j ACCEPT
iptables -A INPUT -i eth1 -p tcp --dport 3128 -j ACCEPT
iptables -A INPUT -i eth1 -p udp --dport 67 -j ACCEPT

Those rules will allow ftp, ssh and http access to the machine from any
interface, and the desired upd 67 and tcp 3128 from eth1.  What about
DNS?  Is there anything for which you need forwarding, or does
everything feed through squid?  Also, these rules presume you have the
required modules loaded.

insmod ip_conntrack
insmod ip_conntrack_ftp


> I have a few more newbe question:
> 
> 1. If in my system runs only deamons that are above on the list, is this nessecery to
>    block unussed ports?

If there's nothing listening on a port then blocking it isn't really
required, but it IS usually done.  Most common practice is to DROP
everything by default, then explicitly ACCEPT only the traffic required,
and specify that as precisely as is reasonable.

> 2. Is it wise to block all ports above  REGISTERED PORT NUMBERS ( above
>    1000 port ), when in system runs http server that answer to client
>    from global net on this ports, and proxy server that answer to the
>    local clients on this ports ???

normally most filtering is performed on destination port number for
initial connections (state NEW) and conntrack is used to allow
ESTABLISHED and RELATED traffic.  If you desire/need stateless
filtering, then it is necessary to specify quite a few more rules,
usually, but even then you can filter on dport for initial connections
and sport for replies, so you don't have to be concerned with
nonprivileged ports used as sources for requests/destinations for
replies, just the specific ports assigned to a given service.

j




