From: Martin Zaharinov <micron10@gmail.com>
Subject: Re: bug report and future request
Date: Tue, 22 Mar 2022 09:14:18 +0200
Message-ID: <4B0C8933-C7D8-49BA-B7F2-29625B0865C1@gmail.com>
References: <AE6DAC96-EC3E-43C9-A95A-B230842DD7B1@gmail.com>
 <20220321212750.GB24574@breakpoint.cc>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=JJWCnTlxZp8qDZdKbx3LGy3mNzv5tFfTcaw0BpNfjho=;
        b=S4w9oNF+EvjY9E8ieXKohhVy3yM6p8sqZU08kaha3lSdG9c4wt5XXIa2Lv72fiMBWn
         zE4kp+uMRXPT2Gab7gqL15UIeKFVlwdjYUhtU9u07qjOIm/LL7Ij2RGIGFn3TgKTiLdO
         JnZUnu67N08l97MQkxuij3/gDkhKZuJyY1XnsQxUsT0RJqS4J+TlqX4iZFKV4qbXyH4Q
         kwZ+hBn0R/+1Kk/7uYhPiFfNYIulYKCKZSZ8Ps0xsYQdF8/CKK6XqCfSVYB6b0cbeuBE
         YIAwjEktq95a8mLCK5yJB/ZJG61lzSYr9DhOw+wAOn98DucIP9mD71Q1TnOy9WoUp/8Z
         yyZA==
In-Reply-To: <20220321212750.GB24574@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Florian Westphal <fw@strlen.de>
Cc: netfilter <netfilter@vger.kernel.org>, netfilter-devel@vger.kernel.org, pablo@netfilter.org

Hi Florian

Look good this config but not work after set user not limit by speed.


table inet nft-qos-static {
        set limit_ul {
                typeof ip saddr
                flags dynamic
                elements =3D { 10.0.0.1 limit rate over 5 mbytes/second =
burst 6000 kbytes, 10.0.0.254 limit rate over 12 mbytes/second burst =
6000 kbytes }
        }
		set limit_dl {
                typeof ip saddr
                flags dynamic
                elements =3D { 10.0.0.1 limit rate over 5 mbytes/second =
burst 6000 kbytes, 10.0.0.254 limit rate over 12 mbytes/second burst =
6000 kbytes }
       }

        chain upload {
			type filter hook postrouting priority filter; =
policy accept;
			ip saddr @limit_ul drop
        }
		chain download {
			type filter hook prerouting priority filter; =
policy accept;
			ip saddr @limit_dl drop
		}
}


With this config user with ip 10.0.0.1 not limited to 5 mbytes ,=20


When back to this config :

table inet nft-qos-static {
	chain upload {
		type filter hook postrouting priority filter; policy =
accept;
		ip saddr 10.0.0.1 limit rate over 5 mbytes/second burst =
6000 kbytes drop
	}

	chain download {
		type filter hook prerouting priority filter; policy =
accept;
		ip daddr 10.0.0.1 limit rate over 5 mbytes/second burst =
6000 kbytes drop
	}
}


User is limited  perfect.

may be i miss something?


Martin

> On 21 Mar 2022, at 23:27, Florian Westphal <fw@strlen.de> wrote:
>=20
> Martin Zaharinov <micron10@gmail.com> wrote:
>> if have 1k rule
>>=20
>> table inet nft-qos-static {
>>        chain upload {
>>                type filter hook postrouting priority filter; policy =
accept;
>>                ip saddr 10.0.0.9 limit rate over 12 mbytes/second =
burst 50000 kbytes drop
>> .........
>> ip saddr 10.0.0.254 limit rate over 12 mbytes/second burst 50000 =
kbytes drop
>>        }
>=20
> 1k rules? Thats insane.  Don't do that.
> There is no need for that many rules, its also super slow.
>=20
> Use a static/immutable ruleset with a named set and then add/remove =
elements from the set.
>=20
> table inet nft-qos-static {
> 	set limit_ul {
> 		typeof ip saddr
> 		flags dynamic
> 		elements =3D { 10.0.0.9 limit rate over 12 mbytes/second =
burst 50000 kbytes, 10.0.0.254 limit rate over 12 mbytes/second burst =
50000 kbytes }
> 	}
>=20
> 	chain upload {
> 		type filter hook postrouting priority filter; policy =
accept;
> 		ip saddr @limit_ul drop
> 	}
> }
>=20
> static ruleset: no need to add/delete a rule:
>=20
> nft add element inet nft-qos-static limit_ul "{ 10.1.2.4 limit rate =
over 1 mbytes/second burst 1234 kbytes  }"
> nft delete element inet nft-qos-static limit_ul "{ 10.1.2.4 limit rate =
over 1 mbytes/second burst 1234 kbytes }"
>=20
> You can add/delete multiple elements in { }, sepearate by ",".
>=20

