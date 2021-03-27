From: <paul.guijt@gmail.com>
Subject: RE: Creating named set
Date: Sat, 27 Mar 2021 10:41:08 +0100
Message-ID: <04bc01d722ed$50cc2a70$f2647f50$@gmail.com>
References: <037901d72265$3e58d790$bb0a86b0$@gmail.com> <20210326233151.GD8998@breakpoint.cc>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:references:in-reply-to:subject:date:message-id:mime-version
         :content-transfer-encoding:thread-index:content-language;
        bh=Hwx9gIsPEg8psFb1uNlt08S6h3oTOjkhyLwJJWXbKfA=;
        b=ow/rNhBaeQkrfJY0IBce/5AZtF7mV70oKgIIOURgazzoTtYkOhXbxOfZ2/VoStMylB
         PI9hWbthstVhBdtIfZjk74zWWcO1CxqPuMBPWj4RduPXfbCl3nNUr5smcXdHvs16Mjip
         tIF954TbdYqSaYMD9+YJopL02R2kLXk41080rEO65errR3vA5eMWsppQHl1P1GETVUPF
         gevLSqTJR5STsNbdBi+O/al1w0z9f1CNSPKYF8hIHT5KKqsjnM/lp4r+ugw6K/PIakdG
         MA72L7BOLN1Y3jO7jUCbobUGoMYNfW1AX7CQA/5W3KQN6bTu/HG0GaTBroCCHv0Z6USx
         g9Hg==
In-Reply-To: <20210326233151.GD8998@breakpoint.cc>
Content-Language: nl
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Thanks.=20

This morning I had a brainwave, and inserted it into /etc/nftables.conf:

> #!/usr/sbin/nft -f
> flush ruleset
>
> table inet filter {
>
>         set blocklist { type inet_proto ; flags timeout ; }
>
>         chain input {
>                 type filter hook input priority 0;      policy drop;
 >        }
>         chain forward {
>                 type filter hook forward priority 0;    policy drop;
>         }
>         chain output {
>                 type filter hook output priority 0;     policy accept;
>         }
>
> }
>
> include "/etc/nftables/include/*.nft"

Nft accepted it.=20

Best wishes, stay safe,
Paul

-----Original Message-----
From: Florian Westphal <fw@strlen.de>=20
Sent: Saturday, March 27, 2021 12:32 AM
To: paul.guijt@gmail.com
Cc: netfilter@vger.kernel.org
Subject: Re: Creating named set

paul.guijt@gmail.com <paul.guijt@gmail.com> wrote:
> Hi all,
> On Raspbian I tried:
> 	sudo nft add set inet filter blocklist { type inet_proto \; flags =
timeout \; }
> 	Error: Could not process rule: No such file or directory
> 	add set inet filter blocklist { type inet_proto ; flags timeout ; }
 	             ^^^^^^
> I have tried all sorts of syntax, but every time that error comes up. =
Even with =E2=80=9C% nft add set ip filter blackhole { type =
ipv4_addr\;}=E2=80=9D from the wiki.=20
> I have an inet table, and in it I want to drop anything coming from =
@blocklist. Can anyone please hand me the correct syntax, either for =
command line (sudo nft =E2=80=A6) or for a rules file?=20

This syntax is fine.  The error comes from the kernel.
Either no 'inet filter' table exists, or your kernel lacks set =
functionality.

