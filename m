From: =?UTF-8?Q?Marek_Gre=C5=A1ko?= <mgresko8@gmail.com>
Subject: Re: nftables and connection tracking
Date: Sun, 21 Jun 2020 11:39:35 +0200
Message-ID: <CAChjPdT0xHfAy5+=Lf1ua6bSjiZxiH-=424Yb-GLHyrt5BL=Kw@mail.gmail.com>
References: <CAChjPdRd1xePA2fesrj8imCo9gfP_B5bko95MEGEwsAWVX6fjw@mail.gmail.com>
 <20200621080614.GK26990@breakpoint.cc> <CAChjPdQtKBGuUvdveCVc5kmhA+fgP4DUDNKhNd11KUVCKNUZLg@mail.gmail.com>
 <20200621090142.GL26990@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=0AwCdUa8uixL/UILZ3l9owx0jryJkyBPfZ1HULexXDA=;
        b=rOI0VOsTJ5lUpsChXlfyFFG+DGZSyc/Z9GkjbBgLwPSYSGLTdYTJ/VJbzpLaBmtqiU
         otMGIV7wn2ymCfHtruY7G1XQAfAOcDR22mvO9+y7ByQCAZf2Ka2bYc0hKmk0eU4vF3SY
         AfP7PJVmz82bJWzt6Sjn9VA8+aBYCGrnjdwGjGLq+4+UwF27CoesmLPcdH7c3TggjMy6
         Dt425WMyHBEIwkp3lcTacFS7XV/S5JN2tfuEv4w7gduJLXmBdx6uXa8ELXdWcf2F6kLS
         ZtDSKlkf3WJCxPIUUBmjbvoLYxkTshIU5gqa0HxC9K6omrL7hBzEyXmNSQEH48Fxw6bh
         6JUg==
In-Reply-To: <20200621090142.GL26990@breakpoint.cc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: netfilter@vger.kernel.org

Hello,

unfortunately the helper is not there:

conntrack -L | grep sip                     -> no output

It is strange, that if I use iptables-nft it is working. Some userspace pro=
blem?

Marek


2020-06-21 11:01 GMT+02:00, Florian Westphal <fw@strlen.de>:
> Marek Gre=C5=A1ko <mgresko8@gmail.com> wrote:
>> Hello,
>>
>> thanks for your help. Unfortunately, it does not work either.
>
> Please keep mailing list on CC.
>
>> table ip raw {
>>         ct helper sip {
>>                 type "sip" protocol udp
>>         }
>>
>>         ct helper ftp {
>>                 type "ftp" protocol tcp
>>         }
>>
>>         chain PREROUTING {
>>                 type filter hook prerouting priority raw; policy accept;
>>                 meta l4proto udp udp dport 5060 ct helper set "sip"
>>                 meta l4proto tcp tcp dport 21 ct helper set "ftp"
>>         }
>>
>>         chain OUTPUT {
>>                 type filter hook output priority raw; policy accept;
>>                 meta l4proto udp udp dport 5060 ct helper set "sip"
>>                 meta l4proto tcp tcp dport 21 ct helper set "ftp"
>>         }
>> }
>
> Looks good.
>
>> Still nothing.
>
> Hmm, give it worked with iptables it should work with nft too since
> the tracker is the same code.
>
> Try 'conntrack -L' and check if the udp flow has a helper assigned.
> You might need to flush the conntrack table to make it pick up the
> tracker (assigning it only works at the start of the connection).
>
