From: Ricardo Katz <ricardo.katz@gmail.com>
Subject: 50k rules and performance issue in nft list table AND iptables-nft
Date: Fri, 14 Aug 2020 18:56:32 -0300
Message-ID: <CAG3fPQ4m9+Wbj3vKPmXbXa9-vH6ABq1eVNGGGzgbY_hNqGtdTw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=Y4RnaeEVKS9q8CGAp9tKuosuzVTxvyXzvUO6KG6gxJE=;
        b=FDDMuioGITpPFfK2L8Rc4lFTDPlHe4UOetvhK2MUL03aqwF08t97PMZk/FP1lywbV1
         l+7IDwAVzwCynvWTMah3IwVhyKMYGBVZbWwb3kfeOYHlKQJJLbnLm+ZdQOiItykQrmwX
         zi7G1Dch5evBR2rcKIcrm2AqrQzpQUXOt2UKWgMOhOAFhJi3ulgeeLNy9JtIIOymwKkt
         hjEbn1GhpOwyT8/GmYy6FEnZdYFhjKylkZ9RwOrv4cZH95DIXfn3krq6sp9OfeEZGB5i
         81bu7blWzvQ7YR4Mc7T5f9BwtRwT3XUZ30nP+ONhf0AZFLC/fTPJIq61Xr3TZzrYMZEZ
         9TSw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I've been digging into some performance issue I'm facing in my
production environment and would like to ask if someone has a light
about this.

My environment has ~50k rules that references some ipsets (it's a
Kubernetes cluster with Calico), and we've seen that sometimes
iptables-nft-save takes more than 20s. So I've tried to search what
was causing that, and have found some interesting behavior:

* iptables-nft-save performs better in newer kernels (5.4) than older
ones (4.19), but still the problem occurs
* nft list table performs WORST than iptables-nft-save, sometimes
taking more than 25s to display the rules. I've made the same test in
a non prod (less load) environment and it takes a little bit less but
yet, it's strange. The measured time is 4s in userspace and the rest
in kernel space, which leads me to ask: is there a way netlink should
be tuned? The production environment is not at its top load, but I'm
not going to focus in "nft" command right now.

So debugging iptables-nft-save I've seen that it walks through all the
rules to verify if they're compatible before printing them, something
like "4x nft_is_table_compatible (filter, raw, mangle, nat) -> X
nft_is_chain_compatible -> Y nft_is_rule_compatible -> Z
nft_is_expr_compatible that makes a string compare". This process
spends something like 5 to 7s in an average loaded environment.

After that, iptables-nft-save calls nft_rule_save which walks again
through the chains and rules, but this time to create them in the
format of iptables (nft_rule_print_save) spending some more kernel
time to get the content of the rule and print it.

I've seen a post
(https://developers.redhat.com/blog/2020/04/27/optimizing-iptables-nft-large-ruleset-performance-in-user-space/)
where there's some improvements into the userspace for the listing,
appending and deleting rule and being wondering: is this probably the
case also for iptables-nft-save, where it should have a cache and
iterate through it?

Also, if someone could provide some recommendations about checking if
this is a netlink pressure issue (this large time) or how can this be
improved. If further information is needed or anything I can help with
to improve this, please let me know.

Thank you!
