From: "it clown" <suse@mailbox.co.za>
Subject: Re: bind 9 and iptables
Date: Sat, 28 Aug 2004 01:32:20 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <web-420590607@mail01.infosat.net>
References: <D5C9032B2B09C64EA2409D6214E91AC90512F9@asimail2.alphanumeric.co
	m>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <D5C9032B2B09C64EA2409D6214E91AC90512F9@asimail2.alphanumeric.co
	m>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi Again,

Damn it still not working why i said it was working was was
because of cached ip's as soon as i tried to access a site
that hasn't been cached it would give me a unknown host
error.

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

iptables -A INPUT -p udp -i eth0 -s 192.168.0/24 -d
192.168.0.1 --dport 53 -j ACCEPT
iptables -A INPUT -p tcp -i eth0 -s 192.168.0/24 -d
192.168.0.1 --dport 53 -j ACCEPT
iptables -I OUTPUT -m state --state ESTABLISHED,RELATED -j
ACCEPT

iptables -I INPUT -i lo -j ACCEPT
iptables -I OUTPUT -o lo -j ACCEPT

iptables -A FORWARD -i eth0 -o ppp0 -p tcp -j ACCEPT
iptables -A FORWARD -i eth0 -o ppp0 -p udp -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j
ACCEPT

iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

Thats my rules im trying to get dns to work atm.

When i comment these out everything works fine:

#iptables -P INPUT DROP
#iptables -P OUTPUT DROP


On Fri, 27 Aug 2004 17:19:07 -0400
 "Jason Opperisano" <Jopperisano@alphanumeric.com> wrote:
> > Hi
> >
> > Thanks this seemed to have done the trick.I had to add
> > another rule for tcp aswell. Is it possible for these
> rules
> > to slow my browsing abit? Because it seems asif my
> browsing
> > is abit slower now since i used the rules?
> 
> quick answer:  no.
> 
> long answer:  it has been discussed on this list
> previously that connection tracking DNS queries/responses
> on or for a busy DNS server (i think the number was ~ 200
> queries/second) will slow the name resolution process
> down.  the reason being that the state creation adds
> noticeable, unnecessary latency, as most (all?) queries
> are one packet request--one packet response.
> 
> somehow i don't think this applies here.
> 
> oh--and i'll chime in with the obligatory:  don't run a
> DNS (or any other) server on your firewall.
> 
> -j
> 

_____________________________________________________________________
For super low premiums ,click here http://www.dialdirect.co.za/quote

