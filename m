From: "Eliezer Croitor" <ngtech1ltd@gmail.com>
Subject: RE: nftables map with numgen type, not sure if it was implemented?
Date: Thu, 24 Sep 2020 22:09:34 +0300
Message-ID: <002201d692a6$3ea3d8c0$bbeb8a40$@gmail.com>
References: <!&!AAAAAAAAAAAuAAAAAAAAAGg7dk9mYqJGhbBt3m/ghGwBAMO2jhD3dRHOtM0AqgC7tuYAAAAAAA4AABAAAABJQLj6e+mFSq/mTrWisCc4AQAAAAA=@gmail.com> <20200831152510.GB2725@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:references:in-reply-to:subject:date:message-id:mime-version
         :content-transfer-encoding:thread-index:content-language;
        bh=UkEDGZplgCiKpcNjdrkheh4kc1aNPYcQzVyrTgrP2fA=;
        b=Z7CpZZdC02voYwtKr3UQrVErdnB9oz56/swhYIWqsVEiJ8OeJQtxG9ciB0Jt3pkZwJ
         gHLB6QLEeQgFmf70RUsdYtHusYXKfgE1aHYaIPQPm+YgXeYNilCt0ZJ08FYh0IAEhu4X
         dw49qUDrPKr994IEAq7/Qqqq630rKOjs9TDlO/KXBNSMs2bQ5UxGV4Kw37u7U8nRwTWO
         MzKqgcU8LBrnQcyE/e1OsvmiukrCLtTZHG8iOXBLGdVg5elpB0RFhpLuZn76mJUpgad2
         XVyo+QM7sLvlsIPJLemPuI94QvLXz3U/mV6ZLU5vSP/xUA4GB56fxHTfwFCE4QbqJQy4
         Ue6A==
In-Reply-To: <20200831152510.GB2725@salvia>
Content-Language: en-us
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I am using 0.9.4:
https://pkgs.alpinelinux.org/package/v3.12/main/x86_64/nftables

I will try to verify this again later with alpine edge which has 9.6

Thanks,

----
Eliezer Croitoru
Tech Support
Mobile: +972-5-28704261
Email: ngtech1ltd@gmail.com

-----Original Message-----
From: Pablo Neira Ayuso <pablo@netfilter.org> 
Sent: Monday, August 31, 2020 6:25 PM
To: Eliezer Croitor <ngtech1ltd@gmail.com>
Cc: netfilter@vger.kernel.org
Subject: Re: nftables map with numgen type, not sure if it was implemented?

On Thu, Aug 27, 2020 at 06:34:35PM +0300, Eliezer Croitor wrote:
[...]
> lb-r4:/tmp# nft add map nftlb m2 '{ type typeof numgen random mod 2 :
> verdict; }'
> Error: syntax error, unexpected typeof add map nftlb m2 { type typeof 
> numgen random mod 2 : verdict; }
>                         ^^^^^^
[...]
> 
> Am I right for even trying it?

What nft version are you using?

typeof support was introduced in nft >= 0.9.4.

