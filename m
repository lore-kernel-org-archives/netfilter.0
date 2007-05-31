From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Two NICs, same network...
Date: Fri, 01 Jun 2007 00:41:03 +0200
Message-ID: <465F4EFF.9010801@plouf.fr.eu.org>
References: <e53321d30705081317w3d7e6f5bsb38161f155c883da@mail.gmail.com>	<Pine.LNX.4.63.0705081251200.20281@qynat.qvtvafvgr.pbz>	<e53321d30705081402n2fa7e3c5pcd0ed7baeecebef4@mail.gmail.com>	<4641CC42.2000005@alpha2.com>	<e53321d30705241312l6aee149bp3557f72476940bc@mail.gmail.com>
	<e53321d30705311516w353ffebbhcc0cacdde6d3fe67@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e53321d30705311516w353ffebbhcc0cacdde6d3fe67@mail.gmail.com>
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

semi linux a =E9crit :
>=20
> Let me ask this question another way - How to I setup my machine to
> use one interface (eth0) for ALL traffic with the exception of one IP
> destination/source port (which is on eth1)?

You need to setup a routing policy.

> Is this an iptables thing or is it a routing table thing?

Both.

> Can someone point me in the right direction?

Linux Advanced Routing & Traffic Control (LARTC) HOWTO.
Chapters 4 & 11.

