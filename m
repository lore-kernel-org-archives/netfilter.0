From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: NAT to one net, bridge to another
Date: Thu, 14 Sep 2006 14:53:57 +0200
Message-ID: <450950E5.40609@plouf.fr.eu.org>
References: <200609081250.32329.mike@v6.gaima.co.uk>	<45093FEB.3050305@plouf.fr.eu.org>
	<200609141307.45172.mike@v6.gaima.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200609141307.45172.mike@v6.gaima.co.uk>
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

Mike Williams a =E9crit :
>=20
>>The bridge catches incoming ethernet frames before the IP stack can see
>>them. So an ethernet frame forwarded from colo to public does not hit
>>the IP stack, unless it is an ethernet broadcast.
>=20
> Or destined for an IP/MAC assigned to the bridge interface?

If a unicast ethernet frame is destined for the MAC address assigned to=20
the bridge interface, there is no reason that it is forwarded from an=20
interface of the bridge to another. Ethernet broadcast is an exception=20
because the frame is forwarded to all the other interfaces of the bridge=20
and to the IP stack. I guess that multicast ethernet frames have a=20
special processing too, but I don't know much about this subject.

> That also explains the necessity for ebtables in addition to ip[6]table=
s.

Yes, ip[6]tables works at the the network layer (routing) and ebtables=20
at the link layer (bridging).

