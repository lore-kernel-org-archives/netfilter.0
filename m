From: =?ISO-8859-1?Q?Bj=F6rn_Schmidt?= <bj-schmidt@uni-paderborn.de>
Subject: Re: state: INVALID
Date: Wed, 24 Nov 2004 14:07:29 +0100
Message-ID: <41A48791.7010606@uni-paderborn.de>
References: <419E75B1.3030406@uni-paderborn.de>	
	<1100990773.3501.9.camel@hubcap.ljm.dom>	
	<419FD0BD.6000906@uni-paderborn.de>	
	<1101061543.3501.18.camel@hubcap.ljm.dom>	
	<41A11AD5.3080401@uni-paderborn.de>	
	<1101131121.13662.17.camel@hubcap.ljm.dom>	
	<41A2010A.9090601@uni-paderborn.de>	
	<20041122175440.GA31032@bender.817west.com>	
	<41A23EE6.4080804@uni-paderborn.de>	
	<20041122213910.GA31537@bender.817west.com>	
	<41A3007B.7090009@uni-paderborn.de>	
	<1101202285.3503.5.camel@hubcap.ljm.dom>
	<1101218753.12981.18.camel@hubcap.ljm.dom>
	<41A3AFC4.4030109@uni-paderborn.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41A3AFC4.4030109@uni-paderborn.de>
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
To: opie@817west.com, netfilter@lists.netfilter.org

Bj=F6rn Schmidt wrote:
> Jason Opperisano wrote:
>=20
>> just for my own edification--i installed that rule base on my wireless
>> laptop, which runs a VPN tunnel for all its traffic (but normally does
>> not use connection tracking), and it does work--so i don't think this is
>> a "bug" per se.
>=20
>=20
> Jason, it works with 2.6.3! Give me some time for some investigations...

It works with all kernels up to 2.6.8, but the patch "patch-2.6.9-rc1"
breaks iptables/ipsec (at least for me).

--=20
Greetings
Bjoern Schmidt


