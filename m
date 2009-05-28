From: Oskar Berggren <oskar.berggren@gmail.com>
Subject: Re: Does nat rules take effect on local ip traffic?
Date: Thu, 28 May 2009 22:10:25 +0200
Message-ID: <33be4bb30905281310g5d8f4bbdxe0673ce9cce0a1fc@mail.gmail.com>
References: <a4ece3070905281247l18c3276epf1cfd116267b913f@mail.gmail.com>
	 <a4ece3070905281258i66f6e1d1l352284fd756755b4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=wZW2apH7zCXiyAP6g5EighYadRUQ2SnzTYuSEfTMZ1g=;
        b=vQlcE2eZbesT/vLCKFbPKZZxjWSBOdRQBRY18C0vAXJ9BmNckK7TT9LoXgtluuHIBH
         Om+AfW0oDoLm20bKlTZAX/gUvokOPuhnv9LUNyk9BuQqL8D+XtazvAmmMYxT69v7W7HL
         CgNyJsR4aiiFGYd5rgPyAzi2qBMFvppL10AYA=
In-Reply-To: <a4ece3070905281258i66f6e1d1l352284fd756755b4@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Sharevon <sharevon@gmail.com>
Cc: netfilter@vger.kernel.org

See http://jengelh.medozas.de/images/nf-packet-flow.png

/Oskar


2009/5/28 Sharevon <sharevon@gmail.com>:
> Hi,
>
> The scenario is like,
>
> There=A0is a=A0system, which has a LAN=A0interface with ip 192.168.1.=
1/32
> and a WAN interface with ip, let's say, 10.0.0.1/32.
> There are some nat rules in nat table, trying to map traffic from
> {src:192.168.1.1:5000, dst:192.168.1.1:6000} to {src:10.0.0.1:6000,
> dst:10.0.0.2:5000}.
> Will this nat rules take effect on this local ip traffic?
>
> I mean if an application send a ip traffic with src:192.168.1.1:5000
> and dst:192.168.1.1:6000. Was nat rule supposed to be applied to
> change it to an ip traffic with src:10.0.0.1:6000 and
> dst:10.0.0.2:5000? or the system just send the ip traffic to
> 192.168.1.1:6000 directly without nat rules taking effect.
>
> In my system, it seems like nat rules didn't apply to the traffic,
> because another application on the other system with ip 10.0.0.2
> didn't receive any traffic on port 5000. But I'm not sure if other
> factors impact=A0this, making it looks like the nat rules never=A0be
> applied.
>
> Thanks
> Sean Feng
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
