From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: Help...
Date: Wed, 18 Dec 2002 17:00:03 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0212181656240.25941-100000@dns.toxicfilms.tv>
References: <20021218152354.94938.qmail@web13702.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021218152354.94938.qmail@web13702.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: manish <manishsoft@yahoo.com>
Cc: netfilter@lists.netfilter.org

> >iptables -t nat -A PREROUTING -i ppp0 -j DNAT
>  --to-destination 192.168.101.3
>
> This time i am able to call people from outside from
> machine C (192.168.101.3)and also able to do voice
> conversation in vat. But another side A and D are not
> able to talk to that person outside the network. Also
This looks obvious, as all the traffic comming back to you
from the Internet you are directing to C. All, means,
initiated by host A or B too.

> 1) What should i do so A, C, and D all together can
>   use to call outside and able to do voice
> conversation
>   in vat or vive-versa?
You would need a nat_helper for that protocol, so the router
stores connection information and knows which packets should be
sent to whom.

You could try directing the traffic from that protocol to a
local broadcast address (specify the port of the service),
maybe the applications can manage to filter out their packets
somehow by ID's.

What chat protocol is that?

Regards,
Maciej Soltysiak


