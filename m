From: "Alejandro Cabrera Obed" <sisdis@tournet.com.ar>
Subject: LOG de iptables con 0 bytes
Date: Mon, 27 Dec 2004 11:15:38 -0300
Message-ID: <028d01c4ec1e$8aaaa630$0200a8c0@ale>
Reply-To: Alejandro Cabrera Obed <sisdis@tournet.com.ar>
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
To: "Netfilter lista (iptables)" <netfilter@lists.netfilter.org>

Mi regla de LOG de iptables seguramente estaba vacia (cero pkts y bytes) y
es verdad, ya lo comprobe con "iptables -L INPUT -v"....ahora les muestro
mis dos reglas en la cadena INPUT para loguear primero y luego acceder al
servicio SSH. Pero ocurre que yo puedo acceder al port ssh pero NO quedan
logs en el archivo /var/log/messages.

$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 22 -j LOG --log-level
INFO --log-prefix "SSH Access:"
$IPTABLES -A tcp_packets -p TCP -s 0/0 --dport 22 -j allowed

Como puedo hacer para que se logueen los ingresos ssh ??? Esta mal el orden
o algo por el estilo ???

Mil gracias !!!!!!!!!!

A.K.


