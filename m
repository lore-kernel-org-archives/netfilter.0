From: "Derick Anderson" <danderson@vikus.com>
Subject: RE: interface vs ip
Date: Tue, 27 Sep 2005 08:36:14 -0400
Message-ID: <E656E2CC1C5AEB42ACB00EB83122C7742E2E2B@farmer.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: P theodorou <props666999@hotmail.com>, netfilter@lists.netfilter.org

=20

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of P=20
> theodorou
> Sent: Tuesday, September 27, 2005 7:33 AM
> To: netfilter@lists.netfilter.org
> Subject: interface vs ip
>=20
> Im new to this therefore i need to clarify the followings
>=20
> 1)can i send or recieve packets from interface to ip and vise versa
>=20
> or  only to interfaces and only to ips

Not sure if I understand this question but I'll give it a shot:

The short answer is you can send and receive packets from interface to
ip or vice versa. The long answer is that the details of this differ
depending on the chain you use. FORWARD is the only chain which supports
both -i and -o (inbound and outbound interfaces). The rest support
either -i or -o and I'll leave it up to you to determine how that works:

http://iptables-tutorial.frozentux.net/iptables-tutorial.html#GENERICMAT
CHES
=20
> 2)
>=20
> I want to let icmp packets from 192.168.0.1(eth1) to 192.168.1.1(eth2)
>=20
> is it safer to declare
>=20
> iptables -A INPUT  -i eth1   -o eth2 -J ACCEPT
>=20
> or
> iptables -A INPUT -s 192.168.0.1 -d 192.168.1.1
>=20
> Thank You

First of all -o is not valid for the INPUT chain.

Next, I'm going to assume by "safer" you mean more secure. I typically
use both -i/o and -s/d. Let's pretend you used the FORWARD chain instead
of INPUT up there, eth1's subnet is 192.168.0.0/24 and eth2's subnet is
192.168.1.0/24. You want to explicitly allow all of 192.168.0.1's
packets to 192.168.1.1. Your rule would look like this:

iptables -A FORWARD -i eth1 -o eth2 -s 192.168.0.1 -d 192.168.1.1 -j
ACCEPT

By itself this rule doesn't really help you but I think you get the
idea.

Derick Anderson

