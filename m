From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: NFS and iptables.
Date: Sat, 24 Apr 2004 21:47:20 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404242147.20871.Alistair@nerdnet.ca>
References: <1082844037.10067.20.camel@james> <1082848320.11802.12.camel@anduril.intranet.cartel-securite.net> <1082853174.24647.8.camel@james>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1082853174.24647.8.camel@james>
Content-Disposition: inline
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

On April 24, 2004 08:32 pm, Krunk wrote:
> sunrpc is port 111 as defined in /etc/services.
>
> I'll try to explicitly set port 111.
>
> No same result, same type of logs being show. Thanks for the suggestion
> though.
>
> On Sat, 2004-04-24 at 18:12, Cedric Blancher wrote:
> > Le dim 25/04/2004 =E0 00:00, Krunk a =E9crit :
> > > I've bound my NFS ports (moountd, statd, lockd, quotad) and freed up
> > > the ports they are bound to, but the client still hangs when I try to
> > > mount the remote share.
> >
> > [...]
> >
> > > command that opens ports:
> > >  NFS=3D"2049 32764 32765 32766 32767 32768 32772 sunrpc"
> >
> > [...]
> >
> > > Apr 24 16:53:35 tuxmac DROPl:IN=3Deth1 OUT=3D MAC=3D<mac here>
> > > SRC=3D192.168.xxx.xxx DST=3D192.168.xxx.xxx LEN=3D60 TOS=3D0x00 PREC=
=3D0x00
> > > TTL=3D64 ID=3D41035 DF PROTO=3DTCP SPT=3D896 DPT=3D111 WINDOW=3D5840 =
RES=3D0x00 SYN
> > > URGP=3D0
> >
> > As far as I can see, your client is trying to connect to portmapper in
> > order to get NFS service port back. But there's nothing in your script
> > excerpt that opens TCP/111.
> >
> > PS : maybe you should consider use the RPC helper available in
> > patch'o'matic extra section.


	Silly question ... you are opening ports for state NEW ... I don't see an=
=20
explicit rule for ESTABLISHED RELATED any where ... but I'm assuming that=20
rule exists somewhere ...... else.

	Alistair Tonner=20
=09
	(sometimes the simplest answers.....)

