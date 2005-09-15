From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: iptables rules
Date: Thu, 15 Sep 2005 18:23:55 +0200
Message-ID: <4329A01B.4020300@mnemon.de>
References: <1123184190.21749.34.camel@ndspc131.p.n-dsi.com>	
	<Pine.LNX.4.61.0508050832310.20623@yvahk01.tjqt.qr>	
	<1123704837.3708.1.camel@ndspc131.p.n-dsi.com>	
	<1126649450.4790.5.camel@ndspc131.p.n-dsi.com>	
	<1126797736.4790.24.camel@ndspc131.p.n-dsi.com>	
	<432992C0.2000404@mnemon.de>
	<1126798629.4790.26.camel@ndspc131.p.n-dsi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1126798629.4790.26.camel@ndspc131.p.n-dsi.com>
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

Peggy Kam wrote:
> did the manpage gets changed recently?  the iptables manpage that I see
> states that:
> 
> --port [port[,port]]
>         Match if the both the source and destination ports are equal to
>         each other and to one of the given ports.


I see. You are referring to -m mport --port*s* (by the way, there is a 
typo or are you referring to another module ?), which is different from 
-m multiport --port*s* port[...] - which I was referring to. Your rule was

... -m multiport --ports 22,23,24,25 -j ACCEPT

So I looked for multiport.

HTH,

Joerg

