From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: ICMP nat
Date: Thu, 02 Feb 2006 13:35:34 +0100
Message-ID: <1138883734.4981.5.camel@anduril.intranet.cartel-securite.net>
References: <01e301c627ef$c78e3310$5964a8c0@office.aradio.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <01e301c627ef$c78e3310$5964a8c0@office.aradio.ru>
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
Content-Type: text/plain; charset="iso-8859-1"
To: "Victor A. Bykov" <vr@aradio.ru>
Cc: netfilter@lists.netfilter.org

Le jeudi 02 f=E9vrier 2006 =E0 14:57 +0300, Victor A. Bykov a =E9crit :
> My question is: if I, for example, generate icmp packet with icmp-type
> 11 by packet generator, this packet is not in ESTABLISHED state, and
> not in conntrack list, and probably should go via NAT table? in
> practical test, however, that kind of packet not go via NAT!

If you craft an ICMP error, then it will be given INVALID state as no
previous entry exists in conntrack table to which it can be associated.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

