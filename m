From: Gopinath <gopinath.u@gmail.com>
Subject: Re: Default deny rule
Date: Mon, 28 May 2007 19:15:11 +0530
Message-ID: <d2af4f000705280645j74a57571j65bb21ab0bfcee40@mail.gmail.com>
References: <d2af4f000705092228x3746eb10u9b81264581a57e46@mail.gmail.com>
	<464440C4.7000605@freemail.hu>
	<d2af4f000705132302t3d8b2c8eo6158406d02af9f91@mail.gmail.com>
	<4648570D.4040308@freemail.hu>
	<d2af4f000705150134r4d5bbf84r96d0f91aae9a725d@mail.gmail.com>
	<4651C2EE.2080803@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=WfrCKPA5MPftldSQBGeZ2Eq/q4DAAsYLblUR78SdGR+KsB6TTKfmD4DQrMpn/TshBGOENioxlUYxBTVgzngvic/4VIaHEYWVQwfJQRBuWXedfsXcep6hNiUtMQ16aRYkyHA7ngKRWpnc7NHAHhc1pjnJV33puJglhleKuDtdrYE=
In-Reply-To: <4651C2EE.2080803@freemail.hu>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Cc: Netfilter IPtableMailinglist <netfilter@lists.netfilter.org>

Hi Lajos,

Thanks for your suggestion.

I had upgraded my OS  to fedora 6, and also enabled logging option for
the DROP packets. Now the Default denying functionality is working
fine. But this time I face another problem. ie., i have applied static
NAT on my firewall. In my simulation setup i am able to connect the
other end (INTERNAL) machine using the NAT IP assigned, from the
EXTERNAL machine as well through the actual IP of the
machine(INTERNAL). This spoil my purpose for NATTING. I don't know why
this happen. I suspect that there could be some problem with my NAT
module. Please suggest...

Is there any need to upgrade my kernel to add further support ?

Regards,
Gopinath. U

On 5/21/07, G=E1sp=E1r Lajos <swifty@freemail.hu> wrote:
> Hi,
>
> Gopinath =EDrta:
> > Hi,
> >
> > My objective is to replace my existing firewall with a Linux firewall.
> > We have point to point connectivity through VSAT with one of our
> > customer. The only major thing which the firewall need to do is STATIC
> > NAT. As you may see since this is a point to point connectiviy all the
> > IPs employed are Private IPs. While checking the f/w in simulation
> > mode, things were working fine (except default denying). I already
> > tried to achieve DEFAULT DENY by changing the default behaviour of
> > FORWARD policy to DROP by issuing the command "iptables -P FORWARD
> > DROP". But when i do this all the traffic were getting dropped. So
> If EVERYTHING is dropped then your rules do not get hit by the traffic.
> (Your rules are wrong.)
> Try to capture the traffic. Maybe you can find the problem.
> >
> > again i tried by appending a policy in forward chain (last rule) to
> (policy is always the last rule... :D )
> > drop all the packets by default. But even this didn't worked out. Hope
> > you can understand my requirement & how i do the NATTing from my
> > previous mail.
> >
> > Even though i have worked a bit with iptables before, I am a begginer
> > in building a linux firewall with iptables :-)
> >
> > Cheers :)
> > Gopinath.U
>
> Swifty
>
>

