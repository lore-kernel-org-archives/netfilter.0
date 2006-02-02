From: "Victor A. Bykov" <vr@aradio.ru>
Subject: Re: ICMP nat
Date: Thu, 2 Feb 2006 17:54:20 +0300
Message-ID: <011f01c62808$8c44db10$5964a8c0@office.aradio.ru>
References: <01e301c627ef$c78e3310$5964a8c0@office.aradio.ru>
	<1138883734.4981.5.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

"?????????"
????:  Cedric Blancher
??: ????????? ????????????? ????? ?????? ?????????
????: Re: ICMP nat
CC:  netfilter@lists.netfilter.org


>> My question is: if I, for example, generate icmp packet with =
icmp-type
>> 11 by packet generator, this packet is not in ESTABLISHED state, and
>> not in conntrack list, and probably should go via NAT table? in
>> practical test, however, that kind of packet not go via NAT!

>If you craft an ICMP error, then it will be given INVALID state as no
>previous entry exists in conntrack table to which it can be associated.

which means that such ICMP packet will go via NAT POSTROUTING chain, =
correct?


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: =
FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!



????/?????: 02.02.2006 17:54:21
???????: + 7 (495) 258-33-44
E-mail: vr@aradio.ru
??? ????: http://www.avtoradio.ru

