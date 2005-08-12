From: "J.T. Moore" <jtmoore@international-auto.com>
Subject: Re: Forwarding packets on same interface (echoing)
Date: Fri, 12 Aug 2005 12:40:36 -0400
Message-ID: <00f601c59f5c$92dd2020$1500a8c0@domain.internationalauto.com>
References: <5edf245205081204055a3363f2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: Martin van den Berg <martinvdberg@gmail.com>, netfilter@lists.netfilter.org

Martin,

The following will work if you want the packets coming to 1.2.3.4 to be =
redirected to 10.10.1.2

    iptables -t nat -A PREROUTING -i eth1 -d 1.2.3.4 -p udp --dport =
30000:32000 -j DNAT --to-destination 10.10.1.2

If you want the reply from 10.10.1.2 to be change to look like it came =
from 1.2.3.4 you have two choices based on your network setup

1. 10.10.1.2 routes its replies through the same machine using iptables =
to do the DNAT above. This makes life simple because the iptables =
machine will track the DNAT connection and change the source address in =
the replies from 10.10.1.2 back to 1.2.3.4 automatically

or

2. Run iptables on 10.10.1.2 or another machine between 10.10.1.2 and =
the clients and SNAT responses to the client from 10.10.1.2 to 1.2.3.4. =
This can potentially get complicated and ugly, but it can be done


J.T.

----- Original Message -----=20
From: "Martin van den Berg" <martinvdberg@gmail.com>
To: <netfilter@lists.netfilter.org>
Sent: Friday, August 12, 2005 7:05 AM
Subject: Forwarding packets on same interface (echoing)


G'day,

I have this NAT/firewall box (debian) configured with iptables. Port
forwarding etc works fine for one exception: A need a rule that
'echoes' back udp packets if they meet the following criteria:
+ in-interface=3Deth1 (that's the 'private' interface)
+ destination IP is public ip-address (e.g. 1.2.3.4) (that's eth0)
+ Port range is e.g. 30000-32000
+ The packets need to be forwarded via eth0 (thus echoed) to e.g.
10.10.1.2, same port.

Hope you can help me and thanks in advance!

Martin.




