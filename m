From: Mark Ord <lists@losthorizons.mailshell.com>
Subject: Re: iptables local port forwarding
Date: Sun, 4 Apr 2004 21:03:41 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040404110341.GA13605@scholars.home>
References: <20040403095005.GA4511@scholars.home> <200404031127.02648.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200404031127.02648.Antony@Soft-Solutions.co.uk>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Sat, Apr 03, 2004 at 11:27:02AM +0100, Antony Stone wrote:

> That rule looks fine to me, and you must obviously have an appropriate INPUT 
> rule allowing the connection to port 80 after the REDIRECT has completed, 
> otherwise you wouldn't be able to connect directly to port 80 which you say 
> works fine.

Correct. I've further confirmed this by adding the rule as the final one
created (hence first in NAT's INPUT table), to isolate the output.
  iptables -I INPUT -j ACCEPT -p tcp --dport 81 -s 192.168.0.1 -d 192.168.0.1

Doing a "iptables -L -t filter -nvx" and "nc -s 192.168.0.1 192.168.0.1"
sees the packet count for that rule increment. IE:
 2028   121680 ACCEPT     tcp  --  * * 192.168.0.1   192.168.0.1  tcp dpt:81

The packets are certainly being accepted.

> The only thing I can think to ask is whether "iptables -L -t nat -nvx" shows 
> the packet/byte counters for this rule incrementing when you do try to access 
> port 81?

They're not. External connections do (elsewhere on the LAN, or from the
internet, but we already know that, as those redirects work), but connections
from the iptables machine never show up in the nat table. All the policies are
ACCEPT, and I've added a logging rule BEFORE the redirect - it appears it just
never gets to the nat table.

Checking out logging, and table listings, I can tell these packets do go
to the mangle table. However, that is a bit beyond me at this point.

Now that I have a bit more of an idea what is going on, I've done
another search, can hit this, which says that this actually isn't
possible, as the PREROUTING table is bypassed on local connections.

http://linux.org.mt/article/tomcat-ports

Thanks for your response,
Mark.
> 
> 

