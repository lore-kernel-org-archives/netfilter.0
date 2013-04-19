From: Ambroz Bizjak <ambrop7@gmail.com>
Subject: Re: Remote IP in packet sent from WAN to LAN
Date: Fri, 19 Apr 2013 15:03:51 +0200
Message-ID: <CAOA3yKJiHwziR0g3WNSWp0Pz6Z86UA2USUv7LtGaPa=P67O16w@mail.gmail.com>
References: <47E0AF00D6313049B892E93D60AACDCA45C7193D@AMSPRD0410MB361.eurprd04.prod.outlook.com>
	<CAOA3yK+twroq_pO0Y2H0r_b_h19WGBapdAv3dK_8GDbWpp_mfA@mail.gmail.com>
	<47E0AF00D6313049B892E93D60AACDCA45C7730F@AMSPRD0410MB361.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type:content-transfer-encoding;
        bh=4ktyZnFTapSSQRsm2cnJ8Jp3dQF0AKg7A+Uwp/VtyeU=;
        b=tG9NE8kWUmq71Yyc39gc+P0S5w0I7c1mWcywjosJ1peHUhAc/x9aQC1u3mQzaV1QzF
         lFZVVK2bNbY6yDIV3rWEPrSRYa0DKaWUYYiH3d2YD++Gr1+rUXpzX6vF2J7UFQVUmbib
         I2FCPnezJMdFvKLn2oU2JmnaUFBhdj0MP/2HQIFJes96+HVe0iHB3UNlGzUDsnLON/AU
         7RSagsXmmRrEU9ZFyHa4C24jvOiv1zoiQZmxb87PhT5zfSsupGXTVFjk5SyCZEvs/jAG
         2zO1M+IHXsOLqWP9xKLfdb9I5D2+37Pa6sca5eyh9KTo+M39rAzSXHLbOH+JsYd7Cpl2
         e3EQ==
In-Reply-To: <47E0AF00D6313049B892E93D60AACDCA45C7730F@AMSPRD0410MB361.eurprd04.prod.outlook.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?ISO-8859-2?Q?Piotr_Paw=B3owski?= <piotr.pawlowski@goyello.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I think the only way this can happen is if you accidentally did SNAT.
Is there a SNAT (or MASQUERADE) rule somewhere? Make sure it only
applies to packets going *out* into the Internet.

On Fri, Apr 19, 2013 at 2:50 PM, Piotr Paw=C5=82owski
<piotr.pawlowski@goyello.com> wrote:
> Not exactly.
> On the iptables-based router there is port forwarding to services run=
ning on servers inside LAN. I.e. WWW server is running on 192.168.1.2:8=
0 , in iptables I have port forwarding (nat/prerouting) from external I=
P (2.3.4.5:80) to 192.168.1.2:80 . Now on 192.168.1.2 in WWW access log=
s I see internal IP of the router instead of remote IP of the client, w=
hich requested 2.3.4.5:80 in browser.
>
> Best egards
> ---
> Piotr Paw=C5=82owski
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
