From: Daniel Lopes <lopsch@lopsch.com>
Subject: Re: UDP nat question
Date: Tue, 19 Apr 2005 15:31:10 +0200
Message-ID: <4265081E.7@lopsch.com>
References: <4263C3A2.70006@inescporto.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4263C3A2.70006@inescporto.pt>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Filipe Abrantes schrieb:
> Hi all,
> 
> I have a basic question about iptables UDP NAT.
> 
> Imagine that you have 2 UDP sessions in your private LAN using the same 
> port. How does iptables nat these connections? One of the sessions will 
> get one external port of the NAT machine and the other session will get 
> another one? Does the usual MASQUERADE command suffice to achieve this?
> 
> iptables MASQUERADE command:
> 
> $IPTABLES -t nat -A POSTROUTING -o $OUTBOUND_IFACE -j MASQUERADE
> 
> Hope I have made myself clear and,
> 
> Thanks for your attention
> 
> Filipe Abrantes
> 

For example:
machine 1 running an application on port 1465
machine 2 running an application also on 1465
both make a DNS request to Port 53 UDP
the srcip of the second request reaching the router will be mapped for 
that time to a free port on the router. AFAIK

