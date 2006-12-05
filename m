From: "Matt" <Matt@PlumSoftware.co.uk>
Subject: RE: NAT & Multihoming Problem
Date: Tue, 5 Dec 2006 11:34:48 -0000
Message-ID: <117F5E7DA31C17478948DC39E01B948B400F22@frost.PlumSoftwareLtd.local>
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
To: netfilter@lists.netfilter.org

Thanks for your replies, Grant & Luis

Grant - sorry, I attempted to make the rules list shorter so I must have =
missed out some important rules.

The aim is that I'm trying to firstly get all traffic arriving at eth1 =
on the router to be NAT'd to an internal server and then replies sent =
back out on the same interface. Secondly - likewise for eth2 - all =
traffic arriving on eth2 to be replied on eth2, including any NAT'd =
traffic to the same internal server.

Luis suggested that I mark the packets... So after checking out chapter =
11 of the adv routing howto, I added the following lines:

$IPTABLES -t mangle -A PREROUTING -i eth1 -j MARK --set-mark 11
$IPTABLES -t mangle -A PREROUTING -i eth2 -j MARK --set-mark 12

These lines occur after the SNAT lines, though I've tried above and =
below and it seems to make no difference.

I also added the following routing rules:

ip rule add fwmark 11 table T1
ip rule add fwmark 12 table T2

It still doesn't work.

There is a broken link in sect 11 of the adv routing howto that mentions =
that marking "collides" with SNAT and that I must turn off the reverse =
path filter. Could someone tell me whether this is relevant here?

I would also like to mention that when I tcpdump on eth0, I can see the =
SYN packets arriving from my dial up account and being sent to the =
internal server, I can see the reply being sent from the internal server =
to the router and also a packet that duplicates the reply with the =
correct public IP of the dial up account... but for some reason this =
packet does not get sent out on eth2.

So I'm not sure whether this is a question for this list or a routing =
list... sorry.

Any help would be appreciated.

Thanks.

-----Original Message-----
From: Grant Taylor
Sent: 05 December 2006 02:58
To: Matt
Subject: Re: NAT & Multihoming Problem


On 12/04/06 11:15, Matt wrote:
> I hope someone can help - or at least tell me whether what I'm trying =
to do is possible!
>=20
> I have set up a linux box with 3 NICs, two external public IPs and one =
internal private IP. I set up the multihoming as per section 4.2 of the =
Advanced Routing HowTo. This seems to work OK without trying to do any =
NAT. (I've successfully pinged each public IP from a dial up connection =
on a laptop whilst the cable for the other NIC is disconnected)
>=20
> Things don't work when I try to add NAT to the picture. I want to do =
port forwarding on both public IPs to a single private IP. Is this =
possible at all?

I don't know for sure that this is all of your problem or not.  However =
one=20
thing that I do see is that you have a policy of DROP for your =
filter:INPUT=20
chain.  You do have a statefull rule to allow related / established =
traffic=20
in.  However, you do not appear to have any rules to allow new inbound =
traffic.

> What am I doing wrong? Or am I trying to do something impossible?



Grant. . . .

