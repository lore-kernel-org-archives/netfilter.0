From: Krunk <krunkalot@hotpop.com>
Subject: Re: NFS and iptables.[FIXED]
Date: Sat, 24 Apr 2004 20:48:22 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1082857702.24645.14.camel@james>
References: <1082844037.10067.20.camel@james>
	 <1082848320.11802.12.camel@anduril.intranet.cartel-securite.net>
	 <1082853174.24647.8.camel@james>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1082853174.24647.8.camel@james>
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
To: netfilter@lists.netfilter.org

Fixed.

On Sat, 2004-04-24 at 19:32, Krunk wrote:
> sunrpc is port 111 as defined in /etc/services.
>=20
> I'll try to explicitly set port 111.
>=20
> No same result, same type of logs being show. Thanks for the suggestion
> though.
>=20
> On Sat, 2004-04-24 at 18:12, Cedric Blancher wrote:
> > Le dim 25/04/2004 =E0 00:00, Krunk a =E9crit :
> > > I've bound my NFS ports (moountd, statd, lockd, quotad) and freed u=
p the
> > > ports they are bound to, but the client still hangs when I try to m=
ount
> > > the remote share.
> > [...]
> > > command that opens ports:
> > >  NFS=3D"2049 32764 32765 32766 32767 32768 32772 sunrpc"
> > [...]
> > > Apr 24 16:53:35 tuxmac DROPl:IN=3Deth1 OUT=3D MAC=3D<mac here>
> > > SRC=3D192.168.xxx.xxx DST=3D192.168.xxx.xxx LEN=3D60 TOS=3D0x00 PRE=
C=3D0x00
> > > TTL=3D64 ID=3D41035 DF PROTO=3DTCP SPT=3D896 DPT=3D111 WINDOW=3D584=
0 RES=3D0x00 SYN
> > > URGP=3D0
> >=20
> > As far as I can see, your client is trying to connect to portmapper i=
n
> > order to get NFS service port back. But there's nothing in your scrip=
t
> > excerpt that opens TCP/111.
> >=20
> > PS : maybe you should consider use the RPC helper available in
> > patch'o'matic extra section.
>=20




