From: Taylor Grant <gtaylor@riverviewtech.net>
Subject: Re: SNAT and IPSEC
Date: Wed, 13 Apr 2005 18:50:37 -0500
Message-ID: <425DB04D.4060304@riverviewtech.net>
References: <1113329293.29536.13.camel@fly.in.iantel.com.uy>
	<1113408523.8270.16.camel@plasma.starken.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1113408523.8270.16.camel@plasma.starken.com>
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
To: Daniel Wittenberg <daniel-wittenberg@starken.com>
Cc: netfilter@lists.netfilter.org

> Couldn't he just SNAT the packets on his side when they become un-
> encapsulated?  I'm doing this on a couple of my vpn links.

I don't think that you could just SNAT the packets that are on the way out because as I understand it SNAT happens in nat:POSTROUTING *after* the routing decision has been made.  I had originally thought that the IPSec traffic did pass through IPTables a couple of times, once unencrypted and then again encrypted.  But based on the LOG entries that he has presented the traffic only passes through IPTables one time on it's way out, and a couple of times on it's way in.  Seeing as how the traffic is only passing through IPTables one time on it's way out, it is coming in to the system from the LAN and immediately going in to the IPSec stack and being encrypted and then sent out directly, leaving no chance for it to be SNATed before it enters the IPSec stack.  Reportedly there are some kernel patches to fix this issues thus causing the packets to traverse IPTables twice, once unencrypted and 
 once encrypted.  If the packets did indeed pass through IPTables twice they could be SNATe
d before they did enter the IPSec VPN.  The only caveat would be that the IPSec VPN would have to be configured to allow traffic from the 10.3.3.x/24 network vs his 10.2.2.x/24 network, this would have to be done on both ends too.



Grant. . . .

