From: "=?ISO-8859-1?Q?J=FCrgen_Rochol?=" <juergen.rox@gmail.com>
Subject: Re: Netfiler REAL Rule Match Sequence
Date: Thu, 15 May 2008 10:11:14 -0300
Message-ID: <774cb3b60805150611w292f88d1le77aece2ade7e934@mail.gmail.com>
References: <774cb3b60805141321l6b8ce420ia10b6e027c80dd74@mail.gmail.com>
	 <alpine.LNX.1.10.0805142328140.5292@fbirervta.pbzchgretzou.qr>
	 <774cb3b60805150610h6aad9517l86eb7079e75cfaf4@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=iQp7q+fkWHfOP7auEh8WUCa8YwBGSkK2m/IuzLlzOcw=;
        b=g+CaGnYyNBeD1cuubazAV4JIZnkDQuPIKLM/vL1uroG1hVrSZ2k9SMiPTdoAXrx440+1xHMDKXHIC3g/2QrPEHx2QPZA20ETQEhFcAwKk41LROMqdEKDnnmDV2mva2GxIFGd1JR257Qv7ElrArSfqtDTK7t7FW9+rd7T4Uk/8Zw=
In-Reply-To: <774cb3b60805150610h6aad9517l86eb7079e75cfaf4@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

sorry, I wasn't suppose to be sent yet.

On Thu, May 15, 2008 at 10:10 AM, J=FCrgen Rochol <juergen.rox@gmail.co=
m> wrote:
> Hi Jan.
>
> Thanks for your answer.
>
> But I think  I wasn't  that clear.
>
> I did a simple test and I found that both rules below matched.
>
> Consider this simple scenario:
>
> Antes de tudo: arquivo before.pcap
>
> depois dropa toda sa=EDda :(
> iptables -P OUTPUT DROP
>
> Libera ICMP de sa=EDda accept.pcap:
> iptables -A OUTPUT -t filter  -p icmp  -j ACCEPT
>
> Mangle na POSTROUTING (mudar TTL) ttl.pcap:
> iptables -t mangle -A POSTROUTING -p icmp -j TTL --ttl-dec 10 iptable=
s
> -t mangle -A POSTROUTING -p icmp -j TTL --ttl-dec 10
>
> Scenario 2:
> The same happens when:
> //n=E3o funcionou
> iptables -t mangle -A PREROUTING -p icmp -j TTL --ttl-dec 10
>
> //agora outra regra - alterou s=F3 no postrouting :(
> iptables -t mangle -A PREROUTING -p icmp  -j TOS --set-tos 0x10
>
> //dropa tudo, de cara.
> iptables -A INPUT -t filter  -p icmp  -j DROP
>
>
>
>
>
>
> On Wed, May 14, 2008 at 6:29 PM, Jan Engelhardt <jengelh@medozas.de> =
wrote:
>>
>> On Wednesday 2008-05-14 22:21, J=FCrgen Rochol wrote:
>>>
>>>Putting in a simple way, is the packet evaluated under a unique sing=
le
>>>rule list or several rules lists -- one for each chain?
>>
>> Sieve principle. What has not matched falls through
>> until it finally matches (and takes a terminating action).
>> Much like, uh, filters.
>>
>
