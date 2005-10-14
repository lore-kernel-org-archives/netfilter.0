From: =?UTF-8?B?SsO2cmcgSGFybXV0aA==?= <harmuth@mnemon.de>
Subject: Re: iptables & ebtables
Date: Fri, 14 Oct 2005 15:53:32 +0200
Message-ID: <434FB85C.6020109@mnemon.de>
References: <20051014040552.1FA9A4E89@smtp.263.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051014040552.1FA9A4E89@smtp.263.net>
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
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: netfilter@lists.netfilter.org

bend chen wrote:
> HI,netfilter-user
>=20
>=20
> I  have some question=EF=BC=8Cpleas help me.
> 1\if I used ebtables process a package,but need iptables can't process =
THIS package,how can I do?

Sorry, I can't parse this sentence

> 2\can i use iptables drop some LENGTH package, can I mach : if the pack=
age > 128K then DROP?

Yes. Use the length match, e.g.

iptables -A INPUT -p tcp -m length --length --length 1501: -j DROP

will send all tcp-packets with more than 1500 bytes to nirvana. BTW,=20
neither tcp (1500 bytes max) nor udp (65 KBytes max) will ever generate=20
packets of the size you mentioned above. ICMP packets are even smaller -=20
i don't recall max size at the moment.

HTH,

Joerg




