From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: Server can't send :-/
Date: 03 Sep 2003 15:43:20 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062596599.18242.19.camel@kermit>
References: <002b01c371ee$db4b0db0$0000fea9@kessler.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002b01c371ee$db4b0db0$0000fea9@kessler.local>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Stephan Kessler <stephankessler@gmx.de>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Mit, 2003-09-03 um 09.41 schrieb Stephan Kessler:
> Hi List,
>=20
> I got that Configuration of my Firewall:
> http://warpy.yomeganet.biz/fw.txt
>=20
> It seemed to be nice, everything worked but then i tried to initiate
> outbound Traffic from my Server via SSH. The result: I can't establish
> any connection from my to an another, except DNS (via UDP?). What did i
> wrong?
I suspect your machine is warpy.yomeganet.biz. The last input rule drops
all incoming tcp-traffic. You a just accepting traffic going to
22,80,21,20,etc.
Since I do not actually understand your ruleset, you just might want to
insert the following rule before this DROP rule=20
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

