From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: iptables & ebtables
Date: Fri, 14 Oct 2005 20:14:51 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510142012140.17263@filer.marasystems.com>
References: <20051014040552.1FA9A4E89@smtp.263.net>
	<434FB85C.6020109@mnemon.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <434FB85C.6020109@mnemon.de>
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"; format="flowed"
To: =?UTF-8?B?SsO2cmcgSGFybXV0aA==?= <harmuth@mnemon.de>
Cc: netfilter@lists.netfilter.org

On Fri, 14 Oct 2005, [UTF-8] J=C3=B6rg Harmuth wrote:

> will send all tcp-packets with more than 1500 bytes to nirvana. BTW, ne=
ither=20
> tcp (1500 bytes max) nor udp (65 KBytes max) will ever generate packets=
 of=20
> the size you mentioned above. ICMP packets are even smaller - i don't r=
ecall=20
> max size at the moment.

Both TCP and UDP is limited by the max IP packet size, approx 65KB for=20
IPv4.

TCP normally generates small packets <1500, but if you disable Path-MTU=20
discovery larger packets may be seen, just as can be seen with UDP.

Regards
Henrik

