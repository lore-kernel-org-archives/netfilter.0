From: Jason Opperisano <opie@817west.com>
Subject: Re: Host blocking
Date: Tue, 17 May 2005 09:44:41 -0400
Message-ID: <20050517134440.GA1022@bender.817west.com>
References: <003b01c55acb$841114a0$f00aa9c0@winxp>
	<20050517131415.GA844@bender.817west.com>
	<001701c55ae5$d1042e90$f00aa9c0@winxp>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <001701c55ae5$d1042e90$f00aa9c0@winxp>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, May 17, 2005 at 04:39:14PM +0300, Wennie V. Lagmay wrote:
> What if they define the ip address instead of domain name? How can I 
> block/accept  both domain name and ip address?

iptables rules only contain IP addresses, not host names.  in my example
rules, proxy.ourcompany.net and proxy.ISP.net represent the IP addresses
for those hosts.  you can use an FQDN in an iptables rule, but the FQDN is
resolved to an IP address (or addresses) at the time the rule is loaded,
and the rule will only use that IP address (or addresses) going forward.

-j

--
"Chris: Dad, what's the blowhole for?
 Peter: I'll tell you what it's not for. And when I do, you'll understand
 why I can never go back to Sea World."
        --Family Guy

