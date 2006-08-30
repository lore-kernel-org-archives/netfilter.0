From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: [MASQUERADING] iptables keeps sending from old IP after ppp0's
 IP has changed
Date: Wed, 30 Aug 2006 15:01:44 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0608301500440.4610@yvahk01.tjqt.qr>
References: <200608301407.55481.Daniel@musketa.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200608301407.55481.Daniel@musketa.de>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Musketa <Daniel@musketa.de>
Cc: netfilter@lists.netfilter.org

>
>Every night the router's ppp0 goes down and after about a minute up again with 
>a new IP. But iptables keeps on sending the NATted UDP packets _from_ the old 
>IP address. `iptables -F` and reloading the rules doesn't help. The only 
>workaround is to stop asterisk on the NAT client for about 2 minutes. 

That is how it is. The -t nat table is only consulted for NEW connections.

>Why isn't this table deleted when ppp0 goes down?

netfilter does not know it has gone down, I think.

>How can I force iptables to use ppp0's real IP address as sender IP in 
>outgoing packets?

Flush the conntrack table when ppp0 has gone up (yes, up)


Jan Engelhardt
-- 

