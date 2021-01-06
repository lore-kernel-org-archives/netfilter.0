From: pauloric@contatogs.com.br
Subject: Re: Matching streaming services
Date: Wed, 6 Jan 2021 17:24:25 -0200 (BRST)
Message-ID: <170611234.121.1609961065787.JavaMail.zimbra@contatogs.com.br>
References: <34e8a6b25cd0886dc6f5d8757e64d1846b29d7cd.camel@lusan.id.au> <43dc8a26-faa8-a0b7-bd2d-065e2e29aa96@hajes.org> <7ea6241b-57f6-2204-a6a0-c245f1fe7521@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 mercurio.contatogs.com.br EDB4841C6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=contatogs.com.br;
        s=547D7A06-2322-11E9-835A-A37390E63B7D; t=1609961069;
        bh=0lW4NjaRQ48i7A9N/66uqo461ZOG3oSCRpaiUPh5cMI=;
        h=Date:From:To:Message-ID:MIME-Version;
        b=nLl9PTEPnRxjEvN8UL2fRNRqB6hQIcEuIWq/fXzlZuTFmn9m04zjM98C18iIjnKHX
         OuUpFMWMPhrYp7DDPTg7usH7DZLRlJCQ5x1dp7b1bFnGcr9gwUAVUoXctQNqPMxiVI
         tLf7ZlQhfhO8jWE9M636M1/tefuFchs/N8ogOsIptUeMr6mZLhxdx4YiZRMVwzM1RZ
         04Fq2k2tOr/pb0XlpDPJqB8BBN8Yfm43wtHoAQNnEYNegTYPz2pURoL8zHJ+yXAbGv
         jokWTGXW7YxH+OeBp9mFcTmrUGfVgZjp41s9UgCZEYjn/14ltRt5WnIuRoElKpcOix
         h6/ABxzIJPHVA==
In-Reply-To: <7ea6241b-57f6-2204-a6a0-c245f1fe7521@thelounge.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>



----- Mensagem original -----
De: "Reindl Harald" <h.reindl@thelounge.net>
Para: david@hajes.org, "netfilter" <netfilter@vger.kernel.org>
Enviadas: Quarta-feira, 6 de janeiro de 2021 16:15:18
Assunto: Re: Matching streaming services

Am 06.01.21 um 19:44 schrieb david@hajes.org:
> On Mikrotik routers there is possibility of burst rate setting that 
> determines whether it is simple web surfing or continuos data stream.

and how do you imagine distinct between a large download which can 
finished one hour later and nobody cares or streaming?

and whenever you manage it - it's something that need to be fixed and 
changed ASAP sou will have a moving target

> I think it is possible also in iptables and may be also in 
> nftables...unsure, whether you need some additional modules or not.
> 
> 
> On 06/01/2021 19:05, Nikolai Lusan wrote:
>> Hi,
>>
>> I have been looking for a way to differentiate traffic from streaming
>> services (Netflix, Amazon Prime, <insert_locally_available_service>)
>> from other https traffic, with not much luck. The goal is to add rules
>> to nftables and tc to ensure quality while allowing the rest of the
>> link to function normally.
>>
>> I tried using tcpdump to see if there was something in the packets that
>> I could use, but they look like any other bit of https traffic.
>>
>> Does anyone have a method for determining which http/https traffic is
>> streaming video, and which is not?


Humm well as https is a application you could use squid + bump + delay pools (MITM), but it is out of nftables...


