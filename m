From: "Guillermo" <diseno1@puntozeropublicidad.cl>
Subject: proxy a dns
Date: Mon, 17 Nov 2003 16:32:13 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000d01c3ad41$80bb64b0$6500a8c0@ProxY>
References: <OF35D63A47.696E0D67-ON85256DE1.0066888E-85256DE1.0066CA71@kal.kalsec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

como puedo configurar que mi proxy squid redireccione las peticiones que le
llegan desde un pc de mi lan.... a un puerto 80 de otro proxy .....para que
pueda llegar a el servidor dns definitivo??

tengo dos proxys...un squid y un wingate que sale directamente a internet...
pero los pcs de mi lan que pasan por el squid no pueden llegar por el puerto
53 al dns.... llegan al wingate y ahi quedan...
necesito que se redireccionen al puerto 80 para ue el squid asuma que es
cualquier pc de la otra lan...


---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.541 / Virus Database: 335 - Release Date: 14/11/2003


