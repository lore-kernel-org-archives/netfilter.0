From: Sven-Haegar Koch <haegar@sdinet.de>
Subject: Re: What is localnet?
Date: Thu, 5 Jul 2012 20:59:52 +0200 (CEST)
Message-ID: <alpine.DEB.2.02.1207052059010.5284@aurora.sdinet.de>
References: <CAHEKYV6iST2_rFqaEUibAZqGG2jwUhMHUP3ve7xro-UgjrtTNw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAHEKYV6iST2_rFqaEUibAZqGG2jwUhMHUP3ve7xro-UgjrtTNw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauricio Tavares <raubvogel@gmail.com>
Cc: Netfilter <netfilter@vger.kernel.org>

On Thu, 5 Jul 2012, Mauricio Tavares wrote:

> When I check my deed, instead of having 10.0.0.0/24 or even intnet, I
> get localnet:
> 
> iptables -L -t nat
> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination
> FORWARDS   all  --  anywhere             firewall.fake.domain.com
> SUBNETFWD  all  --  192.168.42.0/24      firewall.fake.domain.com
> SUBNETFWD  all  --  localnet/24          firewall.fake.domain.com
> SUBNETFWD  all  --  192.168.22.0/24      firewall.fake.domain.com

I suspect from your /etc/networks (or maybe even /etc/hosts).

c'ya
sven-haegar

-- 
Three may keep a secret, if two of them are dead.
- Ben F.
