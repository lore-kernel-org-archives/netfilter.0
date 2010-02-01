From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: How to debug RST filter ?
Date: Mon, 01 Feb 2010 19:54:51 +0100
Message-ID: <4B67237B.4070900@chello.at>
References: <L749C3EBF46964d4a9E404BAF2BFD837F.1265011977.scalix01.aarboard.ch@MHS>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <L749C3EBF46964d4a9E404BAF2BFD837F.1265011977.scalix01.aarboard.ch@MHS>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

On 01.02.2010 09:13, netfilter-owner@vger.kernel.org wrote:
> Hello,
>=20
>> Can you see "RULE 17"?
>=20
>=20
> Rule 17 is the final deny everything else rule.
> Rule 15 is the one which should allow everything "local" on the firew=
all
>=20
> #
> # Rule 15 (global)
> #
> echo "Rule 15 (global)"
> #
> #
> #
> $IPTABLES -N Cid4A4A84F123430.0
> $IPTABLES -A INPUT  -s myip   -m state --state NEW  -j Cid4A4A84F1234=
30.0
> $IPTABLES -A INPUT  -s 127.0.0.1   -m state --state NEW  -j
> Cid4A4A84F123430.0
> $IPTABLES -A Cid4A4A84F123430.0  -d myip   -j ACCEPT
> $IPTABLES -A Cid4A4A84F123430.0  -d 127.0.0.1   -j ACCEPT
> $IPTABLES -N Cid4A4A84F123430.1
> $IPTABLES -A OUTPUT  -s myip    -m state --state NEW  -j Cid4A4A84F12=
3430.1
> $IPTABLES -A OUTPUT  -s 127.0.0.1   -m state --state NEW  -j
> Cid4A4A84F123430.1
> $IPTABLES -A Cid4A4A84F123430.1  -d myip   -j ACCEPT
> $IPTABLES -A Cid4A4A84F123430.1  -d 127.0.0.1   -j ACCEPT
>=20
>=20
>=20
> #
> # Rule 17 (global)
> #
> echo "Rule 17 (global)"
> #
> #
> #
> $IPTABLES -N RULE_17
> $IPTABLES -A OUTPUT  -j RULE_17
> $IPTABLES -A INPUT  -j RULE_17
> $IPTABLES -A RULE_17  -j LOG  --log-level info --log-prefix "RULE 17 =
-- DENY
> " --log-tcp-sequence  --log-tcp-options  --log-ip-options
> $IPTABLES -A RULE_17  -j DROP
>=20
>=20
> As we normaly can connect, but just a few random connection don't wor=
k,
> I assume that there is some timeout or some entries flushed somewhere=
 in
> the filter stuff.
>=20
>=20
> Andr=E9

shot in the dark, try to insert into rule 17:
$IPTABLES -I RULE_17 -o lo -m state --state INVALID -j LOG \
--log-level info --log-prefix "RULE 17 -- INVALID" --log-tcp-sequence \
--log-tcp-options --log-ip-options

and see if it matches the other logged packets.
if so, these packets are classified as invalid by the connection tracke=
r.

best regards


Mart
