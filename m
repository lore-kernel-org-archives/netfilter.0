From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Not NATed packets
Date: Thu, 04 May 2006 22:35:54 +0200
Message-ID: <445A65AA.3070308@plouf.fr.eu.org>
References: <Pine.LNX.4.64N.0604231700330.6204@tank.eu.org>	<e2goe1$f34$1@sea.gmane.org>
	<Pine.LNX.4.64N.0604241149300.6204@tank.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.64N.0604241149300.6204@tank.eu.org>
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

lukas@tank.eu.org a =E9crit :
[...]
>> Exactly. I can see only FIN packets which are not translated. After
>> looking into conntrack table, I think MASQ ignores FIN packets that ar=
e
>> missing in conntrack table (Is it INVALID or NEW state?).
[...]
> I test it also on kernel 2.4.32-6 and its bad too.

Are you sure ? I'm surprised. Where did you get this kernel from ?
I just tested on a custom kernel 2.4.32 built from kernel.org sources=20
(almost standard, just a few Netfilter patch-o-matic add-ons). And my=20
conclusion is that unexpected TCP FIN or RST packets are classified NEW=20
by the connection tracking, thus creating an entry in the conntrack/NAT=20
table /proc/net/ip_conntrack. However, unexpected ICMP packets such as=20
Echo Reply or Destination Unreachable are classified INVALID.

