From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: ipsec NAT pass through rule(s)?
Date: Mon, 11 Dec 2006 10:46:45 +0100
Message-ID: <1165830405.28768.38.camel@anduril.intranet.cartel-securite.net>
References: <5cc9c8f90612091547r4dd21922i8bf63d84b9c59c8@mail.gmail.com>
	<1165747742.5125.15.camel@anduril.intranet.cartel-securite.net>
	<5cc9c8f90612102233g68f9b03o88e68614d0082445@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5cc9c8f90612102233g68f9b03o88e68614d0082445@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: rabbtux rabbtux <rabbtux@gmail.com>
Cc: netfilter@lists.netfilter.org

Le dimanche 10 d=E9cembre 2006 =E0 22:33 -0800, rabbtux rabbtux a =E9crit :
> Cedric,  I understand how to do nat to IPSEC ports and all others.  My
> question is about any special rules required so that the encrypted
> ipsec TCP headers don't get mangled?

TCP headers can't get mangled as they're protected by ESP. That's the
whole point of IPSEC ;) BTW, your question seems more about "how to NAT
IPSEC" than Netfilter related. Basicly, there are two situations in
which you'll break things NATing IPSEC:

	1. AH. As AH protects whole IPSEC packet including IP header,
	   NATing such packets will break AH verification. Therefore, AH
	   does not cope with NAT at all.

	2. TCP in ESP transport mode. As transport mode only
	   encapsulates IP payload (e.g. TCP, UDP, ICMP layers) and
	   TCP checksum is computed with IP addresses, crossing NAT will
	   break TCP checksum verification as it is protected by ESP (so
	   you can't mangle it to reflect your NAT). Therefore, ESP
	   transport mode does not cope with NAT, unless you disable TCP
	   checksum verification, which is a pretty bad idea to me.

So, at the end of the day, if you want IPSEC to cross NAT, your only
option is ESP tunnel mode only[1]. And it won't affect Netfilter ruleset
in any way as most packet is encrypted. The only thing Netfilter could
do about IPSEC is looking at SPI to ensure there's no SPI collision
between two concurrent IPSEC tunnels with the same external gateway, but
it won't help much in the end if it happens...


[1] NAT-T being ESP tunnel mode over UDP for gateways refusing other IP
    protocols than TCP/UDP/ICMP.

--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

