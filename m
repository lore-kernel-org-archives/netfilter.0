From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: qos and iptables
Date: Tue, 18 Aug 2009 10:27:53 +0530
Message-ID: <cfeab66d0908172157w43bdd611o5329c032258430c8@mail.gmail.com>
References: <cfeab66d0908170909s7e223506g891bb405dd313343@mail.gmail.com>
	 <cfeab66d0908170945p66fdd4a1x3c959b81b67027a8@mail.gmail.com>
	 <56378e320908171021n7e6cf97g5db5d4ba41a7b11a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=uNo9pfCnIyDB9Y25VYiB0OxzokRem4MvIJ+UAFI3GOQ=;
        b=bR2BiJUW0D9Imw29maN1UXysw6jQ05EjRdrv3L1dEQ/B/24afkmSMKwqUQPLZOmBS1
         TqWX2npbThRuL/+lNAu8Cagq6R4vPsJiSehub23hEyDSxwtN/JnmmpASZPvvuFzrd3fG
         Uyk3OZRqNA0omn6cQRBaoNLL9GXohYck5jZ8U=
In-Reply-To: <56378e320908171021n7e6cf97g5db5d4ba41a7b11a@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Richard Horton <arimus.uk@googlemail.com>
Cc: netfilter@vger.kernel.org

Richard ,

i am not using ingress filter ... Can u tell a liitle bit about
forward chain  ? when it will ge executed  ??


All ,

My question is : please look at the diagram . Suppose a packet A is
coming from lan side and is nated and went to wan side . Meanwhile it
should have gone thru  many iptables and traffic queues . I would like
to know the exact flow ........including trafiic queues on both
interfaces ( eth1 and eth0 ) ...





On Mon, Aug 17, 2009 at 10:51 PM, Richard
Horton<arimus.uk@googlemail.com> wrote:
> As far as I know it depends.
>
> If you use the ingress filter to apply QoS then it will be applied on
> eth0 before the prerouting chain on that interface (I think, this is
> good for me though ... hopefully someone will confirm whether I'm
> right or talking out my backside ;) )
>
> If you apply the QoS policy on the output side of eth1 then it will be
> applied last of all immediately prior to packets being dequeued to the
> device for transmission.
>
>
> --
> Richard Horton
> Users are like a virus: Each causing a thousand tiny crises until the
> host finally dies.
> http://www.solstans.co.uk - Solstans Japanese Bobtails and Norwegian Forest Cats
> http://www.pbase.com/arimus - My online photogallery
>
