From: Robby Workman <netfilter@rlworkman.net>
Subject: Re: SNAT / MASQUERADE to a different IP
Date: Thu, 09 Mar 2006 16:18:16 -0600
Message-ID: <4410A9A8.50002@rlworkman.net>
References: <019d01c643c6$193ab020$6bb1a8c0@veruca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <019d01c643c6$193ab020$6bb1a8c0@veruca>
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

Eduardo Bejar wrote:
> Hi,
>=20
> I have this setup:
>=20
> LAN with one Fedora Server as gateway/email server.
>=20
> Currently I masquerade all LAN traffic to use the same IP as the Server:
>=20
> iptables -t nat -A POSTROUTING -s $LAN -o eth0 -j MASQUERADE
>=20
> So, LAN and mail server use both the same IP address. This works fine, but
> now I=B4d like to make the LAN use a different IP address than the mail
> server, so I=B4d like to know how can I do that?
>=20
> I tested SNAT, like:
>=20
> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to $IP
>=20
> but with this, LAN and mail server now use $IP both, and what I=B4d like =
to do
> is assign different IP addresses: one for the LAN and other for the mail
> server.


Perhaps I'm oversimplifying this, but isn't this what you want?

iptables -t nat -A POSTROUTING -s $MAILSERVER -o eth0 -j SNAT --to $IP1
iptables -t nat -A POSTROUTING -s $LAN -o eth0 -j SNAT --to $IP2

--=20

http://rlworkman.net

