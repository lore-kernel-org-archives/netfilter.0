From: Liping Zhang <zlpnobody@gmail.com>
Subject: Re: nftables: masquerade sets wrong source address
Date: Wed, 21 Dec 2016 10:39:24 +0800
Message-ID: <CAML_gOfxzY9iWefK8Vw8kxYXNmOrZBmouO=PfMxtyz4jfp=13g@mail.gmail.com>
References: <CAEvi_o9_SJNGH-RWq6Kt+UiXVY4ozaMy3yJ2rPdV0Rbk1QrRZw@mail.gmail.com>
 <CAML_gOdZn8UmZzeDWd6q--U9+f+SzBLMppCEtdCFsZ4rrTZ24A@mail.gmail.com> <CAEvi_o-7soTh5vPqniCo76Szbf7J1y6nwwD-YqJ5uJvOYSeVHw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=W2OTIz8DuM7r3QcrGGFCLbb5MO7OTrG9VG3cGIxMdrQ=;
        b=bzxbHSBFXLrFMRUaHDlCtx0wJinY3LzjExF3Dsg1AKPCVYSgtB0BcMh3X1f+n8mhyq
         Vc/wg9YEyGJ14fgn5d7tv4N3E/Up2q+ge+a3xKYyVHhS9LLCZAaYiaWRJgKwUsnqdAcH
         Nbe7z0fBBYUczscuXemzRdf1Rdh/x9CXde8H3rSrzrKk8BD2+Llrzcrhk53jigOBmg7Y
         mK4syFjQ7QENXfYVpsNogDx+xK8wHi4Wm3wbuIDnIanY3QsnhlSGZx0jy5k3gMoT+JtX
         D7SVFMd+EIafW1HbnzfVh2jcHrL6L0OCnvRIupORUqldVJN4LsE2k4fh2qW5+NE811Qa
         Ma9Q==
In-Reply-To: <CAEvi_o-7soTh5vPqniCo76Szbf7J1y6nwwD-YqJ5uJvOYSeVHw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tom Hacohen <tom@stosb.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org, Netfilter Developer Mailing List <netfilter-devel@vger.kernel.org>

2016-12-20 23:16 GMT+08:00 Tom Hacohen <tom@stosb.com>:
> On Sat, Dec 17, 2016 at 2:18 PM, Liping Zhang <zlpnobody@gmail.com> wrote:
>> According to the explanations in nftables wifi:
>> https://wiki.nftables.org/wiki-nftables/index.php/Performing_Network_Address_Translation_(NAT)
>>
>> You should add the following nft rules(I agree this is tricky and
>> unfriendly for the end user):
>> # nft add chain nat prerouting { type nat hook prerouting priority 0 \; }
>>
>> But unfortunately,  even if you add the above rule, you will still fail to
>> connect to a local server.
>>
>
> Correct, doesn't change anything.
>
>> Now add another nft rules listed below, you can probably make everything
>> work fine:
>> # nft add chain nat output { type nat hook output priority 0 \; }
>>
>
> Haven't tried it. Why would it change things? Have you tried it?

I tried it and it did take effect. But my test scenario may be
different with yours.
So can you try it?

[...]
>> In iptables, nat output chain always exists, so there's no
>> such problem.
>>
>> But I think that enforcing the user to add a nat output chain
>> in nftables is not a good idea, so probably we need a following
>> patch(I only list the ipv4 part):
>
> Interesting. Maybe that's why it continued to work after iptables has
> already been loaded on the box.
> As said above though, I believe the problem is the masquerade setting
> the wrong ip, and not (only?)
> the fact that my setup happens to work with iptables but doesn't with nftables.

As I analyzed, the main difference is that nat OUTPUT hook always
exist in iptables, so the reply packet's destination ip address will be modified
in OUTPUT hook. While in nftables, without nft output chain, the reply packet's
destination ip address will be modified in PREROUTING hook. Then we try to
do routing lookup, and the packets will be dropped because the incoming packets'
destination ip address is 127.0.0.1

But I think that enforcing the user  to add the following nft rule is
not friendly:
# nft add chain nat output { type nat hook output priority 0 \; }

This will become more tricky. Do you agree with this?

So I send the related patch to try to improve it.

>
> Don't you agree?
>
> Thanks,
> Tom.
