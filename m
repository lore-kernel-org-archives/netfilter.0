From: Jason Opperisano <opie@817west.com>
Subject: Re: log websites visited
Date: Fri, 01 Oct 2004 09:43:32 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096638211.22962.43.camel@wolfpack.ljm.dom>
References: <415D5063.4020707@datalux-spain.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <415D5063.4020707@datalux-spain.com>
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

On Fri, 2004-10-01 at 08:41, Vicent Gozalbes wrote:
> Hello to all, I'm new in this list.
> I have an iptables firewall running in a Debian system in my Office.
> I would like to view all websites visited (IPs or name) for my workers.
> it's possible with iptables without using a proxy-cache, isn't it?

if IP's are OK--you can use:

  iptables -A FORWARD -p tcp --syn -s $INSIDE_NET --dport 80 \
    -j LOG --log-prefix "HTTP REQUEST: "

you need to place that rule at a point in your ruleset where it will
actually catch the traffic you're interested in.

-j

disclaimer:  the rules contained in this message are meant to illustrate
the requested functionality only, and not intended as a recommendation
of best practices.  never execute any commands without fully
understanding the implications.

-- 
Jason Opperisano <opie@817west.com>


