From: Jason Opperisano <opie@817west.com>
Subject: Re: Can anyone tell me how to do this?
Date: Thu, 23 Sep 2004 13:31:05 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095960665.6715.23.camel@wolfpack.ljm.dom>
References: <20040923165847.46091.qmail@web51303.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040923165847.46091.qmail@web51303.mail.yahoo.com>
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

On Thu, 2004-09-23 at 12:58, Dominic Iadicicco wrote:
> Jason:
> 
>   Thats a perfectly good question.
> 
>    I am tring to learn how to use iptables.  I have
> read a lot of documentation but am not having to much
> success. So my whole goal in this is just to learn.
> :)
> 
> 
> Thanks.
> 
> Dom

this is not tested, but it works in my head:

  iptables -t nat -A PREROUTING -i eth1 -p tcp \
    -d 10.0.0.1 --dport 22 -j DNAT --to-destination 172.16.12.130

  # at this point, the netfilter code should treat this
  # packet as "locally-destined" and i *believe* will
  # never enter the FORWARD chain

  iptables -A INPUT -p tcp -d 172.16.12.130 --dport 22 -j ACCEPT

i'm pretty sure i recall reading somewhere that the INPUT vs. FORWARD
decision is solely based on IP, not interface.  so even though
conceptually it seems as though the packet would be "forwarded" from
eth1 to eth0, it's still just an INPUT packet, as it is destined for a
local IP (172.16.12.130)...  the "IN=" in a log entry should still show
eth1, i think...

let us know how it goes.

-j

-- 
Jason Opperisano <opie@817west.com>


