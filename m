From: "Joao TERRA" <j_petrucci@terra.com.br>
Subject: Re: bytes counting
Date: Fri, 23 Apr 2004 17:13:02 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00f301c4296f$61cd7520$6300a8c0@netsolutionsfort.com.br>
References: <086C43C9A9A1A541BFDFABCFDA05F58901448BAB@mailnew.tecnun.es> <008501c42957$8b4895a0$6300a8c0@netsolutionsfort.com.br> <200404231854.23706.Antony@Soft-Solutions.co.uk>
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

He'll have to make some adjustments.. "-s !" maybe resolv.
----- Original Message -----
From: "Antony Stone" <Antony@Soft-Solutions.co.uk>
To: <netfilter@lists.netfilter.org>
Sent: Friday, April 23, 2004 2:54 PM
Subject: Re: bytes counting


> On Friday 23 April 2004 6:22 pm, Joao TERRA wrote:
>
> > You can put the rule on:
> > #iptables -t mangle -I POSTROUTING -o
INTERFACE_OF_192.168.0.50_SUBNET -d
> > 192.168.0.50
> > then you can account in both directions separately
>
> Unfortunately this would count bytes going to 192.168.0.50 from anywhere
> (including the other private LAN), not just from the Internet, which is
what
> was required, I believe.
>
> Regards,
>
> Antony.
>
> > ----- Original Message -----
> > From: "Arrizabalaga, Saioa" <sarrizabalaga@ceit.es>
> > To: <netfilter@lists.netfilter.org>
> > Sent: Friday, April 23, 2004 10:42 AM
> > Subject: bytes counting
> >
> >
> > Hello everyone,
> >
> > I have been reading some mails in this listing and it is said the best
> > place to count bytes/packets is the mangle table, but I have a problem.
> >
> > I have three network cards in my linux box: eth0 (private LAN), eth1
> > (private LAN) and eth2 (internet).
> >
> > I would like to count the bytes/packets from/to 192.168.0.50 (it is in
> > eth0) that goes/comes to/from internet (eth2).
> >
> > These are the rules I have:
> >
> > iptables -A POSTROUTING -t mangle -o eth2 -s 192.168.0.50
> >
> > With this rule I catch all the packets going from 192.168.0.50 to eth2,
> > but I know where to put the rule to catch the packets going from eth2 to
> > 192.168.0.50, because as far as I can see it, when I put the rule:
> > iptables -A PREROUTING -t mangle -i eth2 -d 192.168.0.50 nothing is
> > caught because the packet has not been SNAT-ed yet. Am I wrong?
> >
> > Any help would be appreciated.
> >
> > Saioa Arrizabalaga
>
> --
> This email is intended for the use of the individual addressee(s) named
above
> and may contain information that is confidential, privileged or unsuitable
> for overly sensitive persons with low self-esteem, no sense of humour, or
> irrational religious beliefs.
>
> If you have received this email in error, you are required to shred it
> immediately, add some nutmeg, three egg whites and a dessertspoonful of
> caster sugar.   Whisk until soft peaks form, then place in a warm oven for
40
> minutes.   Remove promptly and let stand for 2 hours before adding some
> decorative kiwi fruit and cream.   Then notify me immediately by return
email
> and eat the original message.
>
>                                                      Please reply to the
list;
>                                                            please don't CC
me.
>
>
>


