From: Luciano Ruete <kies@myrealbox.com>
Subject: Re: Yet Another Kazaa Issue
Date: Thu, 21 Nov 2002 22:36:25 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DDD8A19.8000704@myrealbox.com>
References: <001001c2900d$fa96b2f0$0200000a@parseerror.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>
Cc: arnt@c2i.net

Matias Bj=F8rling escribi=F3::
> Hey
> =20
> Im trying like hell to get Kazaa to stop connect successfully...=20
> Whatever i do, blocking port 1214 in ANY possible way, it still resist=20
> and connect sucessfully, even with thoes firewall rules

I did two thing (in diferent situations) that works very well.

1=BA hit the kazaa Achilles heel --> the centralized server

iptables -A FORWARD (...) -d 206.142.53.0/24 -j REJECT
iptables -A FORWARD (...) -d 213.248.112.0/24 -j REJECT

This work 4 me, i dont know if the nets are the same today, but 'try and=20
tell!' or google it =3D)

2=BA i have CBQ'ed both incoming and outcoming kazaa traffic, you can=20
drive the thins as far as you whant, and give 1kbit to all the kazaa=20
conections behind de router/firewall.
Here is my conf to cbq.init (the most simple case)
Two files, 1 for up, 1 for down

/etc/sysconfig/cbq/cbq-120.kazaa-up
DEVICE=3Deth0,10Mbit,1Mbit
RATE=3D120Kbit
WEIGHT=3D12Kbit
PRIO=3D5
RULE=3D:1214,
RULE=3D,:1214

/etc/sysconfig/cbq/cbq-240.kazaa-down
DEVICE=3Deth1,10Mbit,1Mbit
RATE=3D240Kbit
WEIGHT=3D24Kbit
PRIO=3D5
#RULE=3D:1214,
#RULE=3D,:1214

You can find cbq.init (a script/frontend to tc and CBQ classes) in
https://sourceforge.net/projects/cbqinit

The script is self documented

Regards

--
Luciano












