From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: how can i combine these 2 iprules
Date: Fri, 5 Mar 2004 20:17:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040305191716.DD886DBC@sterenborg.info>
References: <3590.128.59.176.161.1078512825.squirrel@sojourn.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3590.128.59.176.161.1078512825.squirrel@sojourn.dyndns.org>
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

> > On Friday 05 March 2004 6:27 pm, Technical wrote:
> >
> >> -A RH-Firewall-1-INPUT ! -s cnnp1.com  -j LOG --log-prefix 
> "IPTABLES: "
> >> -A RH-Firewall-1-INPUT ! -s cnnp2.com  -j LOG --log-prefix 
> "IPTABLES: "
> >
> > iptables -N mychain
> > iptables -A mychain -s cnnp1.com  -j RETURN
> > iptables -A mychain -s cnnp2.com  -j RETURN
> > iptables -A mychain -j LOG --log-prefix "IPTABLES: "
> > iptables -A RH-Firewall-1-INPUT -j mychain
>
> What is -j Return doing

Your match is reversed.
You matched everything that does not cnnp1.com and LOGged it. After that you
matched everything that does not match cnnp2.com and LOGged it.
So, you logged everything that matched cnnp1.com or cnnp2.com once, else
twice.

Antony's solution redirects a packet to the "mychain" user chain.
If a packet matches either cnnp1.com or cnnp2.com, it RETURNs to the
"RH-Firewall-1-INPUT" chain.
If a packet didn't match, it gets logged and the "mychain" chain ends, thus
the packet returns to the chain that called it ; the "RH-Firewall-1-INPUT"
chain.


Gr,
Rob


