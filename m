From: Jonathan Johnson <ecybernard@gmail.com>
Subject: Re: errors found in nftable docs on wiki
Date: Wed, 2 Jul 2014 19:55:38 -0500
Message-ID: <CALLvB8JGB4rLF2qu_RduY=OOr4+B6aVOF2Oybnuoj8+2udMMHw@mail.gmail.com>
References: <CALLvB8LPbBQpGD-QAmPW3L9GT6CYZ2TAMh+E9koYBq7OWBUCkw@mail.gmail.com>
 <20140629101250.GA3615@localhost> <CALLvB8K7dnprfQdozF1RCsUhiy_hjp3A09T8M9U+BRVNkKA+Gg@mail.gmail.com>
 <CAOkSjBhBVBLHWWNRC7qZrks0ug_qQ8RH9g_gJQGDA6vZPcNqLA@mail.gmail.com>
 <CALLvB8KbqmQT1YQLj9D8mD=wuxW4CY6DkWirP8za4iPZ067d0Q@mail.gmail.com> <CAOkSjBjcz=+h0dxQHPS4Q1vjA-WGKmGEHeeNcNePKprDSWTroQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=w6j4pi49FvgFK8YmNboSmNPfK02AaCOpYM2yLsLHeBE=;
        b=izuGKWX314mxzR0YhJIpXm+zxFqAHEiJfeAE3YVluR/IHxqirdX/8UEVETmCGAAnKW
         dqQLDlC11yairZwL7lg374MElo9+xj0K8W6K7mwOW5UtNGz/2ibRnukGcSNp+gVopqIC
         0c9yxi5mx8/ruE9o+IzEu+oyf/RbECX0e2a0Y+jd2fRIluVefyAoX+4FTgN+758IYV7Y
         Hf1ndnPxy0u9Ofj96k2KSN6hzes0mHb2MxhZQUrKu0Ri6yQhry/2x03zWqu12rVp8GkR
         1njTS2GU1271wqaXqi5kxhESMKDIVQADsAESuvHX69OcN43PZ3QNP48vOEQqbEqLPkv+
         yuDg==
In-Reply-To: <CAOkSjBjcz=+h0dxQHPS4Q1vjA-WGKmGEHeeNcNePKprDSWTroQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

after:
nft add rule blackhole chain1 ip saddr @set1 counter accept

result:

nft[23409]: segfault at 7f8f5b809bbe ip 00007f8e9fe71f4e sp
00007fff6829d178 error 4 in libc-2.18.so[7f8e9fde2000+1a5000]

after that I proceeded to populate the list and got additional errors.
I used:
for i in `cat all3.txt`;do nft add element blackhole set1 { $i };done

To start loading in my 30,000+ enteries.

nft: src/netlink.c:205: alloc_nft_setelem: Assertion `expr->ops->type
=3D=3D EXPR_MAPPING' failed.
Aborted

Eventually, after a few hundred it completes.  Does nft support cidr
(1.1.1.0/24) notation?

So I guess the segmentation fault is my last problem.

Jonathan


On Wed, Jul 2, 2014 at 1:56 AM, Arturo Borrero Gonzalez
<arturo.borrero.glez@gmail.com> wrote:
> On 2 July 2014 06:44, Jonathan Johnson <ecybernard@gmail.com> wrote:
>> I tried to implement the syntax above with no luck.  I have no idea
>> what I am supposed to do, and I am blindly stabbing around with tria=
l
>> and error trying to figure this out.  Why don't you just provide me
>> with a complete example and make it easy for me?  All the examples I
>> find are broken,wrong, or incomplete.
>>
>
> Well, I just succesfully tested this:
>
> nft add table blackhole
> nft list table blackhole
> table ip blackhole {
> }
>
> nft add set blackhole set1 { type ipv4_addr\; }
>
> nft list table blackhole
> table ip blackhole {
>    set set1 {
>       type ipv4_addr
>    }
> }
>
> nft add element blackhole set1 {1.1.1.1, 2.2.2.2, 3.3.3.3}
>
> nft list table blackhole -nnn
> table ip blackhole {
>    set set1 {
>    type ipv4_addr
>       elements =3D { 3.3.3.3, 2.2.2.2, 1.1.1.1}
>    }
> }
>
> nft add chain blackhole chain1
> nft list table blackhole -nnn
> table ip blackhole {
>    set set1 {
>       type ipv4_addr
>       elements =3D { 3.3.3.3, 2.2.2.2, 1.1.1.1}
>    }
>
>    chain chain1 {
>    }
> }
>
> nft add rule blackhole chain1 ip saddr @set1 counter accept
> nft list table blackhole -nnn
> table ip blackhole {
>    set set1 {
>       type ipv4_addr
>       elements =3D { 3.3.3.3, 2.2.2.2, 1.1.1.1}
>    }
>
>    chain chain1 {
>       ip saddr @set1 counter packets 0 bytes 0 accept
>    }
> }
>
> --
> Arturo Borrero Gonz=C3=A1lez
