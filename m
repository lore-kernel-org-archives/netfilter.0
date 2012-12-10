From: =?UTF-8?B?5Y+26Zuo6aOe?= <sunyucong@gmail.com>
Subject: Re: Limits higher than 10000/sec
Date: Sun, 9 Dec 2012 20:56:51 -0800
Message-ID: <CAJygYd34t3r0H27+dO_+S54C4L73zb9M10W+W+qdSCPLKVa7Og@mail.gmail.com>
References: <CAFANWtU9aeFjgUvczjnCETxy4h01aFs6JnDcK_ikxz-ijJ=Adg@mail.gmail.com>
 <alpine.LNX.2.01.1212092341330.15774@nerf07.vanv.qr>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=CsCVe9vJhbXFykCv7ZNwMuxyqfNqfjY1Kc2Muhykb4c=;
        b=atyFxCPoJ6rex8h1dKt5Sx/83OLtNI3LmsaHb/jVaPOCWDMEq4AYKCMfgxnCmhH+5o
         1h6zSP0IAMEoG+YaplC2ugUsruvk8omHoQi64XKudbWsapNCsZfySz2QfvwQaq2AmKvX
         YuFQdcd/ADPXmdGf7wAZNpXilR2Dyyr/L9bwKiVdNhnFMN0FOTlu8TrnXGJSl5Eg/LuB
         MmDB4ryvn5RA4pu7OqLT1y9/XOZGL/Qp9HIMWOMEZUTWGEU1+RUM2IXZXMOAQd6sSpLr
         Mde8ne8yupPJq27Oz6xhM0CORbMTB/8KIWN+IXR60o86ZkG5yXfODOGCh6pzxepmww+Q
         yzSA==
In-Reply-To: <alpine.LNX.2.01.1212092341330.15774@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@inai.de>
Cc: Darius Jahandarie <djahandarie@gmail.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

you should look into hashlimit module, which allows you to limit base
on srcip, dst ip (or some combination of sort). which should provide
much better granularity for you.

On Sun, Dec 9, 2012 at 2:41 PM, Jan Engelhardt <jengelh@inai.de> wrote:
> On Sunday 2012-12-09 21:05, Darius Jahandarie wrote:
>
>>Hi all. I currently have an iptables rule like follows in the raw table:
>>
>>-A PREROUTING -p tcp --dport 1234 --syn -m limit --limit 10000/sec
>>--limit-burst 10000 -j ACCEPT
>>-A PREROUTING -p tcp --syn -j DROP
>>
>>Does anyone have thoughts on a way to get some sort of rate-limiting
>>(TBF or otherwise) that can handle more PPS than the limit module
>>while still being as efficient as possible?
>
>  -j RATEEST, -m rateest
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
