From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: LOG entry format: MAC field
Date: 19 Feb 2003 10:53:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045648414.9189.18.camel@elendil.intranet.cartel-securite.net>
References: <auto-000013214373@frontend4.aha.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <auto-000013214373@frontend4.aha.ru>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: kdorichev@epicinvest.ru
Cc: netfilter@lists.netfilter.org

Le mer 19/02/2003 =E0 10:36, Konstantin Dorichev a =E9crit :
> Could anyone please comment on MAC field in iptables log entry? Why doe=
s it=20
> have 14 bytes instead of 6 as it should be for Ethernet card MAC addres=
s? Or=20
> this field means something else?

In fact MAC does not stand for MAC address, but for MAC header. This 14
bytes field is the ethernet layer header hexa dump which is :

	6 bytes : DST MAC
	6 bytes : SRC MAC
	2 bytes : Ethertype (i.e. payload type)

> MAC=3D00:50:04:a2:08:91:00:01:42:1b:57:20:08:00 SRC=3D80.117.120.207=20

DST MAC : 00:50:04:a2:08:91 (i.e. your box)
SRC MAC : 00:01:42:1b:57:20 (i.e. your access router I guess)
ETHTYPE : 08:00 (i.e. IP)

I do think this URL will be useful for you :)))

	http://logi.cc/linux/netfilter-log-format.php3

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

