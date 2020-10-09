From: Florian Westphal <fw@strlen.de>
Subject: Re: Newbie: IPv6 equivalent of 192.168.178.0/24
Date: Fri, 9 Oct 2020 15:14:39 +0200
Message-ID: <20201009131439.GE5723@breakpoint.cc>
References: <021101d69e3a$b2ce88e0$186b9aa0$@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <021101d69e3a$b2ce88e0$186b9aa0$@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: paul.guijt@gmail.com
Cc: netfilter@vger.kernel.org

paul.guijt@gmail.com <paul.guijt@gmail.com> wrote:
> I had
> 	add rule  inet filter input ip   saddr 192.168.178.0/24         jump LocalIN
> 	add rule  inet filter input ip6 saddr fe::/10                             jump LocalIN
> to divert all packets coming from my private network to rules in the LocalIN chain. 
> 
> Nftables converts the second line into “ip6 saddr c0::/10 jump LocalIN”. FE into C0. 
> Will that do what I intended? If not, what rule do you prefer? 

Did you mean 'fe00::/10' ?
