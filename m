From: "Franck ZOCCOLO" <franck@zoccolo.com>
Subject: RE : Multiple -d flags
Date: Sat, 11 Jan 2003 22:14:06 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c2b9b6$601aa2e0$fd42a8c0@zoccolo.com>
References: <3E20855F.9040006@mattiamartinello.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E20855F.9040006@mattiamartinello.com>
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
To: 'Mattia Martinello' <mattia@mattiamartinello.com>, netfilter@lists.netfilter.org

> The rule:
> 
> iptables -A FORWARD -s 0.0.0.0/0 -d 
> 213.21.136.8/255.255.255.255 -dport 
> 80 -j ACCEPT
> 
> shows me the following error:
> 
> iptables v1.2.5: multiple -d flags not allowed

You should use '--dport' instead of '-dport'.


