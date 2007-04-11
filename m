From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Time module included in the default Fedora
Date: Wed, 11 Apr 2007 19:55:31 +0200
Message-ID: <461D2113.8070402@plouf.fr.eu.org>
References: <b317600c0704110750x30861e6ft6cd0a53d415cba74@mail.gmail.com>	<b317600c0704110752g2f9a82a1x8b18adaae15f775e@mail.gmail.com>,
	<1165438164.4846.3.camel@localhost.localdomain>
	<Pine.LNX.4.61.0704111749490.32056@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0704111749490.32056@yvahk01.tjqt.qr>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Hello,

Jan Engelhardt a =E9crit :
>=20
> iptables is not the same as netfilter (=3D the kernel part).

A part of iptables is in the kernel, in the Netfilter framework.=20
Iptables is divided in two parts :
- a userspace tool (iptables) which allows to manage the rules ;
- a kernel part (ip_tables, iptable_filter...) which enforces the rules.

