From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: DMZ to DMT through ROUTER problem !
Date: Thu, 20 May 2004 13:30:31 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405201330.31625.Antony@Soft-Solutions.co.uk>
References: <200405201318.34706.liste@zerozone.it>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405201318.34706.liste@zerozone.it>
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

On Thursday 20 May 2004 12:18 pm, O-Zone wrote:

> i've a big problem. Here's a little diagram:
>
> [INTRANET 10.0.0.0/24]-------------+
>                                                       +--[ROUTER]--(NET)
> [DMZ SERVER A - 192.168.0.2]----+
> [DMZ SERVER B - 192.168.0.3]----+
>
> Each DMZ server is mapped to it's PUBLIC IP. For example:
>
> 151.8.47.A ----> 192.168.0.2
> 151.8.47.B ----> 192.168.0.3
>
> and all work perfectly !!!
>
> The problem is when, from 192.168.0.2, i try to connect to 151.08.47.B
> (trat's mapped to 192.168.0.3): packets die on ROUTER.

It's the reply packets which are the problem.

Think about a TCP connection:

1. SYN packet from 192.168.0.2 to 151.8.47.B goes to the firewall.
2. Firewall DNATs 151.8.47.B to 192.168.0.3
3. SYN packet goes from firewall to 192.168.0.3
4. 192.168.0.3 sends SYN-ACK to 192.168.0.2 on local net (not via firewall)
5. 192.168.0.2 wonders why it got a SYN-ACK from 192.168.0.3 when it sent the 
SYN to 151.8.47.B

http://www.netfilter.org/documentation/HOWTO/NAT-HOWTO-10.html

Regards,

Antony.

-- 
"The problem with television is that the people must sit and keep their eyes 
glued on a screen; the average American family hasn't time for it."

 - New York Times, following a demonstration at the 1939 World's Fair.

                                                     Please reply to the list;
                                                           please don't CC me.


