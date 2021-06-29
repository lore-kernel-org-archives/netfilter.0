From: Florian Westphal <fw@strlen.de>
Subject: Re: libnetfilter_queue: Access conntrack info
Date: Tue, 29 Jun 2021 08:38:02 +0200
Message-ID: <20210629063802.GD24271@breakpoint.cc>
References: <CAFqmWq_4_8ubgpfdEfhhQ=+7YbKCrPp=aTXsixAeYrK5VA+B2w@mail.gmail.com>
 <YNqDW5tRMVkjrXfC@slk1.local.net>
 <CAFqmWq-kOQbjQ=tNWGuk=+yOtuoG98cvRueoT5oK_zNHy8Jfvw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAFqmWq-kOQbjQ=tNWGuk=+yOtuoG98cvRueoT5oK_zNHy8Jfvw@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Psyspy 22 <psyspy2020@gmail.com>
Cc: netfilter@vger.kernel.org

Psyspy 22 <psyspy2020@gmail.com> wrote:
> Hello Duncan,
> 
> I actually need connmark and other conntrack fields like secmark etc.
> I think attr[NFQA_CT] is the correct way to access it but it's empty
> in my case.
> The libnetfilter_queue example sets connmark but doesn't show a way to
> get connmark from the packet.

IIRC you need to set NFQA_CFG_F_CONNTRACK in NFQA_CFG_FLAGS when setting
up the queue.  The example only sets F_GSO, so no conntrack info is
added.
