From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: Masquerade problems
Date: 15 Dec 2003 14:05:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071493500.1740.15.camel@kermit>
References: <BAY8-F102WSsKt3NwAY00036ab1@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY8-F102WSsKt3NwAY00036ab1@hotmail.com>
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
To: john bowers <johnkbowers@hotmail.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Mon, 2003-12-15 um 12.34 schrieb john bowers:
> Is this a routing problem or am I misusing the=20
> Masquerade function? when Any help would greatly be appreciated as I don'=
t=20
> know where else to ask
> iptables --policy OUTPUT DROP
> iptables -A OUTPUT -o lo -j ACCEPT
> iptables -A OUTPUT -o eth0 \
> 	-m state --state ESTABLISHED,RELATED -j ACCEPT

You are missing an OUTPUT rule:
iptables -A OUTPUT -o eth0 -m state --state NEW -j ACCEPT

Cheers,

Ralf
--=20
Ralf Spenneberg
RHCE, RHCX

Book: VPN mit Linux
Book: Intrusion Detection f=FCr Linux Server   http://www.spenneberg.com
IPsec-Howto				     http://www.ipsec-howto.org
Honeynet Project Mirror:                     http://honeynet.spenneberg.org

