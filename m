From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: strange log
Date: 04 May 2003 01:29:18 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1052004558.25879.35.camel@elendil.intranet.cartel-securite.net>
References: <20030502094726.13204.qmail@web9802.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030502094726.13204.qmail@web9802.mail.yahoo.com>
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
To: Keith Tin <keithtin@yahoo.com.hk>
Cc: netfilter@lists.netfilter.org

Le ven 02/05/2003 =E0 11:47, Keith Tin a =E9crit :
> I found something strange in my iptables log. It was strange because I
> put my server at ISP and I don't know why there was an internal IP
> logged by my server.
> =20
> May  2 16:55:35 ABC kernel: FW-REJECT IN=3Deth0 OUT=3D
> MAC=3Dff:ff:ff:ff:ff:ff:00:10:5a:63:d3:d8:08:00 SRC=3D192.168.93.1
>  DST=3D255.255.255.255 LEN=3D276 TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D=
34884
>  PROTO=3DUDP SPT=3D68 DPT=3D67 LEN=3D256

Broadcast UDP packet from port 68 to port 67

$ grep 6[78]/udp /etc/services
bootps          67/udp
bootpc          68/udp
[...]

This is DHCP request from client to server. For client already has an
IP, I would say it is a DHCP request confirmation or a bail renewal.
=20
> How can I block these kind of IP?

Block all private IPs if they're not supposed to reach your server.
I agree it's quite unsual to see DHCP stuff within a hosting
infrastructure.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

