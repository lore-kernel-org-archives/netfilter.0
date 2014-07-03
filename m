From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: errors found in nftable docs on wiki
Date: Thu, 3 Jul 2014 17:23:25 +0200
Message-ID: <CAOkSjBjc7axZnrt6eHh=991pdCUwpkCFOG8fBAeE_2b4jB98cg@mail.gmail.com>
References: <CALLvB8LPbBQpGD-QAmPW3L9GT6CYZ2TAMh+E9koYBq7OWBUCkw@mail.gmail.com>
 <20140629101250.GA3615@localhost> <CALLvB8K7dnprfQdozF1RCsUhiy_hjp3A09T8M9U+BRVNkKA+Gg@mail.gmail.com>
 <CAOkSjBhBVBLHWWNRC7qZrks0ug_qQ8RH9g_gJQGDA6vZPcNqLA@mail.gmail.com>
 <CALLvB8KbqmQT1YQLj9D8mD=wuxW4CY6DkWirP8za4iPZ067d0Q@mail.gmail.com>
 <CAOkSjBjcz=+h0dxQHPS4Q1vjA-WGKmGEHeeNcNePKprDSWTroQ@mail.gmail.com> <CALLvB8JGB4rLF2qu_RduY=OOr4+B6aVOF2Oybnuoj8+2udMMHw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=fWmYIMeP8D5KVLI3Bv3SL3OJfCtmSFxEAud1/sEX948=;
        b=tZK6jNjDPeWtTKyNyy+zJcow+hk85+6xKudLSwxlOAdP72jAZiPXjnxnpG+CB5reLk
         eMtvym+HYultCPM3JwjlpSCYJStm2CsPH/fYWLqD6CwJJyqRHSDchRxYW+maWvfA9NnX
         BYBco/dQIVRHpLU0v4B3scqZN0ZTDF0CYYcSZussZAT7annf9LNTVIFY9gXxlv7knF3K
         yga7nlRKBmYzs5MBbPE2Lzh/pq2tT0CFNiEC37mhyXU5yNmVnbBBXPfeLSTIjt4O6R1C
         tSIT97M6z0lKdbV1R5MwREdiKzTB6Bg1GI90JqlJkHZb3Dgs9LqL7Klvd9IwJ8nOrl+n
         tPEQ==
In-Reply-To: <CALLvB8JGB4rLF2qu_RduY=OOr4+B6aVOF2Oybnuoj8+2udMMHw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Jonathan Johnson <ecybernard@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 3 July 2014 02:55, Jonathan Johnson <ecybernard@gmail.com> wrote:
> after:
> nft add rule blackhole chain1 ip saddr @set1 counter accept
>
> result:
>
> nft[23409]: segfault at 7f8f5b809bbe ip 00007f8e9fe71f4e sp
> 00007fff6829d178 error 4 in libc-2.18.so[7f8e9fde2000+1a5000]
>
> after that I proceeded to populate the list and got additional errors=
=2E
> I used:
> for i in `cat all3.txt`;do nft add element blackhole set1 { $i };done
>
> To start loading in my 30,000+ enteries.
>
> nft: src/netlink.c:205: alloc_nft_setelem: Assertion `expr->ops->type
> =3D=3D EXPR_MAPPING' failed.
> Aborted
>
> Eventually, after a few hundred it completes.  Does nft support cidr
> (1.1.1.0/24) notation?
>
> So I guess the segmentation fault is my last problem.
>

Ok, let's trace the problem. Maybe you are hitting a bug :)

1) Please, send the version of the kernel, nftables, libnftnl, libmnl
and the name of your distro.
2) Please, rerun the command with valgrind, and send here the result.
  # valgrind nft add rle blackhole chain1 ip saddr @set1 counter accept
3) I note now that I named 'blackhole' the table, while in your
original mail, you named 'blackhole' the set. Please, check that.

Please, give us a bit of more info so we can be more helpful.

Thanks, regards.
--=20
Arturo Borrero Gonz=C3=A1lez
