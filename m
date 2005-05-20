From: Sertys <sertys@supportivo.org>
Subject: Re: Prevent traceroutes
Date: Fri, 20 May 2005 04:12:09 +0300
Message-ID: <opsq1uyjfp76nf2y@xonix>
References: <fad9d484050519150730dbc53d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <fad9d484050519150730dbc53d@mail.gmail.com>
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
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: Netfilter list <netfilter@lists.netfilter.org>

In fact you can do it partially - windows tracert tool is based on ICMP =20
and is easily preventable and routable. *nix traceroute and mtr are based=
 =20
on udp and all you can do is redirect all yer traffic over the other =20
network, which is purely incorrect. The trick is that the user can point =
=20
any port for udp connection and it still will work and trace. Sorry 4 the=
 =20
disappointment.



On Fri, 20 May 2005 00:07:11 +0200, Kenneth Kalmer =20
<kenneth.kalmer@gmail.com> wrote:

> Guys
>
> How can I prevent users from doing a traceroute through my box using
> iptables? Better still, how can I route a traceroute through a
> different network than the default one?
>
> Kind regards.
>



--=20
www.supportivo.org

I can't stop myself checking for pigs in the outlets. Everybody thinks i'=
m =20
a punk, cause of the hairstyle(220V).
end

