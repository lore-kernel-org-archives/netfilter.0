From: =?utf-8?q?Fr=C3=A9d=C3=A9ric=20Gonzatti?= <fred99@libertysurf.fr>
Subject: Re: Firewall IP change
Date: Mon, 26 Jul 2004 14:13:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407261413.27558.fred99@libertysurf.fr>
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


Thanks for your answer but if I understand whant you mean, I have only to add 
the following line in my iptables script :
iptables -A POSTROUTING -t nat -o eth2 -j DNAT --to 62.160.X.Y
With this line the computers on my LAN and my DMZ will allow to exit to the 
Internet ??

With the two following lines will it work ?
iptables -t nat POSTROUTING -s 172.16.0.0/16 -o eth2 -j MASQUERADE
iptables -t nat POSTROUTING -s 192.168.2.0/24 -o eth2 -j MASQUERADE

Thanks

Frederic






