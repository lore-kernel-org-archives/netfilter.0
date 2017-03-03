From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: iptables ip tracking buffer size?
Date: Fri, 3 Mar 2017 20:09:13 +0100
Message-ID: <3e539540-1bce-cc8b-1d1f-a04642b605a0@plouf.fr.eu.org>
References: <CAJV-0PdPVVBbMR+HcE5mjjkuKquR60c-n=D3b6N_j_+HK6wx6w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJV-0PdPVVBbMR+HcE5mjjkuKquR60c-n=D3b6N_j_+HK6wx6w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Matthew Sims <matt@simsweb.org>
Cc: netfilter@vger.kernel.org

Le 03/03/2017 à 19:20, Matthew Sims a écrit :
> Quick backstory. I recently took over an unused project from a co-worker
> who left over a year ago. The idea was to block IPs that reached a certain
> hit_count limit within a minute.
>
> When this was enabled, it worked...sort of. While iptables was keeping
> track of IPs, we weren't able to block when tests were performed.
>
> The reason had something to do with IPs in a "buffer pool" (??) were being
> knocked out when new IPs were tracked? I don't have the actual issue as he
> never documented it. I'm guessing that while iptables was keeping track of
> hit_counts, the list grew so big that it had to bump out IPs at the end of
> the list to track new ones.


You may be talking about the "recent" match.
The iptables or iptables-extensions manpage describes how to tune its 
table sizes.
