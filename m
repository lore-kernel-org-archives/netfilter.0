From: Pete Kay <petedao@gmail.com>
Subject: Re: Problem with NAT rule
Date: Sat, 24 Jul 2010 22:09:46 +0800
Message-ID: <AANLkTimObW0P6o+Ei8=PXVuHfU07KBqMFcMWNepvpEVW@mail.gmail.com>
References: <AANLkTi=SSSJJJVO7J6PSW52F=yRxr+9mqvhSObX8qLdr@mail.gmail.com>
	<alpine.LSU.2.01.1007241551150.515@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=pF4D+xmMJSCuiaGkstBbNIDHwu0wb6m4fd2OIHA9DNg=;
        b=d8gDH8IW357CqwF1H85YWHEdsW1zrYJm34mWRi/fZLOQnxv8/g7qO4KTVu/lc31Gkx
         EAPE/tU+iUFp1AfPYE/jeS4YxnhaLMwXJNnwIoSGukz7DGJSqRqxCkPZBsFo0z0evU7w
         6ZqmrgtPkRKSQ9NK6IN77L7zDmgZBDg2WJiKs=
In-Reply-To: <alpine.LSU.2.01.1007241551150.515@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

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
>>192.168.1.100:16385 =A0<---------> 192.168.1.114:29848 :: 192.168.1.2=
00
>>:29850 =A0<----------> 192.168.1.300:10112
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
