From: Martin Gignac <martin.gignac@gmail.com>
Subject: Re: Trying to provision flowtable returns error
Date: Fri, 6 Nov 2020 14:20:50 -0500
Message-ID: <CANf9dFN_8BOBacJjYUBJ2f=OE0QZXp-ZcAssnvURwetBt_XAkw@mail.gmail.com>
References: <20201105153822.GE15770@breakpoint.cc> <CANf9dFP5fzK7N3eQ3KyW=zC22dpfMuf=yxX7B9dqTpnb0mThLA@mail.gmail.com>
 <20201105170754.GB25824@breakpoint.cc> <CANf9dFM7_P2CJ-zHsTjOwZtAtgkBUMsYEjr_qFu9gm-ibasDZw@mail.gmail.com>
 <CANf9dFPaiLP-fJVHtKxG2aFO-Q18rEnNgwN4Yoqut4je5wZaig@mail.gmail.com>
 <20201105210146.GA10732@salvia> <CANf9dFPDXiO3kYa-=UzknyjCcu4Y5tEkZZnQP9GhD9VG=OcFBw@mail.gmail.com>
 <20201106105833.GA13845@salvia> <CANf9dFNjO+912xTqgheHRB2wqbstMXNv2+VFV6L+QxyyTLVUgA@mail.gmail.com>
 <CANf9dFPU8e8OC5aJci-0D+awcyNpKL+tCkCZi+0TUZjQ1=p9xg@mail.gmail.com> <20201106162147.GA3647@salvia>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PAOmWC3m3thQh7C7RzhB5NTe/yu9RiqzqpSJm4/ZHes=;
        b=ixV8XB6UDLHtyy3C1ulU7anMj237Nc6ZjjA2a6gipOBv5RgHKkhIDzblVFrXmP4l7q
         kiGOTfHOfOoigIainWHHzecrn1tc0C7hqUy+3edqnt1dhHsLsCcLNqbppyZES8gknHnT
         8BPCNrCORBhikUMLkdvN5JO/aZl0+wTHPd89Mlqzqn7OeuCqLtRuGls5rJHs43/F8as6
         LIahUt23u4YIVLLXgXVtTjH5tG4FwDCbvC6AKoyJfQ33Dsba8F+RFdPAFEQErQUQa48+
         orZwkY0UgyZquBbXAy1yLL47CU8oZqG2bRux67y7iG9jdqkzIfrRlKi3+LETsF48Mg9b
         r5aA==
In-Reply-To: <20201106162147.GA3647@salvia>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org

> Sorry, I'm getting a bit lost regarding what the problem is at this
> stage regarding the flowtable infrastructure.

I think the confusion stems from the fact that I have set up an
nftables workflow for myself that is "opinionated" and that doesn't
currently fit "out-of-the-box" with the way nft and flowtables
interact. I wrote a helper/wrapper program for myself that simplifies
nftables rules management by offering show, edit, check, commit, diff
and versioning functions to mimic the Juniper firewall behaviors that
I am accustomed to and find very convenient. Some of these functions
are plainly just front-ends to 'nft' commands, while some others (such
as diff and versioning) require more work in order to allow diffs and
versioning between both 'raw' /etc/nftables/firewall.nft files as well
as the 'compiled' (pretty-printed, comments removed) result of running
'nft' on these files. This workflow relied on assumptions that I had
made that my desire to integrate flow tables suddenly blew out of the
water. The "destructive" nature of 'flush ruleset' (which I was using
so far) was not an issue before, but with flow tables it suddenly
became one simply because I had not understood its reach. Had I been
using dynamic sets (which I hadn't so far) this likely would have
presented some issues too. But the fact that 'flush table' statements
_do_ exhibit the behavior that I had wrongly attributed to 'flush
ruleset', I now know that I have a way to use my program with flow
tables; I just need to code some logic to find out the existing table
names and generate the required 'flush table' statements as part of my
commit function.

What also doesn't help is that I'm probably not explaining myself
properly, and as a developer of nftables your intimate knowledge of it
is at odds with my amateurish understanding of it. :o)

Thanks to both of you for taking the time to answer, and for your work
on nftables!

Regards,
-Martin
