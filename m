From: Esteban <eribicic@sinectis.com>
Subject: Re: masquerading
Date: 24 Feb 2003 07:40:48 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1046083248.13510.31.camel@debian>
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
To: netfilter@lists.netfilter.org


ive tryed that, but the second rule does not match..any ther idea?
another:
is any diference on doing -j snat --to--source {internet ip} and give
{internet ip} two values or something like that? instead -j masquerade?
thanks again


On Mon, 2003-02-24 at 07:21, hare ram wrote:
> Hi
> 
> AFAIK
> 
> set another rule with ppp0 instead of eth2
> i think it should work
> 
> hare
> ----- Original Message ----- 
> From: "Esteban" <eribicic@sinectis.com>
> To: <netfilter@lists.netfilter.org>
> Sent: Monday, February 24, 2003 2:20 PM
> Subject: masquerading
> 
> 
> > hello,
> > im masquerading my local network like this by now:
> > iptables -t nat -A POSTROUTING -o eth2 -j MASQUERADE
> > everything works fine.
> > but, now i added another internet gw (ppp0) wich is balanced
(iproute2)
> > with eth2.
> > how do i set the masquerading to balance both gws? (eth2 and ppp0) ?
> > thanks in advance
> > Steve
> > 
> > 


