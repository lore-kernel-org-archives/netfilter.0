From: =?utf-8?q?Fr=C3=A9d=C3=A9ric=20Gonzatti?= <fred99@libertysurf.fr>
Subject: Re: Firewall IP change
Date: Mon, 2 Aug 2004 14:07:07 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408021407.07897.fred99@libertysurf.fr>
References: <40FEE340.8090907@ctwa.com> <200407231457.30104.fred99@qualiflow.com> <200407241647.52286.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407241647.52286.Antony@Soft-Solutions.co.uk>
Content-Disposition: inline
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


If I replace in my iptables script :
iptables -A POSTROUTING -t nat -o eth2 -j SNAT --to my_public_IP
by
iptables -t nat POSTROUTING -o eth1 -j MASQUERADE

...I can access to the internet faster !

Have you got any idea ?

My ipatbles script is present in one of my mail (Firewall IP change title)

Thanks,

Fred



