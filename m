From: JeHo Park <linuxpark@gmail.com>
Subject: Re: [HELP] why the string match does not work in nat tables?
Date: Mon, 31 Jan 2011 20:17:33 +0900
Message-ID: <AANLkTikYs5cvpeuT+thxXGtPA=xosVG05BUk4VWGc8eG@mail.gmail.com>
References: <AANLkTinoBfMTDNVLHuBhMFJHHSrMmP0gwYTz2AX3f_ew@mail.gmail.com>
	<alpine.LNX.2.01.1101310306560.15201@obet.zrqbmnf.qr>
	<AANLkTik02D=agfFrc8VX+Wh4WAg_odm6cEcpbXvbgtqM@mail.gmail.com>
	<alpine.LNX.2.01.1101310337270.19252@obet.zrqbmnf.qr>
	<AANLkTikxZf8zMJxRTGg6BS4uc0PDus+E6cEtfLDQRTQu@mail.gmail.com>
	<4D46824B.2010706@netfilter.org>
	<4D469007.7080606@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=IOajgTR4+ZYY1Fx2DAwqyT27AK2GNkhO/4c2bsIIPSg=;
        b=POpOXNHvb0wfOw9jd298euhVFv42Kf15VmsN7Q5dTGbnPpx3BUt+VWUDq/reBLzlfS
         ngvSJw4f2uqimbyb0/0RXVH4LD0TkcNDcqhoefRQQxtuecJ7PjAKE49mS738ZIggSwpC
         xdNGcN2r4zgTud7zF+XhtoftQB4CSDSA46gbc=
In-Reply-To: <4D469007.7080606@plouf.fr.eu.org>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org, wp@elim.net

thanks pablo, pascal

i just want the client who try to connect any specified site  to
redirect my HTTP proxy server.
but judging from your answers, it seems impossible to filter that
client packets in the NAT table.
anyway thanks


On Mon, Jan 31, 2011 at 7:33 PM, Pascal Hambourg
<pascal.mail@plouf.fr.eu.org> wrote:
> Hello,
>
> Pablo Neira Ayuso a =C3=A9crit :
>> On 31/01/11 03:47, JeHo Park wrote:
>>> anyway, i wonder why there is no TCP payload in the skb of the stri=
ng
>>> or wurl match.
>>
>> Because you only see the first packet of the flow in the NAT table.
>
> And the first packet of a TCP connection usually carries no data.
> If you what you want to achieve is NAT a TCP connection based on the
> payload, I am afraid this is not possible because the definitive NAT
> mapping is defined from the first packet only.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>
--
To unsubscribe from this list: send the line "unsubscribe netfilter-dev=
el" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
