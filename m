From: "hare ram" <hareram@sol.net.in>
Subject: Re: masquerading
Date: Mon, 24 Feb 2003 15:51:06 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004e01c2dbee$71539e40$13fcc5cb@Housecall>
References: <1046076608.12098.24.camel@debian>
Reply-To: "hare ram" <hareram@sol.net.in>
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
To: Esteban <eribicic@sinectis.com>, netfilter@lists.netfilter.org

Hi

AFAIK

set another rule with ppp0 instead of eth2
i think it should work

hare
----- Original Message ----- 
From: "Esteban" <eribicic@sinectis.com>
To: <netfilter@lists.netfilter.org>
Sent: Monday, February 24, 2003 2:20 PM
Subject: masquerading


> hello,
> im masquerading my local network like this by now:
> iptables -t nat -A POSTROUTING -o eth2 -j MASQUERADE
> everything works fine.
> but, now i added another internet gw (ppp0) wich is balanced (iproute2)
> with eth2.
> how do i set the masquerading to balance both gws? (eth2 and ppp0) ?
> thanks in advance
> Steve
> 
> 
> 
> 


