From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: clearing basics: semi-OT
Date: 10 Apr 2003 10:21:14 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049984474.3010.249.camel@alpha.newkirk.us>
References: <20030410080650.GA1720@linux.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030410080650.GA1720@linux.localdomain>
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
To: Payal Rathod <linux@rpayal.cjb.net>
Cc: netfilter@lists.netfilter.org

On Thu, 2003-04-10 at 04:06, Payal Rathod wrote:
> Hi,
> I am trying to clear some of my basics. I am reading IP-Masquerading HOWTO. 
> In it these things were mentioned,
> 
> UNIVERSE="0.0.0.0/0"
> $IPTABLES -A INPUT -i lo -s $UNIVERSE -d $UNIVERSE -j ACCEPT
> 
> What exactly does 0.0.0.0/0 mean? And why should we be concerned with
> it? And what is the use of rule given after it?

The important part here is the /0, which means that NO bits of the
preceding IP are significant.  That means this will match any address. 
The second rule deals with the lo interface, local loopback.  This rule
lets the box talk to itself as much as it wants with any IP.  (although
actually 127.0.0.1 is the standard, and 127.0.0.0/8 is the valid range)

> INTNET="192.168.1.0/24"
> INTIP="192.168.1.1/24"
> 
> The first one means the entire network of 192.168.1.x? What exactly is
> the second one. Does it just means 192.168.1.1 then why "/24"?

First one - yep.  Second one means precisely the same thing.  It should
probably be 192.168.1.1/32, or with no mask at all, and is probably
intended to be used to indicate the IP of the internal (LAN-facing)
interface.

> And lastly,
> 
> $IPTABLES -N drop-and-log-it
> $IPTABLES -A drop-and-log-it -j DROP
> 
> Why was this rule made? And why was it "dropped"? What is the logic
> behind this? Shouldn't it be,
> $IPTABLES -P drop-and-log-it DROP

-N makes a new chain, and the -A adds a DROP rule to it.  -P policy
isn't valid for a custom chain, only the built-in chains.  The logic
here is that you could use
$IPTABLES -I drop-and-log-it 1 -j LOG
and then everything would be logged before dropping.  More useful would
be to use a --log-prefix to identify where the DROP came from, IE if it
was INPUT, OUTPUT, FORWARD, etc, and WHY it was dropped, but that would
mean individual LOG rules for each case.  (Or, log in the originating
chain...  which defeats the concept of _LOG_ and drop...)

> 
> Thanks a lot for the patience and bye.
> With warm regards,
> -Payal
> 
> p.s please make a cc to me too.

j



