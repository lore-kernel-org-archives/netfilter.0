From: ratheesh k <ratheesh.ksz@gmail.com>
Subject: Re: AH and ESP nat-ing
Date: Thu, 6 May 2010 23:23:38 +0530
Message-ID: <AANLkTikOADMAV5UaejxhljIXZHH2ku4rsA0LUseDlDxB@mail.gmail.com>
References: <AANLkTikuASq3YbwsJNj8KWrwd7avNYwL9aYYhtjoF-ip@mail.gmail.com>
	 <alpine.LSU.2.01.1005061706150.32238@obet.zrqbmnf.qr>
	 <AANLkTilqPXXeMhbUgoicPIUlrNH6BnbYBfNL7WhyHuGH@mail.gmail.com>
	 <alpine.LSU.2.01.1005061902191.6755@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:in-reply-to
         :references:date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=Ows+ml1CaU8yKNXbGsjNgigV2hWqMuzsvoqhHkn20gE=;
        b=hIwTf9/Raz9R12pXG+yLBnAEmUf65YpkwyXlUvmuGUoFqphWZFI7mkHhJZjHxMZSSO
         fY7wxZXvBDKaTDOzey7zOOphe2ZoomafFdRHiREjnVl0z/Euh1OIJfpX5qqE5uUnbRzw
         OCDhTQSeqyFdsZyQq9slca3VqhI4pkM4vvwEs=
In-Reply-To: <alpine.LSU.2.01.1005061902191.6755@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Netfilter mailing list <netfilter@vger.kernel.org>

>>On Thu, May 6, 2010 at 8:36 PM, Jan Engelhardt <jengelh@medozas.de> w=
rote:
> PPTP and ESP can be udptunneled, see google et al.
>

coool  .Thanks a ton

 Below webpage explained it in detail . Thanks again.
http://publib.boulder.ibm.com/infocenter/iseries/v5r4/index.jsp?topic=3D=
/rzaja/rzajaudpencap.htm

-Ratheesh






On Thu, May 6, 2010 at 10:32 PM, Jan Engelhardt <jengelh@medozas.de> wr=
ote:
> On Thursday 2010-05-06 18:55, ratheesh k wrote:

>>> On Thursday 2010-05-06 16:08, ratheesh k wrote:
>>>
>>>>I googled and found that =A0AH protocol pkt cannot be NATed =A0, An=
d ESP
>>>>protocol pkt =A0NATing wont work in =A0some use cases .
>>>>
>>>>Is this problem is solved in newer kernels ?
>>>
>>> This is not a kernel problem.
>>>
>>>>Is there any ALG for nating this packets =A0?
>>>
>>> No, it's cryptographically signed, so any modification would be vis=
ible.
>>>
>>
>>
>>I am able to establish pptp/ipsec connection =A0from my client machin=
e
>>,connected to a =A0Router (broadcom ) . it doesnt have any =A0debug
>>terminal .
>>Could you tell me , how this is possible =A0?
>
> PPTP and ESP can be udptunneled, see google et al.
>
