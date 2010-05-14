From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: printk mac address --hangs
Date: Fri, 14 May 2010 08:07:04 +0530
Message-ID: <AANLkTiks_dxzBC-TT58Y0EpjKniUVfEDry66meYFsFc5@mail.gmail.com>
References: <AANLkTinl1GZIOHaxfD7WgXPc2miKkRi3MDkkcaW4P6Zj@mail.gmail.com>
	 <alpine.LSU.2.01.1005131818450.9398@obet.zrqbmnf.qr>
	 <AANLkTinnqyBwCYQB1rLWI04VBr28DRludbfO9cFcTgAo@mail.gmail.com>
	 <alpine.LSU.2.01.1005131916081.9398@obet.zrqbmnf.qr>
	 <AANLkTin6o-SVB10bETHs40Pvb_Cv0HWyIVzh2FA7I2iK@mail.gmail.com>
	 <alpine.LSU.2.01.1005132121480.31136@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=6ESF7KmYT7Ca4q8KoQzoBWr3FhjtRqLpYFY5v+7U1Rk=;
        b=oUVwmrncv0hIwVoQTTvprdp+F78LC+cvPlh8BffEUIeLfeesfR8WYF5/FO+DRy271t
         6ZcXPmZXlav5J/DB6sG/JyJWNHzJcvgGlKrV+i/Y7116fhtQKAnnwh1RERzsZ6LN3csO
         FmAk4ufd5lXHbdRINLiiu/M8j9M8xteHnw+EM=
In-Reply-To: <alpine.LSU.2.01.1005132121480.31136@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Netfilter mailing list <netfilter@vger.kernel.org>

On Fri, May 14, 2010 at 12:56 AM, Jan Engelhardt <jengelh@medozas.de> w=
rote:
>>Packets from lo will hit NF_IP_LOCAL_OUT hook  ?
>
> Clearly.

Could you please explain a little about the traversal of a local
packet . say if i do : ping 127.0.0.1 .? what are the chains/hooks  it
will hit ?

Is there any API to check whether it is a ether packet or not ?
Thanks,
Ratheesh

On Fri, May 14, 2010 at 12:56 AM, Jan Engelhardt <jengelh@medozas.de> w=
rote:
> On Thursday 2010-05-13 19:24, ratheesh k wrote:
>
>>On Thu, May 13, 2010 at 10:46 PM, Jan Engelhardt <jengelh@medozas.de>=
 wrote:
>>> Your hook received packets from all interfaces, including lo and
>>> ethhdr-less tunnels.
>>
>>Packets from lo will hit NF_IP_LOCAL_OUT hook =A0?
>
> Clearly.
>
>>Could you please =A0tell =A0example for ether less packet =A0?
>
> As I said, all links that do not are of "ether" type (see `ip list`)
>
