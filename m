From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: iptables NAT routing issues
Date: Wed, 09 May 2007 00:33:52 +0200
Message-ID: <4640FAD0.9050301@plouf.fr.eu.org>
References: <4640E893.1010206@bserved.nl>
	<Pine.LNX.4.61.0705090024450.2342@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0705090024450.2342@yvahk01.tjqt.qr>
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

Jan Engelhardt a =E9crit :
> On May 8 2007 23:16, Bas Verhoeven wrote:
>=20
>>OUTBOUND SERVER:
>>
>>iptables -t nat -A PREROUTING -p tcp --dport 80 -d <ext_web_ip> -j DNAT
>>--to-destination <webserver_ip>:80
>>
>>Note: We didn't touch this as it seems to works fine.
>>
>>WEBSERVER:
>=20
> You do not need any rules here. The outbound server will do the transla=
tion
> in both directions.

Assuming that the outbound server is the default gateway for the web=20
server and receives the return traffic, of course.

