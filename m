From: Wan Seman Bin Wan Ismail <wswi@scan-associates.net>
Subject: Re: how to log dropped packet
Date: Tue, 28 Sep 2004 18:28:12 +0800
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41593CBC.9010009@scan-associates.net>
References: <web-6413785@infinito.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <web-6413785@infinito.it>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: hamals@infinito.it, netfilter@lists.netfilter.org

for example:-

Accept Rule:
iptables -A  block -p tcp --dport 80  -j LOG --log-level info 
--log-prefix "Allow 80 :"
iptables -A  block -p tcp --dport 80  -j ACCEPT

Drop Rule:
iptables -A  block -p tcp --dport 139  -j LOG --log-level info 
--log-prefix "Block 139 :"
iptables -A  block -p tcp --dport 139  -j DROP

so in conclusion, the first rule u must log then follow by accpet or 
drop :-)



hamals@infinito.it wrote:

>
> hello
>
> I wrote all my firewall rules, and now I would like to log all packet 
> that will be dropped by my policy rule..
>
> ..how can I do it?
>
> what kind of rules do I need?..and where have I to write them?
>
> thanks
> _______________________________________
> Connessione ed e-mail gratuita da 10 mb
> consultabile tramite web e tramite pop.
> www.infinito.it vieni a scoprire tutti i nostri servizi!
>
> http://www.infinito.it/xmail
>
>
>


