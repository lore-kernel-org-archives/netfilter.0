From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: is it possible only with iptables
Date: Thu, 11 Dec 2003 10:05:29 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312111005.29112.Antony@Soft-Solutions.co.uk>
References: <200312101928.27882.petre@kgb.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312101928.27882.petre@kgb.ro>
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
To: netfilter@lists.netfilter.org

On Wednesday 10 December 2003 5:28 pm, Petre Bandac wrote:

> I have 2 linux machines - linux_1 and linux_2
>
> linux_1 has behind it a subnet with routable adresses (not private)
>
> I want that all the traffic incoming from the subnet behind linux_1 and
> going to port 80 to be redirected to linux_2, and from linux_2 go on the
> internet
>
> I presumed that a -j SNAT --to-source IP_linux_2 should be enough, but
> apparently it isn't

If you want to redirect packets which would normally go somewhere else, so 
that they go to machine linux_2 instead, this is either DNAT, or a routing 
table question (using something slightly more sophisticated than usual, such 
as source-based routing and iproute2).

DNAT will clearly send the packets to linux_2 for you, but then they won't go 
any further, because they've reached their destination.

> should I issue a SNAT rule on linux_2 too, or it should run something like
> squid there ?

Maybe you should run something like squid there - tell us why you want the 
port 80 packets specifically to go via linux_2 rather than any other route 
from linux_1 to the Internet....

Antony.

-- 
Most people are aware that the Universe is big.

 - Paul Davies, Professor of Theoretical Physics

                                                     Please reply to the list;
                                                           please don't CC me.


