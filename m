From: "Alexis" <alexis@tpys.com.ar>
Subject: RE: connection tracking without iptables?
Date: Wed, 29 Sep 2004 17:57:29 -0300
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <E1CCmO4-0004gq-00@deer.gmane.org>
References: <561dc3260409291350dc64a8a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <561dc3260409291350dc64a8a@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: 'Jiann-Ming Su' <sujiannming@gmail.com>, netfilter@lists.netfilter.org

Yes it is, is inside the code, i think this example could explain you

echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -P FORWARD DROP
iptables -A FORWARD -i $inside_interface -o $outside_interface -m state
--state NEW -j ACCEPT
iptables -A FORWARD -i $outside_interface -m state --state
RELATED,ESTABLISHED -j ACCEPT

That's it, this is what you need in order to get a statefull firewall =
with 2
interfaces.


> -----Mensaje original-----
> De: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] En nombre de=20
> Jiann-Ming Su
> Enviado el: Mi=E9rcoles, 29 de Septiembre de 2004 17:51
> Para: netfilter@lists.netfilter.org
> Asunto: connection tracking without iptables?
>=20
> This is probably a dumb question, but is it possible to track
> connections without iptables/netfilter?
> --=20
> Jiann-Ming Su
> "I have to decide between two equally frightening options. =20
>                                             If I wanted to do that,
> I'd vote." --Duckman
>=20
>=20


