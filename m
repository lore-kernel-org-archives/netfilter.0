From: "Holger Kinkelin" <holger.kinkelin@gmail.com>
Subject: Re: Redirecting incoming packets to other port
Date: Wed, 11 Oct 2006 11:44:14 +0200
Message-ID: <c936c6b70610110244m34760db8wc1a942becc475910@mail.gmail.com>
References: <c936c6b70610110109v73453362h65b8e34d6771dadd@mail.gmail.com>
	<452CAFDC.3070909@eccotours.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <452CAFDC.3070909@eccotours.co.za>
Content-Disposition: inline
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
To: Brent Clark <bclark@eccotours.co.za>
Cc: netfilter@lists.netfilter.org

Hello,
no this doesn't seem to work.

I can REDIRECT packets sent BY my computer, not packets sent TO it. Is
there maybe another posibility?

Regards,
Holger

PS: Thanks to Brent for his reply

2006/10/11, Brent Clark <bclark@eccotours.co.za>:
> Holger Kinkelin wrote:
> > Hello everybody
> >
> > how can I redirect packets sent to my computer to another port?
> >
> > I tried: iptables -A PREROUTING -t nat -p udp --dport 5060 --sport
> > 5060 -j DNAT --to-destination 192.168.0.21:5063
> >
> > This rule is accepted but doesn't do anything. There are no other
> > rules that could cause side effects.
> >
> > Regards,
> > Holger
>
>
> http://www.linuxtopia.org/Linux_Firewall_iptables/x4508.html
>
> HTH
>
> Kind Regards
> Brent Clark
>
>

