From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Logging NAT Translations
Date: Fri, 08 Jun 2007 00:36:31 +0200
Message-ID: <4668886F.6080800@plouf.fr.eu.org>
References: <ae1f24730705182015j533102bah985e9ad0e905cd2a@mail.gmail.com>
	<Pine.LNX.4.61.0705222208440.4452@yvahk01.tjqt.qr>
	<ae1f24730706051910o2538955drfc7ec59cf9aa3927@mail.gmail.com>
	<Pine.LNX.4.61.0706060759470.1547@yvahk01.tjqt.qr>	<ae1f24730706060015j40c0fe5ek78a81c8816a0c5b5@mail.gmail.com>
	<Pine.LNX.4.61.0706071009200.1547@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0706071009200.1547@yvahk01.tjqt.qr>
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
>
>>>iptables -t nat -A ydm1 -j LOG "[Adress got SNATed to 134.76.13.21] "
>>>iptables -t nat -A ydm1 -j SNAT --to 134.76.13.21
>>>
>>>It already was a complete example. When you SNAT, you know you do.

Not always.
- A NAT may fail due to a conflict with an existing mapping, so you=20
believe you SNAT but actually don't. However I do admit that this=20
situation is unlikely to happen when you don't retrict the port range in=20
the SNAT target.
- Implicit SNAT may be performed to avoid conflict with an existing=20
rule, so you SNAT but do not know you do.

> I rarely need ranges, mostly because it does not RR over
> them like I thought it does :(

It used to, prior to kernel version 2.6.11. And I believe it still does=20
in the latest 2.4 kernel. But the developpers thought this behaviour was=20
not desirable because it broke some usages and replaced the round robin=20
with a hash so the same original source+destination pair always gets the=20
same address in the SNAT range.

