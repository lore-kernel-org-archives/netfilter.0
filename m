From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: host names and IPs
Date: 18 Apr 2003 11:41:49 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1050680509.6664.27.camel@alpha.newkirk.us>
References: <003301c305a1$c04ab1a0$0500a8c0@effenberger>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003301c305a1$c04ab1a0$0500a8c0@effenberger>
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
To: Florian Effenberger <floeff@arcor.de>
Cc: netfilter@lists.netfilter.org

On Fri, 2003-04-18 at 07:57, Florian Effenberger wrote:
> Hi,
> 
> I have a question to the gurus on this list ;-)
> 
> I'm on Linux 2.4.20 with iptables 1.2.7a. I have a syntax as follows:
> 
> ===
> iptables -A INPUT -p tcp -s www.myhostname.com --dport 53 -j ACCEPT
> ===
> 
> Now it seems that www.myhostname.com is resolved only the first time the
> rule is set and that a fixed IP address is stored.

Correct.

> However, www.myhostname.com has a dynamically assigned address and I would
> like to have iptables resolve the IP address everytime.

Same here... :^(

> Is that possible? If yes, how? Or will it produce too much load?

Iptables/netfilter does not, AFAIK, support this at all.  I have a
similar situation, and found two solutions.

The one I implemented was to map out the range of dynamic IPs assigned
(ISP refused to disclose!) and ended up using a /22 netmask.  Not as
tight, but simpler and less overhead than:

The other approach was to write a script (cron scheduled) that would
extract the IP from 'dig' output and compare it against a stored value
from the last change (/tmp/myhostname.com.ip perhaps).  If the same do
nothing. If different, delete the original rule, insert a
newly-constructed one, and echo the new IP to the tmp file.  Depending
on the lease-length (or whatever other factor may determine lifespan of
a given IP for www.myhostname.com...) and frequency of expected
connections, you'd set the frequency of the job accordingly.

Depending on what services are being made available to
www.myhostname.com, the first solution is probably your best bet so long
as it doesn't open up anything critical.  For my case, the rule only
opens SSH, and only a single non-root user can login with SSH on that
box.  (and all SSH access is logged)

The third solution, of course, would be to dig into the source and write
a new match, or patch the "-s" match with a new flag like "--dynip" and
the obvious support to enable that... ;^)  Checking the current IP of a
named host for every packet would be impossible.  The only feasible
solution here would be to integrate the effect of the cron job approach
into the netfilter code, periodically confirming the IP and updating if
needed.

> Thanks
> Florian

j



