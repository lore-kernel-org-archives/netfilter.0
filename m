From: Florian Westphal <fw@strlen.de>
Subject: Re: [nft 0.9.3 | kernel 5.4.48] cannot get NAT to work
Date: Wed, 24 Jun 2020 00:48:54 +0200
Message-ID: <20200623224854.GU26990@breakpoint.cc>
References: <87b5491f-dbd3-1f09-a9cb-303596da4e10@gmx.net>
 <20200623212323.GS26990@breakpoint.cc>
 <cf63c2f8-3aaf-9af6-739e-8928b803fb8c@gmx.net>
 <20200623215239.GT26990@breakpoint.cc>
 <6e919ed9-50d9-7a23-a581-2c6110af5108@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6e919ed9-50d9-7a23-a581-2c6110af5108@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?B?0b3SieG2rOG4s+KEoA==?= <vtol@gmx.net>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

ѽ҉ᶬḳ℠ <vtol@gmx.net> wrote:
> It should work then but somehow does not, any way to figure out what is
> going wrong then? I would rather prefer not having to return to IPT.

Works for me on 5.6.18:
table inet nat {
        chain prerouting {
                type nat hook prerouting priority -100; policy accept;
        }

        chain input {
                type nat hook input priority 100; policy accept;
        }

        chain output {
                type nat hook output priority -100; policy accept;
        }

        chain postrouting {
                type nat hook postrouting priority 100; policy accept;
        }
}

load with nft -f.

If it doesn't work, try 'table ip nat' or 'table ip6 nat'.
