From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Re: Squid +iptables + apache
Date: Tue, 20 Sep 2005 08:29:28 -0400
Message-ID: <65aa6af90509200529591f90dc@mail.gmail.com>
References: <200509200157.11810.etobis@dc.uba.ar>
Reply-To: eantoranz@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200509200157.11810.etobis@dc.uba.ar>
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

what is the error squid reports?

On 9/20/05, Enrique Augusto Tobis <etobis@dc.uba.ar> wrote:
> Hi!
>=20
> I've been looking for a solution to this problem, but I haven't been able=
 to
> find one. Any ideas?
>=20
> I have a small home network. I recently set up an old pc as out gateway. =
I
> have
>=20
> 192.168.0.3 connecting to the internet, running squid, and acting as the
> firewall/gateway (using nat).
> 192.168.0.1 running apache.
>=20
> I want to use squid in 192.168.0.3 as a transparent proxy. So far, that w=
orks.
> That is, traffic from the 192.168.0.0 network is processed transparently
> by .0.3
>=20
> I also forwarded connections to port 80 on .0.3 to .0.1, which is running=
 the
> web server. I can successfully access that web server from outside the
> network.
>=20
> To sum it up, almost everything is working as it should. But, if I try to
> access 192.168.0.3 from INSIDE the network, I get an error from squid...
>=20
> I activate the transparent proxy with
> iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j REDIRECT --to-=
port
> 8080
>=20
> and forward the port 80 connections with
> iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT --to 192.168.0.1:=
80
>=20
> in that order.
>=20
> Any ideas?
> Thanks!
> Enrique
>=20
>

