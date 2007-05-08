From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: iptables NAT routing issues
Date: Wed, 9 May 2007 00:37:59 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0705090036060.2342@yvahk01.tjqt.qr>
References: <4640E893.1010206@bserved.nl>
	<Pine.LNX.4.61.0705090024450.2342@yvahk01.tjqt.qr>
	<4640FAD0.9050301@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4640FAD0.9050301@plouf.fr.eu.org>
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@lists.netfilter.org


On May 9 2007 00:33, Pascal Hambourg wrote:
> Jan Engelhardt a =C3=A9crit :
>> On May 8 2007 23:16, Bas Verhoeven wrote:
>>=20
>> > OUTBOUND SERVER:
>> >=20
>> > iptables -t nat -A PREROUTING -p tcp --dport 80 -d <ext_web_ip> -j DNAT
>> > --to-destination <webserver_ip>:80
>> >=20
>> > Note: We didn't touch this as it seems to works fine.
>> >=20
>> > WEBSERVER:
>>=20
>> You do not need any rules here. The outbound server will do the
>> translation
>> in both directions.
>
> Assuming that the outbound server is the default gateway for the web serv=
er and
> receives the return traffic, of course.

You'd be kinda screwed if that was not the case. Because the 'nat' table
is only consulted for NEW connections afaics, the reply packets do _not_
get SNATed, since the _first_ packet was the TCP SYN, which makes the
connection ESTABLISHED when input processing is done.


Jan
--=20

