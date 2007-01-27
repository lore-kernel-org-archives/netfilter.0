From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Dropped fin acks (iptables + lvs)
Date: Sat, 27 Jan 2007 17:19:44 +0100
Message-ID: <45BB7BA0.5030605@plouf.fr.eu.org>
References: <163461433411784@lycos-europe.com>
	<Pine.LNX.4.61.0701242315170.32656@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0701242315170.32656@yvahk01.tjqt.qr>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Jan Engelhardt a =E9crit :
>>I am running iptables and lvs on two boxes loadbalancing http[s] and ss=
h traffic to two real servers.
>>Everything is working just fine from the users point of view. However,=20
>>I keep seeing a lot of dropped packets of type ack/fin and ack/rst in=20
>>my iptables log. Seems like the connection tracking isn't working the=20
>>way I expect it to.
>=20
> RST-ACK is received as a response to SYN to a closed port, and hence, i=
s=20
> not part of a connection.

At Netfilter connection tracking level, ACK/RST in response to SYN is=20
part of a connection and is supposed to be in the ESTABLISHED state,=20
even though at TCP level the connection is not established.

