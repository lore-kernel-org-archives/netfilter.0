From: Vijay Viswanathan <vijay.vishy@gmail.com>
Subject: Re: NAT and listen on random ports
Date: Fri, 19 Dec 2014 15:42:16 -0800
Message-ID: <CALPbv1-=kdO+9J3EVgi_oGj0EmwY57WojwX0ZK2-EtQrcaix4A@mail.gmail.com>
References: <CALPbv1-PYS25HSkMvCD_otVVd0iPpN9jBL+D2dh6GQCRJDeObA@mail.gmail.com>
	<549497C1.2000103@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=Am5tRY85Nvf5axliz6UYO69EJRRObQaU6flWNkAM0hE=;
        b=GvkWnUtEsP73TIQWDE4Ens757Ajb8Te0bgZDb5T/5w0PBf+JqEHxwX+UpzEomziLos
         Sj/aQrKycObd3FjS5mkTzj8ISb+zlofZw3wM421SgWg7HBOzXMzzBYN8qnEyl++GVxur
         od/Ko9iX6XX9j3/N9I2sRaCOmChOqpOfGp1hvXi2w4RuUOO+Rd5/BWqm5aGNpKKLLar9
         c7s3hocx5UEhoMO7g+nGKjl7J0i8AzBixaeuyciVi43vitgFavwAMIbLmZPQ28+J5OXa
         M9Qz+9vEG377i2cB+P32ByNI6DpR6LtkjIgXhkRpcHx8Dkqt+RIW92B1o3LktHdS9tX2
         4CTg==
In-Reply-To: <549497C1.2000103@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Thanks,
1) what about non-connection oriented ?
2) broadcast/multicast ( Upnp searches that need to go one extra hop
if dlna is run on veth ? )

Are there any special techniques/convention that developers use ?

Thx.


On Fri, Dec 19, 2014 at 1:25 PM, Pascal Hambourg <pascal@plouf.fr.eu.or=
g> wrote:
> Hello,
>
> Vijay Viswanathan a =C3=A9crit :
>> With MASQUERADE & DNAT
>> Iam able to run servers on veth and be able to access network.
> (...)
>> Lot of protocols go out on random ports and listen on the same sourc=
e port .
>> How do I achieve network access for protocols that goes out on rando=
m
>> ports and listen on random ports ?
>
> If the protocol is connection-oriented, i.e. packets in opposite
> directions have swapped source/destination ports and addresses, then
> conntrack handles the flow as a connection, so all you need is
> MASQUERADE or SNAT.
