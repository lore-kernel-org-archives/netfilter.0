From: Jason Opperisano <opie@817west.com>
Subject: Re: LOG Rate Limit Problem
Date: Mon, 04 Oct 2004 21:15:29 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096938929.1787.13.camel@wolfpack.ljm.dom>
References: <Pine.LNX.4.58.0410042052580.10057@ris713.UniXpress.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0410042052580.10057@ris713.UniXpress.com>
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

On Mon, 2004-10-04 at 21:04, Lucky Leavell wrote:
> iptables v1.2.8
> OS: SuSE 9.1
> 
> After reading several references here on rate limiting logging I tried the 
> following short chain which was intended to log a packet subject to the 
> rate limit and then drop it unconditionally:
> 
> -A LogDrop  -m limit --limit 2/s -j LOG --log-prefix "ICMP:Drop "
> -A LogDrop -physdev --physdev-in eth0 -j DROP
> -A LogDrop -physdev --physdev-in eth1 -j DROP

the 2nd and 3rd rules are not syntactically correct.  proper syntax:

  iptables -A LogDrop -m physdev --physdev-in eth0 -j DROP
  iptables -A LogDrop -m physdev --physdev-in eth1 -j DROP

is this a bridging firewall?  the physdev match is for bridged
interfaces.  if this is a routing firewall, this should suffice:

  iptables -A LogDrop -i eth0 -j DROP
  iptables -A LogDrop -i eth1 -j DROP

> However, the first statement not only logged the packets subject to the 
> rate limit but also acted as an implicit ACCEPT.  

nope.  "-j LOG" is a non-terminating match.  it won't drop or accept the
packet, just log it.

> My understanding was 
> that the logging should take place but then the packets should be dropped 
> unconditionally by one of the following DROPs. When the LOG statement was 
> commented out, the packets were dropped as desired.

there's something else going on.  and "unconditionally" is a bit
strong--you've certainly placed a condition on the inbound interface. 
an "unconditional" drop would be:

  iptables -A LogDrop -j DROP

> I have reread my documentation and still do not see where my mistake is.
> Could someone please enlighten my understanding>

post your rules[1] and explain your testing methodology.

-j

[1] iptables -t mangle -vxnL && iptables -t nat -vxnL && iptables -vxnL

-- 
Jason Opperisano <opie@817west.com>


