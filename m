From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ICMP and connection tracking
Date: Thu, 20 May 2004 16:37:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405201637.10513.Antony@Soft-Solutions.co.uk>
References: <40ACC986.8060103@pbl.ca>
Reply-To: Netfilter User Mailinglist <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40ACC986.8060103@pbl.ca>
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
To: Netfilter User Mailinglist <netfilter@lists.netfilter.org>

On Thursday 20 May 2004 4:06 pm, Aleksandar Milivojevic wrote:

> Are ICMP packets related to new and established TCP connections and UDP
> traffic considered to be part of them,

An ICMP packet which is returned in response to a previously sent TCP or UDP 
packet is considered to be RELATED.

ICMP packets are often regarded as the "error messages" of the Internet, and 
usualy arise in relation to UDP packets (which don't have their own 
error-detection and correction mechanism), rather than TCP packets (which 
have things like the SYN, SYN-ACK, ACK three way handshake, and sequence / 
acknowledgement numbers to ensure reception of what got sent).

> or do I need to have explicit rules like
>
>     -A INPUT -p icmp -m state --state RELATED -j ACCEPT
>
> for things like path MTU discovery, traceroute, ICMP port unreachables,
> and so on to work properly?

Nothing wrong with the above rule, however remember that it isn't only ICMP 
packets which are considered to be RELATED - in an FTP connection, for 
example, the reverse (data) connection is considered to be RELATED to the 
original (control) connection, even though it's another TCP link, not ICMP.

> Any downsides of using generic rule like above (if it is needed)?

Most people use an even *more* generic rule:

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

Thus allowing back any sort of reply to a previously sent packet (controlled 
by the rules in your OUTPUT chain).

Regards,

Antony.

-- 
"I estimate there's a world market for about five computers."

 - Thomas J Watson, Chairman of IBM

                                                     Please reply to the list;
                                                           please don't CC me.


