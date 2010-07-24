From: ZHOU Xiaobo <xb.zhou@qq.com>
Subject: Re: Problem with NAT rule
Date: Sun, 25 Jul 2010 00:29:35 +0800 (CST)
Message-ID: <31824524.281279988971776.JavaMail.ZHOU-PC$@zhou-PC>
References: <AANLkTimObW0P6o+Ei8=PXVuHfU07KBqMFcMWNepvpEVW@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s0907;
	t=1279988994; bh=y5dmB92Kn3De/amGBz4NCBDCIc8EEaYSUk0XHyK331A=;
	h=X-QQ-mid:Received:Date:From:To:Message-ID:In-Reply-To:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=C1zxIs5JdSGFjyaV6wcIbLVmLyvDHS9p5qu2JCiCsl4XiCiRIgoA5Fx5G8GsUX6iU
	 N8adYRBy7Y6dtyQTt5foyWmeiLwAoukyoOCBnYR3cG3w/SLYPbuLq8Oj/sFWljA
In-Reply-To: <AANLkTimObW0P6o+Ei8=PXVuHfU07KBqMFcMWNepvpEVW@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

I think you should use IPROUTE2 instead of IPTABLES.


----- Original Message -----
=46rom: "Pete Kay" <petedao@gmail.com>
To: "Jan Engelhardt" <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org
Sent: 2010=E5=B9=B4 7 =E6=9C=88 24=E6=97=A5, =E6=98=9F=E6=9C=9F=E5=85=AD=
 =E4=B8=8B=E5=8D=88 10:09:46 GMT +08:00 Beijing / Chongqing / Hong Kong=
 / Urumqi
Subject: Re: Problem with NAT rule

Hi Jan,

Sorry I am new to iptables setup.  Could you give me some insight as
to how I can configure iptables to achieve the packet forwarding
function?

thanks,
P

On Sat, Jul 24, 2010 at 9:51 PM, Jan Engelhardt <jengelh@medozas.de> wr=
ote:
> On Saturday 2010-07-24 15:41, Pete Kay wrote:
>
>>Hi,
>>
>>I would like to setup my iptable rules to forward udp packet from one
>>device to another:
>>
>>192.168.1.100:16385 =C2=A0<---------> 192.168.1.114:29848 :: 192.168.=
1.200
>>:29850 =C2=A0<----------> 192.168.1.300:10112
>>
>>What I want to do is forward all packets from 192.168.1.100:16385 to
>>192.168.1.300:10112 and all packets from 192.168.1.300:10112 to
>>192.168.1.100:16385
>>
>>Here is my iptables rule:
>
>
> Routing does forwarding; nf_nat does NAT, those are two separate thin=
gs.
>
>
--
To unsubscribe from this list: send the line "unsubscribe netfilter" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html


