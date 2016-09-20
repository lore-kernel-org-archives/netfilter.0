From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: rate limit not working ?
Date: Tue, 20 Sep 2016 13:14:14 +0200
Message-ID: <eb5fc335-baaa-852e-0d56-24909d87eec6@c-s.fr>
References: <a6f9f673-8c5b-4a95-ea38-4fb8b39d4dc8@c-s.fr>
 <20160920081341.GA2328@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <20160920081341.GA2328@salvia>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org



Le 20/09/2016 =E0 10:13, Pablo Neira Ayuso a =E9crit :
> On Fri, Sep 16, 2016 at 06:50:22PM +0200, Christophe Leroy wrote:
>> Hi
>>
>> I tried to limit ping flooding by setting the following rule:
>>
>> nft add rule filter input icmp type echo-request limit rate 10/second ac=
cept
>
> This is matching packets under the rate, so packets under the rate are
> accepted.
>
> Your next rule, or default policy, should drop, so packets over the
> rate are dropped.
>
> You can invert this logic via:
>
>  # nft add rule filter input icmp type echo-request limit rate over 10/se=
cond drop
>

That didn't work either, but in fact I found the issue: I have a rule=20
'ct state established, related accept' earlier in the ruleset, so only=20
the first ping packet reached the rate limitation rule.

Putting the rate limitation rules before that ct state rule, it works as=20
expected.

Thanks for your help

Christophe
--
To unsubscribe from this list: send the line "unsubscribe netfilter-devel" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
