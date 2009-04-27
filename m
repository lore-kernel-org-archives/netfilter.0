From: Bruno Moreira Guedes <thbmatrix@gmail.com>
Subject: Re: Dynamic IP address in a rule?
Date: Mon, 27 Apr 2009 10:23:14 -0300
Message-ID: <3fdd6ce00904270623u747ed6e4r90c849f7f772c0c8@mail.gmail.com>
References: <3e67fcb10904250512s67c79f70ref8af8655d33c8da@mail.gmail.com>
	 <3678.87.196.49.84.1240774988.squirrel@webmail.decimal.pt>
	 <000001c9c703$2d3cabf0$87b603d0$@info>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=zfhCLwVOJJaVwAXhH1Oirn4DSgldYSEF2QvA3JrlTFU=;
        b=wNxfhdUYUCsvfo5XRp3ULaSvXPWf34WyBSJ7QDl138iUmYRrXPHaPcXglo4/xn0s0B
         HRvzijyqnowhwQn4M/NdizHXy4gmOmizKnfg6oB31Y+KNLIyl7vZh0R97xMAdJ5Bv3kC
         o8OlQvNcf57+3u+oEDwYLULbcJe7c5D6/DDKI=
In-Reply-To: <000001c9c703$2d3cabf0$87b603d0$@info>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Netfilter <netfilter@vger.kernel.org>

2009/4/27  <lists@sterenborg.info>:
>> That's a nice question, instead of the dynamic IP on the rule,
>> having a dynamic host on it like:
>>
>> Iptables -I INPUT -I eth0 -d myhost.dyndns.org -p tcp --dport 80 -j
>> ACCEPT
>>
>> When this run's, the rule will stay with the IP address that was
>> grabbed from the dynamic host, and when the IP changes, the rule
>> won't work anymore.
>> My question is, there's no way to make iptables to check always the
>> host instead of translation the host do IP on the rule apply stage?
>
> If iptables would have to perform a DNS lookup everytime a packet
> passes, I think it would be terribly slow and probably not usable for
> packetfiltering.
>
>
> Grts,
> Rob
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

Would you imagine what's the netfilter's behaviour if you add a rule li=
ke:
iptables -A OUTPUT -p udp --dport 53 -s myhost.mydomain.ext -j ACCEPT

I really don't know even if kernel is able to resolve a DNS, because
in the most common cases libc does it for us. So, the DNS resolution
is done by the iptables user-space tool, at the moment you add the
rule, and it sends the resolved IP(s) to the kernel.

This is because iptables won't perform a DNS lookup everytime a packet =
passes.
