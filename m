From: "=?ISO-8859-1?Q?Pablo_Proa=F1o?=" <pabartur@gmail.com>
Subject: Ultima vez que se uso una cadena??
Date: Thu, 12 Oct 2006 22:09:41 -0500
Message-ID: <298bd5800610122009w5f4c0cd1o89f2dba3ca58d865@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Saludos:

Tal vez alguien me puede ayudar,  estoy desarrollando una aplicacion
para la cual me seria de utilidad conocer cuando fue la ultima vez que
se utilizo una regla de iptabels para filtrar o dejar pasar cierto
contenido.

(ACCEPT, DROP, REJECT)

por ejemplo tengo configurado en mi firewall una regla  com esta:

iptables -t filter -A INPUT -s 192.168.1.1/32 -j ACCEPT

y deseo saber cuando fue la ultima vez (HH:MM:SS) que me permitio
pasar trafico de la IP 192.168.1.1 hacia el Internet.

