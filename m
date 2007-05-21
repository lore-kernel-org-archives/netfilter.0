From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Packets lost
Date: Mon, 21 May 2007 17:59:39 +0200
Message-ID: <4651C1EB.8090004@freemail.hu>
References: <3388.10.107.26.27.1179320821.squirrel@gpo.iitb.ac.in>
	<464B19A9.700@freemail.hu>
	<1845.10.107.26.27.1179384883.squirrel@gpo.iitb.ac.in>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1845.10.107.26.27.1179384883.squirrel@gpo.iitb.ac.in>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Vasantha Kumar Puttappa <vasanthakumar@iitb.ac.in>
Cc: netfilter@lists.netfilter.org

Vasantha Kumar Puttappa =EDrta:
> Hi Lajos,
>  Thanks for responding so fast. I did try adding the forward rule, but
> still packets are missing.
>  Let me give you more insight into what I am trying do.
>  I have a vitrual network interface and 2 physical network interface (o=
ne
> Ethernet based, and other 802.11 based). The virtual network interface
> dynamically binds to any one of the above physical interfaces for packe=
t
> transmission. The issue of packet loss occurs **only** during link
> switching.
>  =20
What is this "link switching" in real ? What about routing and source=20
addresses ?
> I feel that the following issues might be the possible reasons for the
> packet loss.
>
> 1. Due to missing soft_IRQ interrupt for packets and hence packet loss =
( i
> have no proof to back this)
> 2. Due to incompatible wireless device driver.
>
>
> Any thoughts on this ?
>  =20
What if you use a bridge on those three and the condition extension of=20
iptables?

Swifty


