From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: PREROUTING table and quota
Date: Fri, 14 Nov 2008 11:15:49 +0100
Message-ID: <491D4FD5.20906@plouf.fr.eu.org>
References: <1226578553.8310.40.camel@localhost.localdomain>	 <491C5FCE.9060001@plouf.fr.eu.org> <1226628691.3932.5.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1226628691.3932.5.camel@localhost.localdomain>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Michael a =E9crit :
>=20
> So I will have to implement some rules in the filter table.

Or in the mangle table.

> As far as I
> can tell, though, the only way to share a quota counter between rules=
 in
> the nat table and filter table is to implement it in userspace.  Is t=
his
> correct?

If you mean share the quota result with other rules, you can use the=20
MARK target to mark packets in the mangle table and test the packet mar=
k=20
with the mark match in other tables/chains.

# mark the packet if the quota is not exceeded
iptables -t mangle -A PREROUTING -m quota [...] -j MARK --set-mark 1
# test the mark
iptables -t nat -A PREROUTING -m mark [!] --mark 1 [...]
