From: Christian Seberino <seberino@spawar.navy.mil>
Subject: Re: these INPUT and OUTPUT rules blocking more than desired....
Date: Tue, 01 Mar 2005 11:22:12 -0800
Message-ID: <1109704931.1096.88.camel@seberino.spawar.navy.mil>
References: <20050301014308.GA18177@spawar.navy.mil>
	<1109669487.11189.2.camel@nostromo.bgsecm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1109669487.11189.2.camel@nostromo.bgsecm.com>
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
Content-Type: text/plain; charset="iso-8859-9"
To: Jose Maria Lopez Hernandez <jkerouac@bgsec.com>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Jose

Thanks.  The port numbers you mentioned are the ones I'm using.
(I got them from /etc/services.)  It *is* possible that
I'm not defining my variables correctly.  I'll check that.
Assuming INCOMING_TCP_PORTS =3D=3D INCOMING_UDP_PORTS =3D=3D OUTGOING_TCP=
_PORTS=20
=3D=3D OUTGOING_UDP_PORTS =3D=3D "53 80", Is there any reason
by code snippet won't do DNS and HTTP fine? (i.e. is there anything else
wrong?)

Chris

On Tue, 2005-03-01 at 01:31, Jose Maria Lopez Hernandez wrote:
> El lun, 28-02-2005 a las 17:43 -0800, seberino@spawar.navy.mil escribi=C3=
=B3:
> > The snippet below was intended to *ONLY* allow types of traffic that
> > I desired in and out of PC.  For example, I tried to only allow DNS, =
SSH
> > and HTTP.
> >=20
> > These services don't work.  It seems like they need more than /one/
> > port opened.  Or, they need something else I'm forgetting.
> > Any help would be greatly appreciated.....
> >=20
>=20
> You don't post your vars so we don't know what ports you are
> opening...
> But it's just:
> DNS=3D53/tcp 53/udp
> SSH=3D22/tcp
> HTTP=3D80/tcp
>=20
> >       # INPUT
> >=20
> >       $IPTABLES -t filter -A INPUT                      \
> >                 -i $INTERNET_INTERFACE                  \
> >                 -d $INTERNET_ADDRESS                    \
> >                 -m state --state ESTABLISHED,RELATED    \
> >                 -j ACCEPT
> >       for PORT in $OPEN_INCOMING_TCP_PORTS; do
> >          $IPTABLES -t filter -A INPUT                   \
> >                    -i $INTERNET_INTERFACE               \
> >                    -d $INTERNET_ADDRESS                 \
> >                    -p tcp --dport $PORT                 \
> >                    -j ACCEPT
> >       done
> >       for PORT in $OPEN_INCOMING_UDP_PORTS; do
> >          $IPTABLES -t filter -A INPUT                   \
> >                    -i $INTERNET_INTERFACE               \
> >                    -d $INTERNET_ADDRESS                 \
> >                    -p udp --dport $PORT                 \
> >                    -j ACCEPT
> >       done
> >=20
> >       # OUTPUT
> >=20
> >       $IPTABLES -t filter -A OUTPUT                     \
> >                 -o $INTERNET_INTERFACE                  \
> >                 -s $INTERNET_ADDRESS                    \
> >                 -m state --state ESTABLISHED,RELATED    \
> >                 -j ACCEPT
> >       for PORT in $OPEN_OUTGOING_TCP_PORTS; do
> >          $IPTABLES -t filter -A OUTPUT                  \
> >                    -o $INTERNET_INTERFACE               \
> >                    -s $INTERNET_ADDRESS                 \
> >                    -p tcp --dport $PORT                 \
> >                    -j ACCEPT
> >       done
> >       for PORT in $OPEN_OUTGOING_UDP_PORTS; do
> >          $IPTABLES -t filter -A OUTPUT                  \
> >                    -o $INTERNET_INTERFACE               \
> >                    -s $INTERNET_ADDRESS                 \
> >                    -p udp --dport $PORT                 \
> >                    -j ACCEPT
> >       done
>=20
> Regards.


