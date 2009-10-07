From: Oskar Berggren <oskar.berggren@gmail.com>
Subject: Re: Multiple interfaces with the same IP address
Date: Wed, 7 Oct 2009 23:21:57 +0200
Message-ID: <33be4bb30910071421s3410e8e4jdadedbc216de958a@mail.gmail.com>
References: <4ACCEDDA.9020508@spacex.net> <4ACCF3F0.5040703@hp.com>
	 <4ACCFF8F.1010000@spacex.net> <4ACD04EA.5040303@hp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=6nXu/3Ino7sHrVegLwXL+5JN8n1UnaYqQpLh12+b6vQ=;
        b=BrBrOCbVSnHms3TjX9xRuSIW5UQfRfpwbms0a/nLOwEGd4GJauXsdh/7ncbEU4WHqF
         82NRlWxp/b8yf8zxqURtt91UyDBIWbLSSTqz4jVKueoIup+6vC4jkySgUPJEXPsy0u7T
         eYWPC6RJqm6GlnNNr7XDBZQzffNjrR7EmqknE=
In-Reply-To: <4ACD04EA.5040303@hp.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

2009/10/7 Rick Jones <rick.jones2@hp.com>:
> Greg Wilson-Lindberg wrote:
>>
>> Rick Jones wrote:
>> ...
>>

>
> I have not fully parsed the manpage for the ip command, but it does h=
ave
> tidbits which suggest being able to specify interfaces by name when
> manipulating routing tables. =A0If that is correct you should be able=
 to add
> specific host routes pointing-out specific interface names if you are=
 indeed
> forced to put assign the same IP address to each of the HCLC interfac=
es on
> the "gateway."
>

Yes,

  ip route add x.x.x.x/x dev eth1

or similar works fine.

If you like, you can also use ip addr add x.x.x.x/32 dev eth1 to set
an ip-address without having the kernel automatically install a subnet
route. Then manage the routing tables complete by yourself.

/Oskar
