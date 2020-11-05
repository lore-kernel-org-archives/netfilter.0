From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Trying to provision flowtable returns error
Date: Thu, 5 Nov 2020 22:01:46 +0100
Message-ID: <20201105210146.GA10732@salvia>
References: <c382354e-4a18-0863-e006-0db6f9fce1f6@heinlein-support.de>
 <CANf9dFMdBgdn5k9fd5QX15kiAbVhQFqAfOBXUj64=wy6a9buBg@mail.gmail.com>
 <20201105005345.GA4263@dimstar.local.net>
 <CANf9dFMFqjp7MJQy5B52sz3PVc5wm5DWRMrKKGKtqL9n6rXWYw@mail.gmail.com>
 <20201105153822.GE15770@breakpoint.cc>
 <CANf9dFP5fzK7N3eQ3KyW=zC22dpfMuf=yxX7B9dqTpnb0mThLA@mail.gmail.com>
 <20201105170754.GB25824@breakpoint.cc>
 <CANf9dFM7_P2CJ-zHsTjOwZtAtgkBUMsYEjr_qFu9gm-ibasDZw@mail.gmail.com>
 <CANf9dFPaiLP-fJVHtKxG2aFO-Q18rEnNgwN4Yoqut4je5wZaig@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CANf9dFPaiLP-fJVHtKxG2aFO-Q18rEnNgwN4Yoqut4je5wZaig@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martin Gignac <martin.gignac@gmail.com>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org

On Thu, Nov 05, 2020 at 01:41:53PM -0500, Martin Gignac wrote:
> > However, this would only insert the flow table statements on server
> > bootup. Since '/etc/nftables/firewall.nft' ttself *wouldn't* contain
> > the flow tables statements, any 'systemctl reload nftables' or 'nft -f
> > /etc/nftables/firewall.nft' action (to apply a rule change, for
> > example) would essentially get rid of the flow tables mechanism from
> > the running system, wouldn't it?
> 
> I guess there's no "equivalent" of iifname/oifname for flow table
> devices where you could refer to a device that does not (yet) exist?

You can dynamically add/delete devices to/from flowtables since Linux
kernel 5.8
