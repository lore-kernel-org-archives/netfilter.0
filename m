From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: iptables for spoofing
Date: Fri, 4 Apr 2003 16:00:45 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0304041559420.23871@dns.toxicfilms.tv>
References: <HCTMC1$Ix9ReBi3coFoqW2avUnEYGRctoNNS_JdXwlN6@bol.com.br>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <HCTMC1$Ix9ReBi3coFoqW2avUnEYGRctoNNS_JdXwlN6@bol.com.br>
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
To: Julio Cesar Ody <julioody@bol.com.br>
Cc: netfilter@lists.netfilter.org

> So, my question is: How do I do it ?
> How can I alter the source address of
> a given packet using iptables ?
Using SNAT target like so:

iptables -t nat -A POSTROUTING -s a.b.c.d -j SNAT --to a.b.c.e

Regards,
Maciej

