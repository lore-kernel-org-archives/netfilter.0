From: Florian Westphal <fw@strlen.de>
Subject: Re: Trying to provision flowtable returns error
Date: Thu, 5 Nov 2020 18:07:54 +0100
Message-ID: <20201105170754.GB25824@breakpoint.cc>
References: <c382354e-4a18-0863-e006-0db6f9fce1f6@heinlein-support.de>
 <CANf9dFMdBgdn5k9fd5QX15kiAbVhQFqAfOBXUj64=wy6a9buBg@mail.gmail.com>
 <20201105005345.GA4263@dimstar.local.net>
 <CANf9dFMFqjp7MJQy5B52sz3PVc5wm5DWRMrKKGKtqL9n6rXWYw@mail.gmail.com>
 <20201105153822.GE15770@breakpoint.cc>
 <CANf9dFP5fzK7N3eQ3KyW=zC22dpfMuf=yxX7B9dqTpnb0mThLA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANf9dFP5fzK7N3eQ3KyW=zC22dpfMuf=yxX7B9dqTpnb0mThLA@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Gignac <martin.gignac@gmail.com>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org

Martin Gignac <martin.gignac@gmail.com> wrote:
> Hi Florian,
> 
> OK, I understand now.
> 
> - on RHEL/CentOS 8 I *was* using existing network interfaces, but
> there are *no* nf_flow kernel modules available, and
> - on Fedora 30/33 there *are* nf_flow kernel modules available, but I
> was *not* using existing interface names
> 
> Both cases give off the same error message, which confused me.

Yes, I agree its confusing. In first case its because module isn't found and
in second case its the interface names that could not be found.

> In Fedora the systemd
> unit file for the nftables.services states that nftables should start
> before the network.pre-target:
[..]

> At this stage Network Manager hasn't even begun to initialize, much
> less create any logical interfaces.

Sure.  I think the systemd default is sane though.

> Or is there another way that I am not seeing?

Can't nm execute some action when an interface comes up?
That way you could just add the flowtable later.
