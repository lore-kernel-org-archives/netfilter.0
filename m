From: Florian Westphal <fw@strlen.de>
Subject: Re: libnetfilter_queue: Access conntrack info
Date: Tue, 29 Jun 2021 16:38:21 +0200
Message-ID: <20210629143821.GF24271@breakpoint.cc>
References: <CAFqmWq_4_8ubgpfdEfhhQ=+7YbKCrPp=aTXsixAeYrK5VA+B2w@mail.gmail.com>
 <YNqDW5tRMVkjrXfC@slk1.local.net>
 <CAFqmWq-kOQbjQ=tNWGuk=+yOtuoG98cvRueoT5oK_zNHy8Jfvw@mail.gmail.com>
 <20210629063802.GD24271@breakpoint.cc>
 <CAFqmWq-J8zkO8_nHUh=eS_AyhHJ6kAgPiODXu5wKNQM-d7TRLQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFqmWq-J8zkO8_nHUh=eS_AyhHJ6kAgPiODXu5wKNQM-d7TRLQ@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Psyspy 22 <psyspy2020@gmail.com>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org

Psyspy 22 <psyspy2020@gmail.com> wrote:
> Thanks Florian. I added that flag, no dice.
> 
> If  I run the libmnl dump example, it successfully prints all
> conntrack entries. I would assume all the conntrack related kernel
> modules are loaded. I am on 4.1 kernel. I could be missing something.

No idea.  attr[NFQA_CT] is set as expected on 5.12.12 when I enable
NFQA_CFG_F_CONNTRACK in example/nf-queue.c
