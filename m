From: Jags <TheJags@protonmail.com>
Subject: Re: How can I block all traffic from an IP range, irrespective of origin, going to, or coming from, using nftables in Debian 10
Date: Fri, 04 Oct 2019 09:45:33 +0000
Message-ID: <caAb8jKSxb6sL49NLsEuMiqcr87ZCzfsFPLGnHT1VkqjcyKkf-fBozz-gcVljJRRoeyTolYe-Ou2H2P8BrIS7l--UXO18hA-4499YWMajtw=@protonmail.com>
References: <NQw8Zn-Cr6DOqlayaUmuautcCgywjg96aFaMt1t0b-YRpyo0_DvByE3-RTNVC5S80qFIYbSNVGesY3XCvGxrLlYG__BFEBaDJ_XvIa0hREI=@protonmail.com>
 <f9f3c860-5b3f-a09a-ff25-375378c3715b@trustiosity.com>
Reply-To: Jags <TheJags@protonmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=default; t=1570182340;
        bh=cPQ3lRyRjXYpdb4HIb1mS6uMre9vT4EvHJ7e/YBNAqQ=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:
         Feedback-ID:From;
        b=ruru4r0p4yMCGtTthHFarFKuAmeFtVkKvq3LjN3q/ulkEQNSF9iC1OXT7M8EYjfTH
         qQU2zwSbLFfkqAuheNJ5ThR3VMRbjCM4c8vzmI+UZnjA0aoMtrLEV8aiCqx+42eK1V
         +q9M7N9oSpyGSIn7wnhczq0MK+kV/fPpQdhokNO8=
In-Reply-To: <f9f3c860-5b3f-a09a-ff25-375378c3715b@trustiosity.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: zrm <zrm@trustiosity.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

@zrm  thank you so much for the reply.


(1) Would it be something like this:

:::::
chain output {
                type filter hook output priority 0; policy accept;

                ip daddr 123.0.0.0/8 ct state established,related,new,inval=
id,untracked counter reject
    }
:::::

Because just last night I tried that, but I could still see IPs from the bl=
ocked range. Or am I missing something here.

Note: In this OUTPUT chain, if I change: "policy accept" to "policy drop", =
I lose the internet completely.


(2) In addition to the OUTPUT chain, I've added this into INPUT chain too:

:::::
chain input {
                type filter hook input priority 0; policy drop;

                ip saddr 123.0.0.0/8 ct state established,related,new,inval=
id,untracked counter drop
    }
:::::


So how should I modify the either or both of the above please... many thank=
s.







=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90 Original Me=
ssage =E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90=E2=80=90
On Thursday, October 3, 2019 7:00 PM, zrm <zrm@trustiosity.com> wrote:

> On 10/1/19 19:22, Jags wrote:
>
> > hello everyone,
> > I would like to block all traffic from an IP range (e.g.: 123.0.0.0/8),=
 irrespective of its origin, going to, or coming from, using nftables firew=
all in Debian 10.
> > If I understand correctly, the following will block traffic originating=
 from that IP range.
> > nft insert rule ip filter INPUT ip saddr 123.0.0.0/8 counter drop
> > But it will still allow traffic if it's in response to (or associated w=
ith) an application on my Debian machine.
> > The problem: When I run a torrent client and add any torrent, be it Deb=
ian/Ubuntu ISO or any other torrent, I can see a bunch of IPs from my ISP c=
onnects to the torrent.
> > Even if I add a torrent that have only 1 seed and no peer at all, I can=
 see a lot of IPs from my ISP (with zero percent of torrent availability) i=
n qBittorrent client. In fact, I have blocked like 100+ in qBittorrent but =
the new IPs still keep popping up under "peers".
> > So I'd like to block an IP range, irrespective of traffic origin, going=
 to, or coming from, using nftables.
> > Thanks a lot in advance.
>
> A torrent client could try to connect to a peer in either direction, so
> if you don't want communication with that IP range at all then you would
> also want a rule to drop packets in the OUTPUT chain with that address
> range as the daddr. You may also want to use reject rather than drop in
> that case because the then the client will figure out that the peer is
> not available faster.


