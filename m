From: Jason Opperisano <opie@817west.com>
Subject: Re: FTP Connection State Tracking Issue
Date: Mon, 29 Nov 2004 10:14:23 -0500
Message-ID: <1101741263.10064.52.camel@hubcap.ljm.dom>
References: <1101748780.12476.3083.camel@ashutosh.teneoris.com>
	<1101739147.10064.47.camel@hubcap.ljm.dom>
	<1101752397.12476.3097.camel@ashutosh.teneoris.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1101752397.12476.3097.camel@ashutosh.teneoris.com>
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

On Mon, 2004-11-29 at 13:19, Ashutosh wrote:
> > no--but you need to write scripts like this:
> > 
> >   iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

allows packets that match connections in the conntrack table

> >   iptables -A FORWARD -p tcp --syn --dport 21 -j ACCEPT

allows FTP connections outbound

> Well, I thought the Connection Tracking and NAT Modules *for* FTP did
> the same.. Correct me if I am wrong..

connection tracking does not write filter rules for you.

> After all, why are the ALGs neccessary, if *user space* iptables rules
> are still required ?

i don't understand this question.  what "ALGs" are you speaking of? 
iptables rules are necessary to allow/deny traffic; as that's how you
get firewalls to do what you want (ideally).

-j

--
"I'm better than dirt. Well, most kinds of dirt... not that fancy
 store-bought dirt... that stuff's loaded with nutrients, I... I
 can't compete with that stuff."
	--The Simpsons


