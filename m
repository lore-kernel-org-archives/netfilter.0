From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: [FAQ] Re: weird message in logs
Date: Tue, 19 Oct 2004 23:16:28 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1098220588.2423.12.camel@anduril.intranet.cartel-securite.net>
References: <116401c4b5fc$0485cc40$49caa8c0@caris.priv>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <116401c4b5fc$0485cc40$49caa8c0@caris.priv>
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
To: Peter Marshall <peter.marshall@caris.com>
Cc: netfilter <netfilter@lists.netfilter.org>

Le mar 19/10/2004 =E0 18:52, Peter Marshall a =E9crit :
> Oct 19 14:46:05 rubidium kernel: REJECT: INPUT IN=3Deth1 OUT=3D
> MAC=3D00:50:04:9b:7a:ee:00:50:04:68:df:06:08:00 SRC=3D10.90.0.1 DST=3D10.=
90.0.2
> LEN=3D484 TOS=3D0x10 PREC=3D0xC0 TTL=3D64 ID=3D58050 PROTO=3DICMP TYPE=3D=
5 CODE=3D1
> GATEWAY=3D192.168.202.73 [SRC=3D10.90.0.2 DST=3D192.168.202.73 LEN=3D456 =
TOS=3D0x10
> PREC=3D0x00 TTL=3D64 ID=3D7787 DF PROTO=3DTCP SPT=3D15422 DPT=3D2510 WIND=
OW=3D8576
> RES=3D0x00 ACK PSH URGP=3D0 ]

For those who do not fully understand Netfilter logging, you can find a
very good (I learnt a lot from this site) Netfilter log format (and
ipchains as well) ressource at this URL :

	http://logi.cc/linux/netfilter-log-format.php3

And most of all, they have a web based log to human translator :

	http://logi.cc/linux/NetfilterLogAnalyzer.php3

Just copy/paste up to 10 log lines and you get a comprehensive
translation. In this cas, we have :

Filter =3D INPUT, in=3Deth1
Name of Chain =3D not available
Rule Number =3D not available

Protocol Number =3D 1 =3D ICMP =3D Internet Control Message [RFC792]
IP Source Addr =3D 10.90.0.1
IP Dest. Addr =3D 10.90.0.2

ICMP Type =3D 5 =3D Redirect Datagram [RFC792]
ICMP Code =3D 1 =3D for the Host

IP Packet Len =3D 484 bytes
IP Header Len =3D 5
words =3D 20 bytes (Exact length not available, why?)
IP Payload Len =3D 464 bytes, including the ICMP header (4 bytes)
IP TOS/DS =3D 1101000.=3DTOS:Precedence=3DInternetwork_Control(usually
            ignored), Type=3DMin_Delay
	  =3D 110100..=3DDS:Codepoint=3D110100, Pool=3D1 (Standards
            Action)[RFC2474]
IP Time To Live =3D 64 (hops remaining)
IP ID =3D 58050 (Unique to each IP datagram)
IP Flags =3D 000.............

Ethernet Src  =3D 00:50:04:68:df:06=20
Dst  =3D 00:50:04:9b:7a:ee (eth1)
Type =3D 08:00 (IPv4 packet)


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint:
FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

