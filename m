From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: proxy a dns
Date: Tue, 18 Nov 2003 12:08:35 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0311181207160.18825@dns.toxicfilms.tv>
References: <OF35D63A47.696E0D67-ON85256DE1.0066888E-85256DE1.0066CA71@kal.kalsec.com>
 <000d01c3ad41$80bb64b0$6500a8c0@ProxY>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000d01c3ad41$80bb64b0$6500a8c0@ProxY>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guillermo <diseno1@puntozeropublicidad.cl>
Cc: netfilter@lists.netfilter.org

Hola,

> necesito que se redireccionen al puerto 80 para ue el squid asuma que es
> cualquier pc de la otra lan...
Please read the FAQ, redirecting packets for proxy is described there.

Also please read the man pages for iptables, and look for information
about the DNAT target.

Regards,
Maciej


