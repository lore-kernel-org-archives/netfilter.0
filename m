From: Jason Opperisano <opie@817west.com>
Subject: Re: I dont know how to forward port 80
Date: Fri, 11 Feb 2005 08:24:07 -0500
Message-ID: <1108128247.4489.45.camel@hubcap.ljm.dom>
References: <420B54E3.8040900@google.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <420B54E3.8040900@google.com>
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

On Thu, 2005-02-10 at 07:34, Micah James Sergey wrote:
> hello, i have my computer hooked up through a router and would like to 
> use my computer as a server. ive set up the router so it forwards port 
> 80 to the to-be server. however, i have no idea how to set up the 
> iptables so the server accepts stuff. id really appreciate it if someone 
> would send me the commands for doing so. it'd also be nice if they could 
> explain what each line does.

might i suggest a perusal of:

  http://iptables-tutorial.frozentux.net/iptables-tutorial.html

that way--you don't have to rely on what we tell you.

but since we're in the age of "instant gratification is too slow" i'll
take a stab at it...

if i understand you correctly--you have a router (not running iptables)
that is forwarding port 80 to $INSIDE_MACHINE_IP and you're running
iptables on $INSIDE_MACHINE and need to know how to allow port 80
traffic in to it.  if that's correct:

  # start fresh--flush all rules and set filter policies to ACCEPT
  for t in mangle nat filter; do
    iptables -t $t -F
    iptables -t $t -X
    iptables -t $t -Z
  done
  for c in INPUT OUTPUT FORWARD; do
    iptables -P $c ACCEPT
  done

  # set the INPUT policy to DROP
  iptables -P INPUT DROP

  # allow input packets that are part of an established connection
  iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

  # allow HTTP requests in
  iptables -A INPUT -p tcp --syn --dport 80 -j ACCEPT

  # more rules, depending on your setup
  [ ... ]

  # allow loopback traffic
  iptables -A INPUT -i lo -j ACCEPT

  # log anything which is about to dropped by the chain policy
  iptables -A INPUT -m limit --limit 12/min --limit-burst 3 \
    -j LOG --log-prefix "FW DROP INPUT: "

-j

--
"Look, just give me some inner peace, or I'll mop the floor with ya!"
	--The Simpsons


