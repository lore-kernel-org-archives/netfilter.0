From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: iptables NAT routing issues
Date: Thu, 10 May 2007 21:31:10 +0200
Message-ID: <464372FE.1070802@plouf.fr.eu.org>
References: <4640E893.1010206@bserved.nl>	<Pine.LNX.4.61.0705090024450.2342@yvahk01.tjqt.qr>	<4640FAD0.9050301@plouf.fr.eu.org>	<Pine.LNX.4.61.0705090036060.2342@yvahk01.tjqt.qr>	<4640FDA9.5000706@bserved.nl>	<464101DA.4070102@plouf.fr.eu.org>
	<46432A84.2010409@bserved.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46432A84.2010409@bserved.nl>
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

Bas Verhoeven a =E9crit :
>=20
>> Use the outer box as a gateway, if it is in the same network. You do=20
>> not have to use it as the default gateway for all traffic but at least=
=20
>> for the HTTP return traffic. This could be done with iptables and=20
>> advanced routing on the web server, for instance using the source port=
=20
>> 80 to MARK packets or using CONNMARK/connmark.
>=20
> I wasn't aware of that option, it seems to work fine ;-)

Which option did you choose ?

> Thanks.

You're welcome.

