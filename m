From: Jorge Enrique <nunezj@ucbcba.edu.bo>
Subject: Problemas REDIRECT
Date: Tue, 29 Mar 2005 18:08:14 -0400
Message-ID: <1112134095.8721.76.camel@admin.ucbcba.edu.bo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hola a todos, una pregunta se me presento problemas con mis reglas de mi
firewall.

Estado probando los redireccionamientos la idea es la siguiente:


              Internet
                 |
		 |
		 V

 		Firewall  ----> Server web
			    |
			    |-> Usuario1

 Configure primero para q desde internet lo vean a mi server web

 iptables -A PREROUTING -s 0/0 -d IP_PUBLICA -j DNAT -to IP_SERVER_WEB

 Esto funciona bien pero los usuarios de mi red privada no la pueden
acceder a mi sito en mi server web, pero desde afuera si..

 estado viendo lo siguiente pero no me esta funcionando

 iptables -A PREROUTING -s RED_PRIVADA -d IP_PUBLICA -p tcp --dport 443
-j REDIRECT -to-ports 443

  Cual puede ser el problema o donde me estoy equivocando, ayuda????







