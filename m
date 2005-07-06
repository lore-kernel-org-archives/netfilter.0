From: Brent Clark <bclark@eccotours.dyndns.org>
Subject: Re: cant ping fw
Date: Wed, 06 Jul 2005 14:04:09 +0200
Message-ID: <42CBC8B9.8090605@eccotours.dyndns.org>
References: <42CBBE57.5060802@eccotours.dyndns.org>
	<42CBC275.2090003@mnemon.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42CBC275.2090003@mnemon.de>
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
To: =?ISO-8859-1?Q?J=F6rg=5FHarmuth?= <harmuth@mnemon.de>
Cc: iptables <netfilter@lists.netfilter.org>

J=F6rg_Harmuth wrote:
> Is this really the complete rule set ? No rules in OUTPUT and FORWARD,
> but policy set to DROP ? Anyway.
> There is no rule for lo. Add
> $IPT -<I | A> INPUT -i lo -j ACCEPT
> $IPT -<I | A> OUTPUT -o lo -j ACCEPT
> and for echo reply add
> $IPT -A OUTPUT -p icmp --icmp-type echo-reply -j ACCEPT
> This should work.
> Have a nice time,
> Joerg

Hi Joerg

here is my OUTPUT

$IPT -t filter -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -t filter -A OUTPUT -m state --state INVALID -j LOG --log-prefix=20
"INVALID output: " --log-tcp-options --log-ip-options
$IPT -t filter -A OUTPUT -m state --state INVALID -j DROP
$IPT -t filter -A OUTPUT -m state --state NEW -j ACCEPT
$IPT -t filter -A OUTPUT -j LOG --log-prefix "[OUTPUT DROP]: "=20
--log-tcp-options --log-ip-options
$IPT -t filter -A OUTPUT -j DROP

and for my lo

$IPT -A INPUT -i lo -j ACCEPT
$IPT -A OUTPUT -o lo -j ACCEPT



