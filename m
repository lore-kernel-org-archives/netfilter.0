From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: 50k rules and performance issue in nft list table AND
 iptables-nft
Date: Fri, 21 Aug 2020 13:20:49 +0200
Message-ID: <20200821112049.GA29905@salvia>
References: <CAG3fPQ4m9+Wbj3vKPmXbXa9-vH6ABq1eVNGGGzgbY_hNqGtdTw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAG3fPQ4m9+Wbj3vKPmXbXa9-vH6ABq1eVNGGGzgbY_hNqGtdTw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ricardo Katz <ricardo.katz@gmail.com>
Cc: netfilter@vger.kernel.org

Hi,

On Fri, Aug 14, 2020 at 06:56:32PM -0300, Ricardo Katz wrote:
> Hello,
> 
> I've been digging into some performance issue I'm facing in my
> production environment and would like to ask if someone has a light
> about this.
> 
> My environment has ~50k rules that references some ipsets (it's a
> Kubernetes cluster with Calico), and we've seen that sometimes
> iptables-nft-save takes more than 20s. So I've tried to search what
> was causing that, and have found some interesting behavior:
[...]
> * nft list table performs WORST than iptables-nft-save, sometimes
> taking more than 25s to display the rules. I've made the same test in
> a non prod (less load) environment and it takes a little bit less but
> yet, it's strange. The measured time is 4s in userspace and the rest
> in kernel space, which leads me to ask: is there a way netlink should
> be tuned? [...]

I have posted a patch to improve listing time:

https://patchwork.ozlabs.org/project/netfilter-devel/patch/20200821111438.5362-2-pablo@netfilter.org/

Thanks for reporting.
