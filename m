From: Jason Opperisano <opie@817west.com>
Subject: Re: netfilter logging
Date: Fri, 10 Jun 2005 14:02:14 -0400
Message-ID: <20050610180214.GA6185@bender.817west.com>
References: <5885.212.100.225.55.1118237133.squirrel@webmail.*>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <5885.212.100.225.55.1118237133.squirrel@webmail.*>
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

On Wed, Jun 08, 2005 at 02:25:33PM +0100, Jimmy wrote:
> Hello,
> 
> I have just started to log my iptables drops. As seen with this line in my
> iptables-save output.
> 
> -A INPUT -j LOG --log-level 1
> -A INPUT -j LOG --log-prefix "Dropped: "
> 
> What I would like to know is how I can get iptables to NOT log to console
> only to the message logs. Currently it goes into /var/log/syslog

change your log level from 1 to something less critical; like say, 4.

and then type this on the console:

  dmesg -n 1

which will only print truly critical messages to the console (level 0
and 1).

-j

--
"Woman: Stewie, you want a cookie?
 Stewie: I smell death on you."
        --Family Guy

