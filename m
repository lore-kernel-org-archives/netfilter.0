From: Philip Craig <philipc@snapgear.com>
Subject: Re: protocol 50 unreachable
Date: Fri, 03 Dec 2004 16:35:59 +1000
Message-ID: <41B0094F.2010602@snapgear.com>
References: <Pine.LNX.4.44.0412021120210.25230-100000@gollum.grajagan.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0412021120210.25230-100000@gollum.grajagan.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Helge Weissig <helgew@grajagan.org>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

Helge Weissig wrote:
> I mean with "incomplete" that the tcpdump traffic I see does not show up 
> in the logs. I used your rules at the end of your reply and see the same 
> thing: ESP from VPN_SERVER hits $EXTIF, triggers the "protocol 50 
> unreachable" icmp response and no log entry ever shows up in the kernel 
> log from the iptables log rule. I am suspecting that your option 3) is 
> indeed the problem.
> 
> h.

It is possible that a conntrack already exists, or the packet can't be
conntracked, so the packet doesn't pass through nat PREROUTING.

Try putting the log rule in the mangle PREROUTING chain.
If they do match a log rule here, check if they are invalid
with -m conntrack --ctstate INVALID.

Also check if there are any esp conntracks in /proc/net/ip_conntrack

-- 
Philip Craig - SnapGear, A CyberGuard Company - http://www.SnapGear.com

