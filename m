From: iansolo <iansolo.netfilter@betisgroup.com>
Subject: Re: ftp nat MAX PORTS
Date: Tue, 08 Feb 2005 14:54:47 +0100
Message-ID: <4208C4A7.3080208@betisgroup.com>
References: <420100AF.1040105@betisgroup.com>
	<bd35181c05020211473cb89b35@mail.gmail.com>
	<4201D91A.5030500@betisgroup.com>
	<200502081011.46026.luismnieto@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <200502081011.46026.luismnieto@gmail.com>
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
To: Luis Nieto <luismnieto@gmail.com>, netfilter@lists.netfilter.org

Ok, but my problem is redirect all from port 9000 of external=20
interface(of fw) to same port of ftpserver.

$IPTABLES -t nat -A PREROUTING -p tcp -d $EXT_LAN_FW --dport 9000 -j=20
DNAT --to-destination $IP_FTPSERVER:9000

But this don't work with ftp flow...

Luis Nieto wrote:
> El Jue 03 Feb 2005 04:56, escribi=F3:
> $IPTABLES -t nat -A PREROUTING -p tcp -d $EXT_LAN_FW --dport 21 -j DNAT=20
> --to-destination $IP_FTPSERVER:9000
> =20
> In this way, all the requirements for FTP connections that arrives to you=
r=20
> extern interface should be redirected to $IP_FTPSERVER:9000
>=20
>=20
> ________ Information from NOD32 ________
> This message was checked by NOD32 Antivirus System for Linux Mail Server.
> http://www.nod32.com


