From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: dhcrelay
Date: 29 Nov 2003 09:33:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070094796.1657.12.camel@kermit>
References: <1070067379.3fc7eeb32a181@paris-hme1>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1070067379.3fc7eeb32a181@paris-hme1>
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
To: zynkx <skydive@megamail.pt>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Sam, 2003-11-29 um 01.56 schrieb zynkx:
> i'm sure i have ip forward enabled, since gateway 2 is=20
> working fine and routing packets ok through the lan=20
> and to gateway 1. if it happened not to have ip=20
> forward enabled in gateway 2 i could never do=20
> masquerading from gateway 2 to gateway 1 :)
>=20
dhcrelay is a local application. It works as a proxy. You have to allow
incoming packets on broadcast and unicast address in your INPUT chain.
Again the OUTPUT chain must be open, too. DHCP is not forwarded.
> i'm gonna test it with no firewalling at all to see=20
> what happens ;))
It won't work.


Cheers,

Ralf

--=20
Ralf Spenneberg
RHCE, RHCX

Book: VPN mit Linux
Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

