From: Jorge Enrique <nunezj@ucbcba.edu.bo>
Subject: Ayuda PREROUTING
Date: Wed, 12 Jan 2005 18:10:38 -0400
Message-ID: <1105567838.5149.21.camel@firewall.ucbcba.edu.bo>
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

Una consulta, estado haciendo un PREROUTING en mi firewall, quedando de
la sigueinte manera

$IPTABLES -t nat -A PREROUTING -d IP-EXTERNA -j DNAT --to IP_INTERNA

Haciendo las pruebas puedo hacer ping a la IP_EXTERNA e IP_INTERNA desde
mi red sin ningun problema pero si lo hago desde afuerea o con otra
IP_EXTERNA no la puedo ver, que estaria mal o donde deberia modificar
esto, o es necesario que le especifique los puertos por los que quiero
que se vea????

alguien que me puede orientar en esto.....


