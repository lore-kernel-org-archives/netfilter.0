From: "Andreas Wolff" <aw@mw-itcon.de>
Subject: Re: assymetrical routing, iptables problem.
Date: Fri, 4 Oct 2002 08:49:07 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002b01c26b72$22e964c0$03c0a8c0@aw01>
References: <20021003042738.24234.8348.Mailman@kashyyyk>
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


> on A:
>
> # iptables -t nat -A PREROUTING -d 1.1.1.1 -p tcp --destination-port 80 \
>   -j DNAT --to-destination 2.2.2.2:8000
>
> Redirects packets destined for 1.1.1.1 port 80 to 2.2.2.2 port 8000. This
> is a way to 'tag' the packets (I opted against using any TCP options, as
> routers/firewalls along the way may play with said options).
>

> on B:
>
> # iptables -t nat -A POSTROUTING -s 2.2.2.2 -p tcp --source-port 8000 -j \
>   SNAT --to-source 1.1.1.1:80
>
I don't understand this rule. Do you really need this? The the nating of the
the packets going back is done on A. Doesn't this rule break the nating of
packets going back to A as they do not have the source address and port
expected by a (the 2.2.2.2 and the port 8000)?

Regards,

Andreas


