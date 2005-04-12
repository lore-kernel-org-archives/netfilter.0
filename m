From: "Wennie V. Lagmay" <wlagmay@yanbulink.net>
Subject: Re: msn and yahoo messenger voice chat
Date: Tue, 12 Apr 2005 17:55:13 +0300
Message-ID: <001101c53f6f$a198e9c0$dc0aa8c0@winntpro>
References: <1113309566.425bc17e6a46f@webmail.yanbulink.net>
	<20050412123940.GA26073@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

Hi Jason just to inform you what have I learn with the configuration from
you.
With this rule:
iptables A POSTROUTING -s 192.169.10.0/24  -j SAME --to
xxx.xxx.85.113-xxx.xxx.85.115, it is intermitent, i mean sometimes it
connects to voice but sometimes it does't.

With this rule: iptables -t nat -A POSTROUTING -s 192.169.10.0/24  -j
SAME --to  xxx.xxx.85.113
It is ok, it connects all the time, I have not encounter any entermitent
connection. This is ok but one might do some nasty things on the net then
the single IP might be block.

But anyway thank you very much for this great help, I really really
appreciate it.

Regards,

Wennie




----- Original Message -----
From: "Jason Opperisano" <opie@817west.com>
To: <netfilter@lists.netfilter.org>
Sent: Tuesday, April 12, 2005 3:39 PM
Subject: Re: msn and yahoo messenger voice chat


> On Tue, Apr 12, 2005 at 03:39:26PM +0300, Wennie V. Lagmay wrote:
> >
> > Thank you Jason, I just want to confirm is it to be writen
> >
> > like this alone:
> > iptables -t nat -A POSTROUTING -s 192.169.10.0/24  -j SAME --to
> > xxx.xxx.85.113-xxx.xxx.85.115
>
> yes--SAME can completely replace your SNAT rule, if you so desire.
>
> > or the original SNAT plus SAME like this :
> > IPTABLES -A POSTROUTING -s 192.169.10.0/255.255.255.0 -j
SNAT --to-source
> > xxx.xxx.85.113-xxx.xxx.85.115
>
> that rule isn't completely correct, as it has no "-t nat" in it.
>
> > iptables -t nat -A POSTROUTING -s 192.169.10.0/24  -j SAME --to
> > xxx.xxx.85.113-xxx.xxx.85.115
>
> if you're asking if you should have a SNAT rule followed by a SAME rule
> that are identical except for the target, then no--the SAME rule will
> never be matched in that scenario.
>
> if you want to combine SAME and SNAT--put the SAME rule first and have
> it match only on the specific ports used by the application in question
> that cannot handle src IP changes; and the SNAT rule second to catch the
> rest of the general traffic.
>
> HTH...
>
> -j
>
> --
> "Chris: Where do you think you go when you die?
>  Southern boy: I learned from church that if you're good you go to
>  heaven but if you're bad, you go to a place where the dead believe
>  they're still living and they pray for death but death won't come.
>  Chris: UPN?"
>         --Family Guy
>
>



