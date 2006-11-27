From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Passive FTP sees remote's _internal_ IP!!??
Date: Mon, 27 Nov 2006 22:26:18 +0100
Message-ID: <456B57FA.5020000@plouf.fr.eu.org>
References: <20061127184454.0BD73DB@brinstar.nerim.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20061127184454.0BD73DB@brinstar.nerim.net>
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

Maxime Ducharme a =E9crit :
> This happens when the remote server has a bad
> NAT configuration for FTP.

I fully agree, the problem seems to be on the server side.

> Maybe SonicWALL is able to "fix" this itself, I dont
> know this product very well.

If it does so, I'd be happy to know how.

> some suggestions :
>=20
> 1. Fix NAT for FTP on remote firewall
>=20
> 2. Configure remote server to explicitly send
> external IP for passive connections (most of FTP
> software allows to configure this)
>=20
> 3. Configure your FTP client to use active mode.
> If server is running on another port than 21,
> you must tell ip_nat_ftp to "listen" for FTP
> traffic on this port. Someone on this list can
> tell us how ? (I dont remember how)

$ modprobe ip_conntrack_ftp ports=3D21,alternate_port
$ modprobe ip_nat_ftp ports=3D21,alternate_port

Both commands are needed because AFAIK, ip_nat_ftp loads automatically=20
ip_conntrack_ftp if not already loaded but does not pass the port list=20
to it. Duh.

3b. Use extended passive mode (EPSV) if the client, the remote server=20
and their firewall/NATs support it, because an EPSV reply does not=20
contains the server address.

[Read on]
> -----Message d'origine-----
> De : netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org] De la part de gypsy
> Envoy=E9 : 27 novembre, 2006 10:33
> =C0 : netfilter@lists.netfilter.org
> Objet : Passive FTP sees remote's _internal_ IP!!??
>=20
> We don't think this is a netfilter problem.

I agree, at least not on the client side.

> The kernel should tell the
> remote end that it can't use the "nonroutable" IP - shouldn't it?

No, the kernel is not supposed to do this. All the Netfilter FTP NAT=20
helper module can do is translate "internal" addresses. However the=20
wrong PASV reply comes from the outside.

>>>When the default GW is set to the linux box (192.168.223.254) and
>>>passive FTP to a remote server is initiated, the FTP fails after
>>>connection because the internal IP of the remote machine (192.168.1.11=
)
>>>is seen rather than its external IP.  This problem occurs only when
>>>passive FTP is used.

Does this happen with any FTP server or only a specific one ?

