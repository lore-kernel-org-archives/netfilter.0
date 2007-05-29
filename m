From: Gopinath <gopinath.u@gmail.com>
Subject: Re: Default deny rule
Date: Tue, 29 May 2007 20:14:44 +0530
Message-ID: <d2af4f000705290744i4518ae7bu11b1fb7e2eb14a68@mail.gmail.com>
References: <d2af4f000705092228x3746eb10u9b81264581a57e46@mail.gmail.com>
	<464440C4.7000605@freemail.hu>
	<d2af4f000705132302t3d8b2c8eo6158406d02af9f91@mail.gmail.com>
	<4648570D.4040308@freemail.hu>
	<d2af4f000705150134r4d5bbf84r96d0f91aae9a725d@mail.gmail.com>
	<4651C2EE.2080803@freemail.hu>
	<d2af4f000705280645j74a57571j65bb21ab0bfcee40@mail.gmail.com>
	<465C24E0.8010001@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=lwR4XN5SGZY9vmnIi6cqSwfkeJsI569eFKaRQzuQPKlu38wkf48uQQobUDrfDnU1j0BG0XGzOtnAcafgscK2vao5Obt/Mu64IHlEIGR70jMroODliy0QuQeO0nDaPZQ4JsI8eqmmGgA7JUiQ3c56/EBtex3+OL+03xmq7gPXQyc=
In-Reply-To: <465C24E0.8010001@freemail.hu>
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
Cc: netfilter@lists.netfilter.org

Thank your very much Lajos !!!!!!!!!!!!!!!

It is working fine now after adding the line "-m conntrack --ctstate
DNAT" in the ACCEPT statement of the FORWARD chain as you've said in
previous mail.

Could you please explain how it works after adding the line "-m
conntrack --ctstate DNAT" in the ACCEPT stmt of FORWARD chain ? I'm
very eager to know this :-)

Regards,
Gopinath.U


I have also upgraded my iptables to version 1.3.7

On 5/29/07, G=E1sp=E1r Lajos <swifty@freemail.hu> wrote:
> Hi Gopinath,
> > Hi Lajos,
> >
> > Thanks for your suggestion.
> >
> > I had upgraded my OS  to fedora 6, and also enabled logging option for
> > the DROP packets. Now the Default denying functionality is working
> > fine. But this time I face another problem. ie., i have applied static
> > NAT on my firewall. In my simulation setup i am able to connect the
> > other end (INTERNAL) machine using the NAT IP assigned, from the
> > EXTERNAL machine as well through the actual IP of the
> > machine(INTERNAL). This spoil my purpose for NATTING. I don't know why
> > this happen. I suspect that there could be some problem with my NAT
> > module. Please suggest...
> I think that this is not a NATing but a routing problem.
> I do not know your current script but maybe there is an accept that
> allows this state.
> I would add the following option to the ACCEPT rule in the FORWARD chain:
>
> -m conntrack --ctstate DNAT
>
> >
> > Is there any need to upgrade my kernel to add further support ?
> >
> I do not think so but it is good to have an up-to-date system.
> > Regards,
> > Gopinath. U
>
> Swifty
>

