From: "Alexis" <alexis@tpys.com.ar>
Subject: RE: nat and dns
Date: Thu, 23 Sep 2004 10:17:09 -0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <E1CATN9-0001xA-00@deer.gmane.org>
References: <20040923110943.14715.qmail@arcoscom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040923110943.14715.qmail@arcoscom.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?'Samuel_D=EDaz_Garc=EDa'?= <samueldg@arcoscom.com>, 'Netfilter Mailing List' <netfilter@lists.netfilter.org>

Microsoft uses tcp for queries too.
=20

-----Mensaje original-----
De: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] En nombre de Samuel =
D=EDaz
Garc=EDa
Enviado el: Jueves, 23 de Septiembre de 2004 8:10
Para: Netfilter Mailing List
Asunto: Re: nat and dns

For DNS query only UDP is necesary, not TCP.=20

Regards,=20

Nick Drage writes:=20

> On Thu, Sep 23, 2004 at 11:00:33AM +0200, Raphael Jacquot wrote:
>> hi,
>> I have a setup that looks like :
>>  _____                                ____
>> [     ] 192.168.0.100                [    ]
>> [ DNS ]------------------------------[ FW ]----
>> [_____]                192.168.0.254 [____] (isp)=20
>>=20
>> and I want the DNS to answer to queries from the outside what's the=20
>> proper way of doing this ?
>=20
> I'm presuming that you want to answer queries from everywhere, rather=20
> than just from specific hosts, in which case:
>=20
> iptables -t nat -A PREROUTING --destination $EXTERNAL_IP -p udp=20
> --dport
> 53 -j DNAT --to-destination 192.168.0.100
>=20
> iptables -t nat -A PREROUTING --destination $EXTERNAL_IP -p tcp=20
> --dport
> 53 -j DNAT --to-destination 192.168.0.100
>=20
> iptables -A FORWARD --destination 192.168.0.100 -p udp --dport 53 -j=20
> ACCEPT
>=20
> iptables -A FORWARD --destination 192.168.0.100 -p tcp --dport 53 -j=20
> ACCEPT
>=20
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>=20
> I'd be interested to hear how you get on by the way, I'm not quite=20
> sure that my iptables rulebases are keeping state on DNS requests
correctly.
>=20
> --
> mors omnia vincit
>=20
=20


Samuel D=EDaz Garc=ED=ADa
Director Gerente
ArcosCom Wireless, S.L.L.=20

mailto:samueldg@arcoscom.com
http://www.arcoscom.com
m=F3vil: 651 93 72 48
tlfn/fax: 956 70 13 15=20





