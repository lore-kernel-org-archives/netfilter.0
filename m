From: Philip Craig <philipc@snapgear.com>
Subject: Re: NAT rules not clearing,  delays in loading
Date: Mon, 27 Feb 2006 11:44:55 +1000
Message-ID: <44025997.6080105@snapgear.com>
References: <43FF4744.8040706@codebest.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43FF4744.8040706@codebest.com>
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
To: Jeff Machesky <jeff@codebest.com>
Cc: netfilter@lists.netfilter.org

On 02/25/2006 03:49 AM, Jeff Machesky wrote:
> When rule #1 is first put in place the packets do not start to route 
> right away,  they often take up to a minute or so to take hold.  Once in 
> a while I'll get lucky and the rule appears to take effect right away.  
> This is verified by ethereal dumps.
> 
> The other problem,   after removing rule #1 or for that matter flushing 
> the entire nat chain (iptables -t nat -F) the rules will keep working 
> for several minutes.

This is probably due to the conntrack entry still existing.
The new NAT rules are not applied until the conntrack expires.
Check this with 'cat /proc/net/ip_conntrack'.

The relatively new conntrack tool can delete them
(and provides a faster way of listing them too).
http://netfilter.org/projects/conntrack/downloads.html


