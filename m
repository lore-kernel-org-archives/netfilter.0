From: Andrew Beverley <andy@andybev.com>
Subject: Re: Proxy Filter iptable Settings
Date: Sat, 30 Apr 2011 19:02:57 +0100
Message-ID: <20110430190257.572819zc1kr5bkr5@www.simplelists.com>
References: <BANLkTin=W-MWbPfrpqnmWDCMq9fGp5CvwQ@mail.gmail.com>
 <1303885014.18916.10.camel@andybev-desktop>
 <BANLkTikUnSoefT3Xy=O+43zWGEw3tgb7wQ@mail.gmail.com>
 <4DB80945.8040304@atc.tcs.com>
 <BANLkTiky5xV9yhr-1nq7cLOSmV1nGt=cKg@mail.gmail.com>
 <4DB817A5.3020604@atc.tcs.com>
 <BANLkTi=y37mzCOenHg8EbR_u9PpoTVceGA@mail.gmail.com>
 <4DB90AE6.9070909@atc.tcs.com>
 <BANLkTikM3czG=D7yq3UHhQdt-pUcjpbKSA@mail.gmail.com>
 <1304150575.1579.15.camel@andybev> <20110430165041.GN2976@cardinal>
 <BANLkTincTDu1QiYeiYzVV7+1VUqyv-Q6aQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=andybev.com;
	s=selector1; t=1304186577; bh=OTbwOqEzERQNjNVaEJ4gi67wz220Rq520Wxw2
	BHmL4U=; h=Message-ID:Date:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=Nw5q6R3EVE8g1fty/641P7ynQbGKa9RO1m0FnBpEjuVs3hnn39ks7qN+lQ4E4mUCg
	K1qDAARREY2k/IHDJ5NWIF7vn13IPByfbNn1HxTmQdWRN9Ak3NnU1HqMorCqpoZ1JU3
	9IOIBglxtnMkV/yFGbjIKGDjVaMbPe6DxsXoyds=
In-Reply-To: <BANLkTincTDu1QiYeiYzVV7+1VUqyv-Q6aQ@mail.gmail.com>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: Mike Hendrie <mike@hendrienet.com>
Cc: netfilter@vger.kernel.org

Quoting Mike Hendrie <mike@hendrienet.com>:
>>> # Setup NAT:
>>> iptables -t nat -A POSTROUTING -o $ext_IF -j MASQUERADE
>>>
> Trying to apply:
> iptables -t nat -A POSTROUTING -o $ext_IF -j MASQUERADE
>
> I get the following error -
> Bad argument `MASQUERADE'

Have you replaced $ext_IF with your external interface?

As an aside, can you please stop top posting? Thanks.

Andy

