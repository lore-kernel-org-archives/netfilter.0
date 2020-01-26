From: =?UTF-8?Q?Lars_Nood=c3=a9n?= <lars.nooden@gmx.com>
Subject: Re: Bulk loading of IP addresses or subnets in nftables?
Date: Sun, 26 Jan 2020 18:43:26 +0200
Message-ID: <382e1060-194b-3fbf-8fa8-25e8332a92e6@gmx.com>
References: <8856312f-553c-f751-bd0b-aa230fda6d11@gmx.com>
 <199029b9-994b-421a-7a6f-ff27d9944970@plushkava.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1580057007;
        bh=27Ze3uYB0os81J6LzCnN9h7VJ5kqsBOEoaU4kZS8QkQ=;
        h=X-UI-Sender-Class:To:References:From:Subject:Date:In-Reply-To;
        b=Ny6L3a+5iqXpmafocACc3HGckhDU3lJvWs9B89ZIIndIqWHxhXmnyKLSdJ5PMY0Ls
         ekef+xvKpkUv+jCXSA3m1T0URlTCrMJ065Z90AjPH4RH7/1FsE2setjHnK48XiHBbP
         0Rizm0h2azWv7sPmDc0SPlNEwhzRmgtNL1dd6mBs=
In-Reply-To: <199029b9-994b-421a-7a6f-ff27d9944970@plushkava.net>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Linux Netfilter Users List <netfilter@vger.kernel.org>

On 1/26/20 1:36 PM, kfm wrote:
> On 26/01/2020 04:18, Lars Nood=C3=A9n wrote:
>> In nftables, I'd like to apply a rule or set of rules to a very large
>> number of IP addresses and subne> [snip]
> It matters. Rather than individual rules, you should definitely use a
> set if you can.
> [snip]

Thanks for the details.  That helped and now I have a working filter
based on a set.  It needed "flags interval;" as you said.  Since I fed
it the output from a whois search on an AS number, I also had to use
"auto-merge" to fold overlapping subnets onto each other.

	set foo4 {
                type ipv4_addr
                flags interval
                auto-merge
                elements =3D { ..., ..., ... }
	}

There were a lot of warnings about overlap as the subnets were fed in
but the result seemed that the minimum had been calculated (I think).

	whois -h whois.radb.net '!gAS.....' \
	| tr ' ' '\n' \
	| grep -E '([0-9]{1,3}\.){3}' \
	| sort -t . -k1,1n -k2,2n -k3,3 -k4,4 \
	| xargs -I% nft element ip filter foo4 { % }

/Lars

