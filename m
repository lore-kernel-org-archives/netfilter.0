From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Connection through gateway fails in a random basis
Date: Mon, 31 Jul 2006 20:07:55 +0200
Message-ID: <44CE46FB.2020704@plouf.fr.eu.org>
References: <20060730221120.7668ee28.pedro.werneck@terra.com.br>	<44CE37FA.4050005@mailinator.com>
	<20060731145348.779b4055.pedro.werneck@terra.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060731145348.779b4055.pedro.werneck@terra.com.br>
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
To: netfilter@lists.netfilter.org

Hello,

Pedro Werneck a =E9crit :
>>
>>I can't answer your question but I can point out what looks like a=20
>>serious error in your rules -- the firewall is wide open.  You should=20
>>either change your default policy on the INPUT chain to DROP, or you=20
>>should append a rule "-A INPUT -j DROP".
>=20
> Yes... I know that. I changed it in the hope it would fix the problem

Did it ?

It seems that your connection uses PPPoE, so my first thought is the=20
well-known MTU problem. What happens if you lower the MTU of you=20
internal hosts below 1492 ?

