From: Jose Maria Lopez Hernandez <jkerouac@bgsec.com>
Subject: Re: these INPUT and OUTPUT rules blocking more than desired....
Date: Tue, 01 Mar 2005 10:31:26 +0100
Message-ID: <1109669487.11189.2.camel@nostromo.bgsecm.com>
References: <20050301014308.GA18177@spawar.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20050301014308.GA18177@spawar.navy.mil>
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
Content-Type: text/plain; charset="utf-8"
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

El lun, 28-02-2005 a las 17:43 -0800, seberino@spawar.navy.mil escribi=C3=
=B3:
> The snippet below was intended to *ONLY* allow types of traffic that
> I desired in and out of PC.  For example, I tried to only allow DNS, SS=
H
> and HTTP.
>=20
> These services don't work.  It seems like they need more than /one/
> port opened.  Or, they need something else I'm forgetting.
> Any help would be greatly appreciated.....
>=20

You don't post your vars so we don't know what ports you are
opening...
But it's just:
DNS=3D53/tcp 53/udp
SSH=3D22/tcp
HTTP=3D80/tcp

>       # INPUT
>=20
>       $IPTABLES -t filter -A INPUT                      \
>                 -i $INTERNET_INTERFACE                  \
>                 -d $INTERNET_ADDRESS                    \
>                 -m state --state ESTABLISHED,RELATED    \
>                 -j ACCEPT
>       for PORT in $OPEN_INCOMING_TCP_PORTS; do
>          $IPTABLES -t filter -A INPUT                   \
>                    -i $INTERNET_INTERFACE               \
>                    -d $INTERNET_ADDRESS                 \
>                    -p tcp --dport $PORT                 \
>                    -j ACCEPT
>       done
>       for PORT in $OPEN_INCOMING_UDP_PORTS; do
>          $IPTABLES -t filter -A INPUT                   \
>                    -i $INTERNET_INTERFACE               \
>                    -d $INTERNET_ADDRESS                 \
>                    -p udp --dport $PORT                 \
>                    -j ACCEPT
>       done
>=20
>       # OUTPUT
>=20
>       $IPTABLES -t filter -A OUTPUT                     \
>                 -o $INTERNET_INTERFACE                  \
>                 -s $INTERNET_ADDRESS                    \
>                 -m state --state ESTABLISHED,RELATED    \
>                 -j ACCEPT
>       for PORT in $OPEN_OUTGOING_TCP_PORTS; do
>          $IPTABLES -t filter -A OUTPUT                  \
>                    -o $INTERNET_INTERFACE               \
>                    -s $INTERNET_ADDRESS                 \
>                    -p tcp --dport $PORT                 \
>                    -j ACCEPT
>       done
>       for PORT in $OPEN_OUTGOING_UDP_PORTS; do
>          $IPTABLES -t filter -A OUTPUT                  \
>                    -o $INTERNET_INTERFACE               \
>                    -s $INTERNET_ADDRESS                 \
>                    -p udp --dport $PORT                 \
>                    -j ACCEPT
>       done

Regards.

--=20

Jose Maria Lopez Hernandez
Director Tecnico de bgSEC
jkerouac@bgsec.com
bgSEC Seguridad y Consultoria de Sistemas Informaticos
http://www.bgsec.com
ESPA=C3=91A

The only people for me are the mad ones -- the ones who are mad to live,
mad to talk, mad to be saved, desirous of everything at the same time,
the ones who never yawn or say a commonplace thing, but burn, burn, burn
like fabulous yellow Roman candles.
                -- Jack Kerouac, "On the Road"



