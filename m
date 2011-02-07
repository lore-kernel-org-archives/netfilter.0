From: Matty Sarro <msarro@gmail.com>
Subject: Re: Linux bridge/switch port mirroring/SPAN/port monitoring/Roving Analysis?
Date: Mon, 7 Feb 2011 10:05:14 -0500
Message-ID: <AANLkTi=0379ZQS7NTO4OxNkkscRiwn2a8VFWNZaGmSOj@mail.gmail.com>
References: <AANLkTikP+f97ohiY6DCi-zogvde=d-rji8txa9RPGJd8@mail.gmail.com>
	<20110207085055.0acf6040@catus>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=QMkDvjGWPl/rsYSrcKbc+K9Go6IhIr2SFkanSmr5Zo0=;
        b=Ntvw+FHtURr0KsmYaq+NJSiGaR3qxA9EN1HDOnv6rgKajW/BSXS1aBjgWKHGA3Bq80
         SWH4eSfH9PqstUOBNrBlcru8zRhIqvmmPiFGLr/Xl8StLHljBlMim+TYIsTJyGe1MWSA
         KzQC3bFlDvAJg1AjtxYFUsjBunH3wCgWC8b4k=
In-Reply-To: <20110207085055.0acf6040@catus>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: Erik Andersen <erik.b.andersen@gmail.com>, netfilter@vger.kernel.org

I know port mirroring is supported, however I've never implemented it.
SPAN isn't supported; its cisco proprietary.

On Mon, Feb 7, 2011 at 2:50 AM, Marek Kierdelewicz <marek@piasta.pl> wr=
ote:
> Hi,
>
>>Is there a way to port mirroring/SPAN on a linux bridge? If so, what
>>would I need to do to set it up? I'm hoping to port morror to
>>vboxnet0.
>
> Mirroring functionality is build into ifb[1]. There's tc action "mirr=
ed
> egress mirror" which, used in a proper context, can mirror ingress
> and/or egress traffic to other interface. In your case, mirrored
> interface would be br0.
>
> Here [2] our colegue is describing ingress mirroring from eth1 to
> eth2-5.
>
> And important note here [3] about using "protocol all" in tc filter, =
if
> you also want to get non-ip traffic mirrored.
>
> [1]
> http://www.linuxfoundation.org/collaborate/workgroups/networking/ifb#=
IFB_Example
> [2] http://marc.info/?l=3Dlinux-netdev&m=3D128853067804910&w=3D2
> [3] http://marc.info/?l=3Dlinux-netdev&m=3D128861016403775&w=3D2
>
> Best regards,
> Marek Kierdelewicz
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>
