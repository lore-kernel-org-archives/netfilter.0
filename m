From: Peter Phaal <peter.phaal@gmail.com>
Subject: Re: netflow
Date: Thu, 14 Jul 2011 08:17:26 -0700
Message-ID: <CAB8g2zxfsfL5_n0yi3OYSHG3tUHnmwPmX7X3ZfobQrZnc+HjQg@mail.gmail.com>
References: <CAMTjHrwextXkBdz_g3zS6CB6j+Xmr4nfvLs3==q5eRzMLYvBOw@mail.gmail.com>
	<alpine.LNX.2.01.1107141703350.6827@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=0AJGh6n+uvnc2lvhGQDoN9HOUokKMeH0d0XM1gR3+Ww=;
        b=XxIdiJar4fGGGjiI+xGF4foUUiV+XW+2ZipEHnJs87nJTPTsrKCzmX2R+3SyLgGLOV
         muvwBduC9ulFWktcJ3DfKwY5qlkmobbWt7/GVbFIIK2SCpa4QEak8SPrYXcrxK0TODaS
         O0AQxTjIM0PNiLwz1hUw40EHQz9FQ93YrQS5Y=
In-Reply-To: <alpine.LNX.2.01.1107141703350.6827@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: =?ISO-8859-1?Q?Usu=E1rio_do_Sistema?= <maiconlp@ig.com.br>, Mail List - Netfilter <netfilter@vger.kernel.org>

Another option is to use netfilter's packet sampling/ULOG facilities
to monitor network traffic.

You can export the traffic as sFlow:
http://host-sflow.sourceforge.net/

or NetFlow:
http://www.pmacct.net/

2011/7/14 Jan Engelhardt <jengelh@medozas.de>:
> On Thursday 2011-07-14 16:19, Usu=E1rio do Sistema wrote:
>
>>Hello,
>>
>>I'm researching about netflow on linux. I wish that an linux machine
>>forwards it flows to a colletor netflow inside my network.
>>
>>my doubt is how to generate this netflow on linux. I've added the
>>ipt_netflow-1.6.tgz module and I created some rules as bellow in
>>iptables:
>>
>>iptables -A OUTPUT -j NETFLOW
>>iptables -A OUTPUT -j NETFLOW
>>
>>I'm forwarding the flows to my netflow collector with modprobe
>>ipt_NETFLOW destination=3D10.10.10.1:2055
>>
>>so...my question is there is other different way to generate netflows
>>on linux machine than add rules in the iptables and add ipt_netflow
>>module ??
>
> You could use -j TEE to send the original packets to a dedicated logg=
ing
> host, and then do netflow (or any other logtype) analysis there.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
