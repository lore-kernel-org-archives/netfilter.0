From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: simply confusing
Date: Thu, 23 Jan 2003 21:24:41 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0301232123190.7027@dns.toxicfilms.tv>
References: <20030123200314.99399.qmail@web11401.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030123200314.99399.qmail@web11401.mail.yahoo.com>
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
To: Ralph Churchill <mrchucho@yahoo.com>
Cc: netfilter@lists.netfilter.org

> iptables -A INPUT --source 192.168.0.0/16 -j DROP
>
> Now, shouldn't that block any and ALL traffic from any
> computer on the 192.168.*.* subnet?
well that is enough to block all packets from that subnet,
however, maybe you have other rules that accept traffic before
this rule.
try -I INPUT to put it at the begining of the chain.

Regards,
Maciej Soltysiak


