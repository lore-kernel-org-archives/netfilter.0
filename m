From: Jorge Enrique <nunezj@ucbcba.edu.bo>
Subject: Consulta iptables v1.2.11
Date: Mon, 13 Dec 2004 11:06:31 -0400
Message-ID: <1102950391.4817.81.camel@admin.ucbcba.edu.bo>
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

Hola a todos, el viernes pasado termine de configuar mi firewall en
fedora core 3, en el cual tengo corriendo el squid todo bien,, estado
queiendo colocar algunas reglas con el iptables donde me sale el
siguiente error:

Ejecutando reglas y configuracion de iptables para servidor
...1...2...3...4...iptables v1.2.11: multiple -s flags not allowed
Try `iptables -h' or 'iptables --help' for more information.
Bad argument `22'
Try `iptables -h' or 'iptables --help' for more information.


En las reglas que estoy utilizando donde coloco el flag -s es en las
siguientes.
$IPTABLES -A INPUT -p ALL -i eth1 -s 192.168.107.0/24 -j ACCEPT
$IPTABLES -A INPUT -p ALL -i eth1 -s 192.168.108.0/24 -j ACCEPT
$IPTABLES -A INPUT -p ALL -i eth1 -s 192.168.105.0/24 -j ACCEPT

donde hago referencia a las subredes que se tienen de origen
como referencia estos son los modulos que estoy utilizando

/sbin/depmod -a
/sbin/modprobe ip_conntrack
/sbin/modprobe iptable_filter
/sbin/modprobe iptable_mangle
/sbin/modprobe iptable_nat
/sbin/modprobe ipt_LOG
/sbin/modprobe ipt_limit
/sbin/modprobe ipt_state
/sbin/modprobe ip_nat_ftp
/sbin/modprobe ip_conntrack_ftp

Alguna idea porq me sale este error.




