From: Mike Wright <xktnniuymlla@mailinator.com>
Subject: Re: Ultima vez que se uso una cadena??
Date: Fri, 13 Oct 2006 11:24:45 -0700
Message-ID: <452FD9ED.9070203@mailinator.com>
References: <298bd5800610122009w5f4c0cd1o89f2dba3ca58d865@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <298bd5800610122009w5f4c0cd1o89f2dba3ca58d865@mail.gmail.com>
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
Cc: =?ISO-8859-1?Q?Pablo_Proa=F1o?= <pabartur@gmail.com>

Pablo Proa=F1o wrote:
> Saludos:
>=20
> Tal vez alguien me puede ayudar,  estoy desarrollando una aplicacion
> para la cual me seria de utilidad conocer cuando fue la ultima vez que
> se utilizo una regla de iptabels para filtrar o dejar pasar cierto
> contenido.
>=20
> (ACCEPT, DROP, REJECT)
>=20
> por ejemplo tengo configurado en mi firewall una regla  com esta:
>=20
> iptables -t filter -A INPUT -s 192.168.1.1/32 -j ACCEPT
>=20
> y deseo saber cuando fue la ultima vez (HH:MM:SS) que me permitio
> pasar trafico de la IP 192.168.1.1 hacia el Internet.
>=20

"man iptables" y busca LOG

Tal vez algo como esto:

iptables -N LOGGER
iptables -t filter -A INPUT -s 192.168.1.1/32 -j LOGGER
iptables -t filter -A LOGGER -j LOG
iptables -t filter -A LOGGER -j ACCEPT

Se puede mirar los resultados en /var/log/messages.  Los datos al fin=20
estan los mas recien.

(desculpame el espanol ;)

