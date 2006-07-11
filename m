From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: need assistence for PREROUTING
Date: Tue, 11 Jul 2006 11:36:21 +0200
Message-ID: <44B37115.4030702@plouf.fr.eu.org>
References: <20060710235021.235F178@brinstar.nerim.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060710235021.235F178@brinstar.nerim.net>
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

Seferovic Edvin a =E9crit :
>>$IPTABLES -t nat -A PREROUTING -i $ETH -p tcp --sport=20
>>$UNPRIVPORTS --dport 4444 -d xxx.xxx.xxx.xxx -j DNAT
>> --to-destination 192.168.178.32
>=20
> You need port here !!! --to-destination 192.168.178.32:80

Also, 192.168.178.112 must be the gateway for the return packets so they=20
are properly un-DNATed.

