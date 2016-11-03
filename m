From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Forward local traffic to another host with nftables
Date: Thu, 3 Nov 2016 17:25:15 +0100
Message-ID: <20161103162515.GA3651@salvia>
References: <5bcf965b-aa71-eb5d-ed1e-a9a6e2c405f6@bigur.ru>
 <20161031192429.GA1658@salvia>
 <2117c0fd-7d34-0cdb-1d9a-3cb41528ce80@bigur.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <2117c0fd-7d34-0cdb-1d9a-3cb41528ce80@bigur.ru>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Gennady Kovalev <gik@bigur.ru>
Cc: netfilter@vger.kernel.org

On Tue, Nov 01, 2016 at 12:36:39AM +0300, Gennady Kovalev wrote:
> 31.10.2016 22:24, Pablo Neira Ayuso wrote:
> >On Mon, Oct 31, 2016 at 08:33:57PM +0300, Геннадий Ковалёв wrote:  >> I
> >have linux box (external ip x.x.x.x; internal bridge (br0) ip >>
> 10.0.2.1) with lxc container (10.0.2.22). I want to translate local >> http
> packet with daddr to public ip to lxc container. I have put >> dnat rule to
> nat chain with output hook, and snat rule to nat table >> with postrouting
> hook: > From > https://wiki.nftables.org/wiki-nftables/index.php/Performing_Network_Address_Translation_%28NAT%29
> > > "You have to register the prerouting chain even if you have no rules
> >there since this chain invokes the NAT engine for the packets coming > in the input path."
> 
> Oh, I try to make example simple and make mistake in simple config. Another
> try:
> 
> root@sed:~# nft list ruleset
> table ip nat {
>         chain prerouting {
>                 type nat hook prerouting priority 0; policy accept;

I can also see priority numbers don't match the same we use in
iptables. This should be:

        priority -100

>         }
> 
>         chain output {
>                 type nat hook output priority 0; policy accept;
>                 oif lo ip daddr x.x.x.x tcp dport http counter nftrace set 1
> dnat 10.0.2.22
>         }
> 
>         chain postrouting {
>                 type nat hook postrouting priority 0; policy accept;

This should be:

        priority 100

>                 oif br0 ip saddr x.x.x.x counter snat 10.0.2.1
>         }
> }
> 
> And cuted tcpdump output:
> IP 10.0.2.1.36320 > 10.0.2.22.80: Flags [S], seq 2655320356...
> IP 10.0.2.22.80 > x.x.x.x.36320: Flags [S.], seq 1337026682, ack
> 2655320357...
> IP x.x.x.x.36320 > 10.0.2.22.80: Flags [R], seq 2655320357...
> 
> It looks like at reverse path ip changed by snat restored, but changed by
> dnat not.

Out of curiosity. Is iptable_nat load? If so, rmmod iptable_nat.
