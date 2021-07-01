From: Psyspy 22 <psyspy2020@gmail.com>
Subject: Re: libnetfilter_queue: Access conntrack info
Date: Thu, 1 Jul 2021 12:13:45 -0600
Message-ID: <CAFqmWq_UtswKNqexNZaBgi-mDEdZm8QizifhfN84m4N9ay2sMA@mail.gmail.com>
References: <CAFqmWq_4_8ubgpfdEfhhQ=+7YbKCrPp=aTXsixAeYrK5VA+B2w@mail.gmail.com>
 <YNqDW5tRMVkjrXfC@slk1.local.net> <CAFqmWq-kOQbjQ=tNWGuk=+yOtuoG98cvRueoT5oK_zNHy8Jfvw@mail.gmail.com>
 <20210629063802.GD24271@breakpoint.cc> <CAFqmWq-J8zkO8_nHUh=eS_AyhHJ6kAgPiODXu5wKNQM-d7TRLQ@mail.gmail.com>
 <20210629143821.GF24271@breakpoint.cc>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b8+pLWuZmBpuef2Nk7p4Nt8aYOS1o2rhVhIMMlouLh0=;
        b=t0Mm2adkE9OtIEoZ+x0pjlsel2300cf/+5vtMAQMWAGg45G8CoKNM57UhHEyPfuDhx
         v6EmWvDkaL5F1sMfygBkepTZyd4WruPWeI4bL9FFoQVKikkYvNVnFj9LUponG5fUasZW
         VKlhFMXeRMw+HrPvh60jMC76cNR+pC8TrMH+CCKgAisRshHNgYObPcf5VAd9CQyE8wQq
         WRaeUocH7/o6ifso9JuvzExcCKZ7vHrXjKmc/p85fP3wUW535F/n09EWag4mj7LoyaQS
         1FmA+0fIMlu8DxSBeINmYA6BSEXX3d4/bWjssRqpb4TVj+uypvUHZqdyh93dbks/zess
         GR/g==
In-Reply-To: <20210629143821.GF24271@breakpoint.cc>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org

Maybe I haven't set up iptables rules properly? This is the first rule
in INPUT table:
iptables -I INPUT -p udp -m udp --sport 10080 -j NFQUEUE --queue-num 5
--queue-bypass

Thanks!

On Tue, Jun 29, 2021 at 8:38 AM Florian Westphal <fw@strlen.de> wrote:
>
> Psyspy 22 <psyspy2020@gmail.com> wrote:
> > Thanks Florian. I added that flag, no dice.
> >
> > If  I run the libmnl dump example, it successfully prints all
> > conntrack entries. I would assume all the conntrack related kernel
> > modules are loaded. I am on 4.1 kernel. I could be missing something.
>
> No idea.  attr[NFQA_CT] is set as expected on 5.12.12 when I enable
> NFQA_CFG_F_CONNTRACK in example/nf-queue.c
