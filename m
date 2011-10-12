From: Nikolay Kichukov <hijacker@oldum.net>
Subject: Re: filter before NAT
Date: Wed, 12 Oct 2011 10:01:42 +0300
Message-ID: <4E953B56.4050601@oldum.net>
References: <20111011112453.49d1a3f1@pulsar.inexo.com.br>	<1318361872.26402.2504.camel@andybev-desktop> <20111011165255.011c284a@pulsar.inexo.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=oldum.net; s=mail;
	t=1318402903; bh=VKAVNbkqzOiKeOzFFYrfzL8TxH8CbjpCN+tniylhXm8=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=DTvlF0vAfVoLKzToRfI+OzB8oHPJWyrFE5JQwGb+AsekoC/gCS9W8b1MJh5rdVvxV
	 RKRcI+IHfWjEPLpOS360tRV994G87U5mXIr0mFmLSijeYj9Q7O82Nvb1W4UKDIOrBd
	 OJpSJH1rXqGFABJzyvz2Oo3dR3EdRR/IiH4RiMqs=
In-Reply-To: <20111011165255.011c284a@pulsar.inexo.com.br>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Ethy H. Brito" <ethy.brito@inexo.com.br>
Cc: Andrew Beverley <andy@andybev.com>, netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

Perhaps use the ingress handle for the internal(where the clients are) interface and police the rates?

If that is eth0 then:


#tc qdisc add dev eth0 ingress handle ffff:
#TC_FILTER="tc filter add dev eth0 parent ffff: protocol ip"
#if they are using ssh(or any other preferred service) to the server, then raise the limit
#$TC_FILTER prio 20 u32 match ip dport 22 0xffff police rate 75mbit burst 1024kb pass flowid ffff:
#here comes the policing ...
#$TC_FILTER prio 20 u32 match ip src 192.168.0.6/32 police rate 128kbit burst 32kb drop flowid ffff:
#$TC_FILTER prio 20 u32 match ip src 192.168.0.4/32 police rate 128kbit burst 32kb drop flowid ffff:
#$TC_FILTER prio 20 u32 match ip src 192.168.0.2/32 police rate 128kbit burst 32kb drop flowid ffff:
#$TC_FILTER prio 20 u32 match ip src 192.168.0.5/32 police rate 128kbit burst 32kb drop flowid ffff:


I remember doing that way ago for a small internal network. It worked like a charm back then. I do not know what
complications this might raise on a greater scale.

Cheers,
- -Nik

On 10/11/2011 10:52 PM, Ethy H. Brito wrote:
> On Tue, 11 Oct 2011 20:37:52 +0100
> Andrew Beverley <andy@andybev.com> wrote:
> 
>>>
>>> The problem is that the packets are hooked *after* passing SNAT and
>>> all the rules can see is the outbound IP. So no redirects to the
>>> corresponding flowid occur.
>>>
>>> Is it possible to make the filter rule above "see" the packets before
>>> they get NATed?
>>>
>>
>> How about marking them using an iptables rule before SNAT? The mangle
>> table of POSTROUTING sits before the nat table.
> 
> I've already thought about that. The problem is the internal NAT side has
> a few thousand clients. To generate an unique mask for those and matching
> them later is pretty much a headache. I think.
> 
> I also thought in IPMARK but I had to patch the kernel AND iptables and
> that is something I am not willing to do since it is a production box.
> 
> If nobody came with a better solution I'll have to face the "mark" way. 
> 
> Thanx anyway.
> 
> Cheers
> 
> Ethy
> 
> 
>>
>> Andy
>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJOlTtWAAoJEDFLYVOGGjgXSpMH/0mpFlxCKtR/aEMklrv+7igW
Krw/IP2yqwYAgK/5iZSIaj9AZy7cvTOxQm4Rw5fZSgXFDupVW3Yz2msCvlXZj5AN
8rm8EobDd3oAfkuBnKGfm7/pJLzd8Bz/TuHxBr1GScfqPmZPfJz+b4WK8U8KsWHT
/efv1y8xMyoxCJCddUHFJCLd6oxL2XTXDhESo3xpIk0EFhwWAHqS25HKE0ohH1hU
XMHgNCjW/brSAnnr1NMkad39sVZbxgfBI2s38Dac09fkz+OQG02KbReSzqtlvbYo
RqYUCNM0SnDZ9Kp35fUtM1Jkrxu4AqfwwhqqHeNAiXfEKTG6MsDNWjlq4ZDM4BA=
=OkJQ
-----END PGP SIGNATURE-----
