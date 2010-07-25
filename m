From: Pete Kay <petedao@gmail.com>
Subject: Re: Problem with NAT rule
Date: Sun, 25 Jul 2010 16:38:10 +0800
Message-ID: <AANLkTik5=bN2b-nuBWFY+38G6VZAjpjpcVU1noE-0h1t@mail.gmail.com>
References: <AANLkTi=SSSJJJVO7J6PSW52F=yRxr+9mqvhSObX8qLdr@mail.gmail.com>
	<AANLkTikGQe8B84fnL65qb32tkRrV6bTfye-fjGtsxQ9=@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=Px6KxoZP6x9ENLmYHcs3lX/N7YcwmXM3FybeYfJYAyA=;
        b=EIPWvSH/F1VCbI08zawCFG2c5+cItVffxuKY3EU9cfiYBTeSoVBGfQRV3DCbJ1PtD0
         bff57v8WNDquHhbM/e90HmJC7FD0djurL1bz8n0cNWMHGY72oQCabhD9JQgZKFOx9+WZ
         mZI+ZLyX9mNRoYsT5eGqi8nswsu+e/RqVPhuo=
In-Reply-To: <AANLkTikGQe8B84fnL65qb32tkRrV6bTfye-fjGtsxQ9=@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pieter Smit <mlist2010@vigor.co.za>
Cc: netfilter@vger.kernel.org

On Sun, Jul 25, 2010 at 12:13 AM, Pieter Smit <mlist2010@vigor.co.za> w=
rote:
> A couple of questions.
>
> 1. You have 3 devices, with the =A0FW with two interfaces 192.168.1.1=
14
> and 192.168.1.200 in each subnet ?
>

Hi, The FW device only has one interface and it should all be
192.168.1.200.  It was a typo.  The redirector should only have one
interface with ip 192.168.1.200.

> 2. The two outside hosts will connect to udp ports on the FW device
> that will be translated to the other device ?

yes

>
> 3. Is the udp streams in one direction ? =A0Does it matter to the udp
> receiver where the packet comes from or will it always send return
> traffic to the FW ip ?
>

Yes, the udp is for both direction.  The FW ip ( 192.168.1.200) should
just redirect packets from one to another and vice versa.


> Cheers,
> Pieter
>
> On Sat, Jul 24, 2010 at 3:41 PM, Pete Kay <petedao@gmail.com> wrote:
>> Hi,
>>
>> I would like to setup my iptable rules to forward udp packet from on=
e
>> device to another:
>>
>> 192.168.1.100:16385 =A0<---------> 192.168.1.114:29848 :: 192.168.1.=
200
>> :29850 =A0<----------> 192.168.1.300:10112
>>
>> What I want to do is forward all packets from 192.168.1.100:16385 to
>> 192.168.1.300:10112 and all packets from 192.168.1.300:10112 to
>> 192.168.1.100:16385
>>
>
