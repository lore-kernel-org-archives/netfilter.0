From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: question on ICMP
Date: Thu, 23 Jan 2003 21:22:32 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0301232036390.7027@dns.toxicfilms.tv>
References: <008301c2c31d$9d690a90$3201a8c0@leonardo>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <008301c2c31d$9d690a90$3201a8c0@leonardo>
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
To: "Leonardo Rodrigues ( listas )" <leolistas@solucoesip.net>
Cc: netfilter ML <netfilter@lists.samba.org>

>     Is it possible to specify icmp type AND subtypes ( in numerical format )
> in iptables rules ? I know I can easily specify type, but I'm unsure about
> subtypes ..
you mean:
iptables -A INPUT -p icmp --icmp-type 8/0 -j ACCEPT

it's all ok to do that.

Regards,
Maciej Soltysiak


