From: =?unknown-8bit?q?J=F6rgen?= Danielsson <jorgen_d@yahoo.com>
Subject: Re: iptables and mtu
Date: Mon, 10 Jun 2002 13:14:41 -0700 (PDT)
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020610201441.37841.qmail@web9904.mail.yahoo.com>
References: <200206101458.AA13435028@imail.ricis.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <200206101458.AA13435028@imail.ricis.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: lee@ricis.com, netfilter@lists.samba.org

Thanks

Gonna try that, sounds promising =3D)

/J=F6rgen

--- lee Leahu  <lee@ricis.com> wrote:
>=20
> hi, i solved this on my adsl conn and i thought you
> could use it.
>=20
>=20
> iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN
> -j TCPMSS --clamp-mss-to-pmtu
>=20
>=20
>=20
> basically what this command does, is tell everyone
> to *NERVER* send any packet with mtu size larger
> than it can support.
>=20
>=20


__________________________________________________
Do You Yahoo!?
Yahoo! - Official partner of 2002 FIFA World Cup
http://fifaworldcup.yahoo.com

