From: Gordon Fisher <gordfisherman@gmail.com>
Subject: Re: Trying to provision flowtable returns error
Date: Tue, 10 Nov 2020 07:04:17 -0800
Message-ID: <5FAAABF1.8060407@gmail.com>
References: <CANf9dFMdBgdn5k9fd5QX15kiAbVhQFqAfOBXUj64=wy6a9buBg@mail.gmail.com> <20201105005345.GA4263@dimstar.local.net> <CANf9dFMFqjp7MJQy5B52sz3PVc5wm5DWRMrKKGKtqL9n6rXWYw@mail.gmail.com> <20201105153822.GE15770@breakpoint.cc> <CANf9dFP5fzK7N3eQ3KyW=zC22dpfMuf=yxX7B9dqTpnb0mThLA@mail.gmail.com> <20201105170754.GB25824@breakpoint.cc> <CANf9dFM7_P2CJ-zHsTjOwZtAtgkBUMsYEjr_qFu9gm-ibasDZw@mail.gmail.com> <CANf9dFPaiLP-fJVHtKxG2aFO-Q18rEnNgwN4Yoqut4je5wZaig@mail.gmail.com> <20201105210146.GA10732@salvia> <CANf9dFPDXiO3kYa-=UzknyjCcu4Y5tEkZZnQP9GhD9VG=OcFBw@mail.gmail.com> <20201106105833.GA13845@salvia> <CANf9dFNjO+912xTqgheHRB2wqbstMXNv2+VFV6L+QxyyTLVUgA@mail.gmail.com> <CANf9dFPU8e8OC5aJci-0D+awcyNpKL+tCkCZi+0TUZjQ1=p9xg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-transfer-encoding;
        bh=+I6rhTf+6wN+ekXVtdbq6RyVR6moklMz/i9H8ckdb0Q=;
        b=k0h/bYhZMTDfAIxjZxtu1T+KdSNX0bq/leoDlxsy+tIwLxLoNNvPwwLA7WtYQPncAJ
         KoGjSWOZSUrzpESBonDxeH3+wtdQPEB3h1xXfL/F9XAUiu/9MSagmjn69nvbGw6J8Rpy
         SlrV3+p/paFC/LaFTVvu5aA+OaM9rRvChuSqu+H1gtakKHM2B9mPIBX1UTWexJsh25Hl
         3vb7wBKwc5vCgxNz0F8JzeYdiUhyNN7A/pRX3J9bnpvGGCAm478w86q41cfLHRdl73zi
         z+V5bk1cxU35TyD5JB1x+3LdUggVAlqD3G2fUQ+V3oPUbiiCNHxPZ8FG5vvNZXINVFWl
         c9jA==
In-Reply-To: <CANf9dFPU8e8OC5aJci-0D+awcyNpKL+tCkCZi+0TUZjQ1=p9xg@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 11/6/2020 7:24 AM, Martin Gignac wrote:
> I think I just answered my previous question:
>
>> Does prepending the "more destructive" 'flush ruleset' statement at
>> the very beginning of the 'firewall.nft' file still honor the
>> "atomicity" guarantee of running 'nft -f' again this file, or is this
>> guarantee only honored when prepending 'flush table' statements? In
>> other words, is there a minute period after running 'flush ruleset' in
>> my file where the node is unprotected?
> According to https://wiki.nftables.org/wiki-nftables/index.php/Operations_at_ruleset_level:
>
>      BACKUP/RESTORE
>
>      You can combine these two commands above to backup your ruleset:
>
>      % echo "nft flush ruleset" > backup.nft
>      % nft list ruleset >> backup.nft
The above could also be condensed into a single line (assuming a 
Bourne-based shell):

$ { echo 'nft flush ruleset'; nft list ruleset; } > backup.nft

Which can be useful for writing backup.nft in one go.

>      And load it atomically:
>
>      % nft -f backup.nft
>
> I interpret this to mean that my original method of doing things is as
> atomic as using 'flush table <tablename>', even if it is more
> destructive. I guess going forward I will have to make sure to prepend
> 'flush table' statements for every individual table I refer to in my
> 'firewall.nft' file.
-- 
gfish
