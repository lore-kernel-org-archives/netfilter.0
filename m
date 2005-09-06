From: Askar <askarali@gmail.com>
Subject: Re: by passing transparent proxy
Date: Wed, 7 Sep 2005 00:37:48 +0500
Message-ID: <a0f69e5050906123774f20f8b@mail.gmail.com>
References: <a0f69e5050906041135c802fb@mail.gmail.com>
	<200509061133.45091.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200509061133.45091.rob0@gmx.co.uk>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On 9/6/05, /dev/rob0 <rob0@gmx.co.uk> wrote:
>=20
> On Tuesday 2005-September-06 06:11, Askar wrote:
> > All teh port 80 traffic redirected to squid 3128 by ...
> >
> > $iptables -t nat -A PREROUTING -i eth0 -p tcp -s 0/0 --dport 80 -j
> > REDIRECT --to-port 3128
> >
> > Now I want to a client -s xx.xx.xx.xx access a site -d xx.xx.xx.xx
> > then his traffic by pass the squid. actaully if the client xx.xx goes
>=20
> Precede the proxy rule with a -j RETURN rule for your -s client.IP and
> -d server.IP. See the RETURN target in "man iptables".
> --
> mail to this address is discarded unless "/dev/rob0"
> or "not-spam" is in Subject: header
>=20
>=20
bingo :)

thanks mate

--=20
Unix is very simple, but it takes a genius to understand the simplicity.
(Dennis Ritchie)
