From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Iptables and bridging
Date: Thu, 06 Sep 2007 17:18:18 +0200
Message-ID: <46E01A3A.80308@plouf.fr.eu.org>
References: <DIIE.000009630004543A@aressi.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <DIIE.000009630004543A@aressi.fr>
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

Ludovic MARCILLY a =E9crit :
>=20
> i have a linux box with three ethernet card. I want to bridge eth0
> with eth2 and to have eth1 like a DMZ.
>=20
> Before, i was using linux-2.4.27 with iptables-1.2.11 and bridge
> patch. It was working very weel.
>=20
> Now, i have updating my kernel to 2.6.21.5 and iptables to version
> 1.3.7 and it does not work anymore.
>=20
> In my /var/log/message i can read some :
>=20
> kernel: physdev match: using --physdev-out in the OUTPUT, FORWARD and
> POSTROUTING chains for non-bridged traffic is not supported anymore.
>=20
> What does it means ? I can't do what i want with iptables? I must use
> ebtables ?

In kernel 2.6.18, the message was :

"physdev match: using --physdev-out in the OUTPUT, FORWARD and=20
POSTROUTING chains for non-bridged traffic is deprecated and breaks=20
other things, it will be removed in January 2007. See=20
Documentation/feature-removal-schedule.txt for details. This doesn't=20
affect you in case you're using it for purely bridged traffic."

The associated Documentation/feature-removal-schedule.txt states :

What: Bridge netfilter deferred IPv4/IPv6 output hook calling
When: January 2007
Why:  The deferred output hooks are a layering violation causing unusual
       and broken behaviour on bridge devices. Examples of things they
       break include QoS classifation using the MARK or CLASSIFY targets,
       the IPsec policy match and connection tracking with VLANs on a
       bridge. Their only use is to enable bridge output port filtering
       within iptables with the physdev match, which can also be done by
       combining iptables and ebtables using netfilter marks. Until it
       will get removed the hook deferral is disabled by default and is
       only enabled when needed.

And indeed this feature was removed in kernel 2.6.20.
What it means seems rather clear to me. Using --physdev-out for non=20
bridged traffic (i.e. locally generated or forwarded IP packets) going=20
out a bridge interface makes no sense because at the time a packet=20
traverses the OUTPUT, FORWARD or POSTROUTING chains it has not reached=20
the bridge interface yet and the physical output device (bridge port) is=20
unknown. It can only be used on bridged traffic, because the bridging=20
decision which determines the output port is made before the packet=20
enters the FORWARD and POSTROUTING chains.

The suggested workaround is to combine iptables and ebtables rules using=20
marks if matching non bridged traffic according to the output bridge=20
port is needed.

