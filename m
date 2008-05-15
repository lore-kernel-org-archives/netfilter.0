From: "=?ISO-8859-1?Q?J=FCrgen_Rochol?=" <juergen.rox@gmail.com>
Subject: Re: Netfiler REAL Rule Match Sequence
Date: Thu, 15 May 2008 10:10:45 -0300
Message-ID: <774cb3b60805150610h6aad9517l86eb7079e75cfaf4@mail.gmail.com>
References: <774cb3b60805141321l6b8ce420ia10b6e027c80dd74@mail.gmail.com>
	 <alpine.LNX.1.10.0805142328140.5292@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=i4QVVLhlfB+wHKy2Ke17F7eAfH6WFPGk3eAjwmY4rM0=;
        b=mNYUTm2x9HPcz/S5lUAZCfr2aH65dEmvthg5Nz+z7YjQt6oNiuMI1DauQ4JKJbWSJnVPjZ6CwMVTLfXO41A/S+MR8Fp0F0FR3LVo14Svim5i4bjSlh12OM3AxblCchcIkI8+n9LA+q6/V7WwQ+VM8T5vMF+EmJpRR0kFBP5RKkQ=
In-Reply-To: <alpine.LNX.1.10.0805142328140.5292@fbirervta.pbzchgretzou.qr>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Hi Jan.

Thanks for your answer.

But I think  I wasn't  that clear.

I did a simple test and I found that both rules below matched.

Consider this simple scenario:

Antes de tudo: arquivo before.pcap

depois dropa toda sa=EDda :(
iptables -P OUTPUT DROP

Libera ICMP de sa=EDda accept.pcap:
iptables -A OUTPUT -t filter  -p icmp  -j ACCEPT

Mangle na POSTROUTING (mudar TTL) ttl.pcap:
iptables -t mangle -A POSTROUTING -p icmp -j TTL --ttl-dec 10 iptables
-t mangle -A POSTROUTING -p icmp -j TTL --ttl-dec 10

Scenario 2:
The same happens when:
//n=E3o funcionou
iptables -t mangle -A PREROUTING -p icmp -j TTL --ttl-dec 10

//agora outra regra - alterou s=F3 no postrouting :(
iptables -t mangle -A PREROUTING -p icmp  -j TOS --set-tos 0x10

//dropa tudo, de cara.
iptables -A INPUT -t filter  -p icmp  -j DROP






On Wed, May 14, 2008 at 6:29 PM, Jan Engelhardt <jengelh@medozas.de> wr=
ote:
>
> On Wednesday 2008-05-14 22:21, J=FCrgen Rochol wrote:
>>
>>Putting in a simple way, is the packet evaluated under a unique singl=
e
>>rule list or several rules lists -- one for each chain?
>
> Sieve principle. What has not matched falls through
> until it finally matches (and takes a terminating action).
> Much like, uh, filters.
>
