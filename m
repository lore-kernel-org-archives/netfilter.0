From: GMail Isaac Gonzalez <isaak.gonzalez@gmail.com>
Subject: Re: POSTROUTING SNAT only reply packets
Date: Mon, 17 Jan 2011 12:07:43 +0100
Message-ID: <4D3422FF.8090803@gmail.com>
References: <4D341710.60509@gmail.com> <4D341C26.2010207@freemail.hu> <4D34200F.5050307@coochey.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=KXZPSq2qz0Wrr5osDNonY41Mg86V++jWPIXyxeK1WpA=;
        b=H5qbp/cEH+E8F9zV/cdeReqUqRd3rkTO95hhZBtaU02oxgqm1aWEc9Njv9LysQSRXf
         koTvRBKmHP8qMAtNF9PlDvb+qkZdA8se2+uUQINOQq50LMRdK68AfeQke2pF7QA6r35V
         A3QYKBZrrmBH85Pdujuh57y7zqJeyZ1pn5BcQ=
In-Reply-To: <4D34200F.5050307@coochey.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Giles Coochey <giles@coochey.net>
Cc: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>, netfilter list <netfilter@vger.kernel.org>

Ok,

Thanks for the replies, I was doing some tests to asure the connection=20
issues. It's compulsory that the load balancer receive the return packe=
ts.


El 17/01/11 11:55, Giles Coochey escribi=F3:
> On 17/01/2011 11:38, G=E1sp=E1r Lajos wrote:
>> Hi,
>>
>> 2011-01-17 11:16 keltez=E9ssel, GMail Isaac Gonzalez =EDrta:
>>> Hi,
>>>
>>
>>> I've doing some testing and seems that iptables only do SNAT on NEW=
=20
>>> connections, and I need to change the ip address of replied packets=
=2E=20
>>> Anybody know some workaround? If anobody do not know some workaroun=
d=20
>>> can you confirm that it's not posible to do this with iptables?
>>
>> read again the NAT part in the manual:
>> man iptables
>>
>> nat table:
>>               nat:
>>                   This table is consulted when a packet that creates=
=20
>> a new connection is encountered.  It consists of three built-ins:=20
>> PREROUTING (for altering packets as soon as they come in), OUTPUT=20
>> (for  altering  locally-gener-
>>                   ated packets before routing), and POSTROUTING (for=
=20
>> altering packets as they are about to go out).
>>
>> DNAT target:
>>
>>    DNAT
>>        This  target  is  only valid in the nat table, in the=20
>> PREROUTING and OUTPUT chains, and user-defined chains which are only=
=20
>> called from those chains.  It specifies that the destination address=
=20
>> of the packet should be modified
>>        (and all future packets in this connection will also be=20
>> mangled), and rules should cease being examined.  It takes one type=20
>> of option:
>>
>> SNAT target:
>>
>>    SNAT
>>        This target is only valid in the nat table, in the POSTROUTIN=
G=20
>> chain.  It specifies that the source address of the packet should be=
=20
>> modified (and all future packets in this connection will also be=20
>> mangled), and rules  should
>>        cease being examined.  It takes one type of option:
>>
>>
>>> I've tried the next ip tables rules and only work when I do NEW=20
>>> connections from the web server.
>>>
>>> -A POSTROUTING -o br0 -s WE_SERVER_ADDR -p tcp -m tcp --sport 80=20
>>> --dport 1024:65535 -j SNAT --to-source LOAD_BALANCER_ADDR
>>>
>>> Thanks in advance.
>>>
>>> Isaac Gonz=E1lez
>>>
>>
>> You should do all of the NAT-ing ON THE LOAD BALANCER:
>>
>
> I have to agree - if you are doing NAT you want to avoid any type of=20
> asymmetric routing - especially you NEED to make sure that the device=
=20
> that is doing the NAT (be it for load balancing or other reasons)=20
> receives the return packets. You cannot keep a TCP connection going i=
f=20
> there is not some sort of state information being shared between the=20
> devices otherwise.
>

