From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Iproute2 and fwmark usage
Date: Sun, 11 Jan 2004 21:07:09 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401112107.09764.Antony@Soft-Solutions.co.uk>
References: <001401c3d63b$e9ebdff0$1684188d@Kiste> <001501c3d6fc$3a889c80$1684188d@Kiste> <000d01c3d885$8181e710$1684188d@Kiste>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000d01c3d885$8181e710$1684188d@Kiste>
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

On Sunday 11 January 2004 8:57 pm, Thhoep wrote:

> in my opinion something is completely wrong with my 2.4.23 kernel. i just
> used another server of mine to reproduce the same situation. for this
> purpose i compiled a completely new 2.4.23 kernel with advanced routing and
> netfilter and whatever support and installed fresh versions of the iptables
> and iproute2 package with the debian system (using 'stable').

What version of iptables is that?   Is it as up to date as the netfilter 
version you've got in your shiny new kernel?

> because the host only has 1 ethernet interface i used a ppp-over-ssh tunnel
> to simulate routing behaviour.

This sounds a little bit dodgy to me....

> then i added a firewall rule
> "iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE"
>
> is anything wrong with it??

No, looks perfectly reasonable to me.

> well do make it short: it changed nothing. packets still get un-masqueraded
> out of ppp0 with local lan ips.

Any chance you can put in another ethernet card and try a simpler routing 
setup?

Antony.

-- 
You can spend the whole of your life trying to be popular,
but at the end of the day the size of the crowd at your funeral
will be largely dictated by the weather.

 - Frank Skinner

                                                     Please reply to the list;
                                                           please don't CC me.


