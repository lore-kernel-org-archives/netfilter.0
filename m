From: Jason Opperisano <opie@817west.com>
Subject: Re: Port 25
Date: Sun, 06 Feb 2005 14:29:11 -0500
Message-ID: <1107718151.4679.28.camel@hubcap.ljm.dom>
References: <Pine.LNX.4.58.0502061446150.1174@linux>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.58.0502061446150.1174@linux>
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

On Sun, 2005-02-06 at 13:51, Ted Gervais wrote:
> I have a problem getting mail packets to go out with my present firewall
> setup.

is the mail server on a machine behind the firewall, or running on the
firewall itself?

> What I have is a firewall that blocks/drops everything at the start and
> then it goes on to allow access through specific ports. For Port 25 or
> smtp to work, I have the following line which I was hoping to have mail
> coming and going with this statement. However, outgoing mail can go, but
> incoming has a problem:
> 
> /usr/sbin/iptables -A INPUT -p tcp --destination-port 25 -j ACCEPT

this allows TCP port 25 connections to the firewall itself.

> I also tried the following two lines to see if things would work but to no
> avail..:
> 
> iptables -A OUTPUT -o $INTERNET -p tcp -s $IPADDR --sport $UNPRIVPORTS \
> --dport 25 -j ACCEPT

that allows the firewall itself to send TCP packets out interface
$INTERNET with if the source IP is $IPADDR, source port is $UNPRIVPORTS
and the destination port is 25.

> iptables -A INPUT -i $INTERNET -p tcp ! --syn --sport 25 -d $IPADDR \
> --dport $UNPRIVPORTS -j ACCEPT

allows TCP packets destined for the firewall itself inbound on interface
$INTERNET with flag SYN unset out of SYN, ACK, and RST, a source port of
25, destination IP $IPADDR and a destination port of $UNPRIVPORTS

> So, if I take the firewall down, mail comes and goes just great..
> What am I not seeing here??

first off--let me introduce you to a rule that (IMHO) should be at the
top of all your built-in filter chains (INPUT, OUTPUT, FORWARD):

  iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

which will eliminate things like mr. "iptables -A INPUT -i $INTERNET -p
tcp ! --syn --sport 25 -d $IPADDR --dport $UNPRIVPORTS -j ACCEPT"
above...

second--if the mail server is running on a machine other than the
firewall itself--you need to be added rules to the FORWARD chain of the
filter table, not INPUT/OUTPUT.

all this (and much more) knowledge can dropped on a brother at:

  http://iptables-tutorial.frozentux.net/iptables-tutorial.html

-j

--
"I bent my wookie."
	--The Simpsons


