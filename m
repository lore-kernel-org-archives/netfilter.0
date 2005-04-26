From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: difference between DROPped pings and non existing hosts
Date: Tue, 26 Apr 2005 17:12:21 -0500
Message-ID: <426EBCC5.500@riverviewtech.net>
References: <426E8530.6080203@lopsch.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <426E8530.6080203@lopsch.com>
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@lists.netfilter.org

> I would like to know how ICMP distinguishes between DROPped pings and=20
> non existing hosts. Both times you don=C2=B4t get a reply from the=20
> destination host but if it doesn=C2=B4t reply because it doesn=C2=B4t e=
xist you=20
> get the correct destination unreachable message if it drops the request=
s=20
> for example with IPTables you get a timeout. And I haven=C2=B4t a clue =
why=20
> this is so.

Just because you get an ICMP Host Unreachable message does not mean that =
the host is not there or that the router can not reach it.  You should pr=
obably check the source IP on the ICMP message.  I've had a discussion (w=
ith little feed back) on this list to this very effect.  If the host that=
 you are trying to reach wants to it can REJECT the packet with icmp-host=
-unreachable it can do so in lieu of DROPing the packet.  In this situati=
on you do see an ICMP Host Unreachable message, just from the IP address =
of the host in question that you are trying to reach, thus you know that =
someone is playing with you trying to make it so that you don't think the=
 host in question is there.



Grant. . . .


