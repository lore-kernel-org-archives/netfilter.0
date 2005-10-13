From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: DNAT problems using a single interface
Date: Thu, 13 Oct 2005 23:42:52 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510132338170.22615@filer.marasystems.com>
References: <434D8802.40702@satchell.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <434D8802.40702@satchell.net>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Stephen Satchell <list@satchell.net>
Cc: netfilter@lists.netfilter.org

On Wed, 12 Oct 2005, Stephen Satchell wrote:

> IPTABLES TO THE RESCUE!  In each of the 31 servers, put a set of firewall 
> rules to DNAT up to 200 IP addresses to the gateway server, let the TCP 
> communications on port 25 (and other well-known mail ports) happen, and put a 
> back-channel using another port for mail that needs to go to that server for 
> storage, future pick-up, forwarding, list explosion, and autoresponder 
> processing.
>
> I can't get it to work.


Do I understand you correctly that you DNAT on the servers themselves and 
not on a firewall infront of them?

To DNAT in a one-legged setup you need to be very careful. Return traffic 
also has to go via the DNAT point.

The simplest way is to also SNAT the traffic to the servers own IP address 
but this has the drawback that the original client IP is lost.

The more advanced method is to DNAT to a "gateway server" private IP 
address unique for this specific server (private == only used for the 
DNAT between this server and the "gateway"), and on the "gateway server" 
use policy routing to route traffic from that private IP back to the 
correct server who DNAT:ed the traffic.


Regards
Henrik



