From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: Dropping RST of SYN
Date: 04 Sep 2003 11:13:20 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062666800.1615.23.camel@kermit>
References: <20030904183027.9CC5.ATNAK@chejz.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030904183027.9CC5.ATNAK@chejz.com>
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
To: Atsushi Nakagawa <atnak@chejz.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Don, 2003-09-04 um 10.50 schrieb Atsushi Nakagawa:
> What iptables table/rule can I use to drop RST (TCP) packets that're in
> reply to SYN?
> This is what I want it to do:
>=20
> -SYN->    [NEW]        -SYN->
>           [CLOSED]     <-RST-
>             ^
>           IF TCP & [NEW]: DROP '<-RST-' & SET [CLOSED]
Using the current state implementation, AFAIK this is not possible.
The RST is already an established packet. There is no way to
differentiate between this RST and a later valid and needed RST packet.
You can only drop all RST packets
-m state --state ESTABLISHED -p tcp --tcp-flags RST,ACK RST,ACK -j DROP

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

